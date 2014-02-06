note
	description : "gelex-calculator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature -- Initialization

	cmd: STRING do Result := "z3/z3.exe -smt2 " + z3_input_file end
	dir: STRING = "z3"

	parser        	: SMT_PARSER
	src_input_file  : STRING = "test_smt_input_1.txt"
	z3_input_file 	: STRING do Result := src_input_file + ".z3" end
	report_file   	: STRING do Result := z3_input_file + "_report.txt" end

	z3_output : STRING
	proved    : HASH_TABLE [BOOLEAN, STRING]

	make
		local
			p  : PROCESS
			pf : PROCESS_FACTORY
			report : STRING
			conjecture : SMT_CONJECTURE
			tag : STRING
		do
			-- parse
			create parser.make
			parser.parse_file(src_input_file)

			-- generate input to Z3
			write_z3_input_to_file (dir + "\" + z3_input_file)

			-- run Z3
			create z3_output.make_empty
			create pf
			p := pf.process_launcher_with_command_line (cmd, dir)
			p.redirect_output_to_agent (agent response(?))
			p.redirect_error_to_same_as_output
			p.launch
			p.wait_for_exit
			create proved.make (10)
			break_down_output
			write_to_file (dir + "\" + z3_input_file + ".out", z3_output)

			-- analyze Z3's output and generate a report
			create report.make_empty
			report.append ("Results from running command %"" + cmd  + "%":%N")
			across proved as proof
			loop
				tag := proof.key
				trim_special_symbols (tag)
				conjecture := get_conjecture(tag)
				if proof.item then
					report.append (conjecture.pretty_print + " is a theorem")
				else
					report.append (conjecture.pretty_print + " is NOT a theorem")
				end
				report.append ("%N")
			end
			io.put_string (report)
			write_to_file (dir + "\" + report_file, report)
		end

feature -- auxiliary features
	write_z3_input_to_file(path: STRING)
		local
			z3_input : LINKED_LIST[STRING]
			negation : SMT_BOOL_EXP
		do
			create z3_input.make
			across parser.variable_declarations as exp
			loop
				z3_input.extend (exp.item.out)
			end

			across parser.conjectures as exp
			loop
				z3_input.extend (exp.item.out)
				z3_input.extend ("(push)")
				z3_input.extend ("(echo %"> conjecture " + exp.item.name + "%")")
				create {SMT_BOOL_NOT} negation.make(exp.item.exp)
				z3_input.extend ("(assert " + negation.out + ")")
				z3_input.extend ("(check-sat)")
				z3_input.extend ("(get-model)")
				z3_input.extend ("(pop)")
			end
			write_to_file(path, new_lines(z3_input))
		end

	new_lines (args: LINKED_LIST[STRING]) : STRING
		local
			i : INTEGER
		do
			create Result.make_empty
			across
				args
			as
				arg
			loop
				Result.append (arg.item)
				if i < args.count then
					Result.append ("%N")
				end
				i := i + 1
			end
		end

	write_to_file(path, text : STRING)
			-- write the given to the given file
		local
			file: PLAIN_TEXT_FILE
		do
			create file.make_open_write (path)
			file.put_string (text)
			file.close
		end

feature -- auxiliary features for processing z3
	trim_special_symbols(s: STRING)
		do
			s.replace_substring_all ("%R", "")
			s.replace_substring_all ("%N", "")
		end

	break_down_output
		local
				ls : LIST [STRING]
				tag : STRING
				error : BOOLEAN
		do
				ls := z3_output.split ('%N')
				from
					ls.start
					from
					until
						ls.off or else ls.item.starts_with ("> ")
					loop
						ls.forth
					end
				invariant
					ls.off or else ls.item.starts_with ("> ")
				until
					ls.off
				loop
					tag := ls.item.substring (14, ls.item.count - 1)
					tag.trim
					trim_special_symbols(tag)
					ls.forth
					if not ls.off then
						trim_special_symbols(ls.item)
						proved [tag] := ls.item ~ "unsat"
						error :=
							not (	ls.item ~ "unsat"
								or	ls.item ~ "sat"
								or	ls.item ~ "timeout"
								or	ls.item ~ "unknown")
						check not error end
					end
					ls.forth
					from
					until
						ls.off or else ls.item.starts_with ("> ")
					loop
						ls.forth
					end
				variant
					ls.count - ls.index + 1
				end
		end

	response (s: STRING)
		do
			if not s.is_empty then
	 			z3_output.append (s)
	 		end
 		end

 	get_conjecture (tag: STRING) : SMT_CONJECTURE
 		require
 			non_empty_conjectures: parser.conjectures.count > 0
 			conjecture_tag_exists:
 			across parser.conjectures as conjecture
 			some
 				conjecture.item.name ~ tag
 			end
 		do
 			Result := parser.conjectures[1]
 			across parser.conjectures as conjecture
 			loop
 				if conjecture.item.name.is_equal (tag) then
 					Result := conjecture.item
 				end
 			end
 		end
end
