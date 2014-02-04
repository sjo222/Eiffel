note
	description : "simple-z3 application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

				cmd: STRING = "z3/z3.exe -smt2 simple.z3"
				dir: STRING = "z3"

	make
		local
				p: PROCESS
				pf : PROCESS_FACTORY
			do
				print("%N========================%N")
				print ("Hello Eiffel World!%N")
				create output.make_empty
				create pf
				p := pf.process_launcher_with_command_line (cmd, dir)
				p.redirect_output_to_agent (agent response(?))
				p.redirect_error_to_same_as_output
				p.launch
				p.wait_for_exit
				create proved.make (10)
				break_down_output
			end

	break_down_output
		local
				ls : LIST [STRING]
				tag : STRING
				error : BOOLEAN
		do
				ls := output.split ('%N')
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
					tag := ls.item.substring (3, ls.item.count)
					tag.trim
					ls.forth
					if not ls.off then
						proved [tag] := ls.item ~ "unsat"
						error :=
							not (	ls.item ~ "unsat"
								or	ls.item ~ "sat"
								or	ls.item ~ "timeout"
								or	ls.item ~ "unknown")
--						when "unsat" then
--							proved [tag] := True
--						when "sat" then
--							proved [tag] := False
--						when "timeout" then
--							proved [tag] := False
--						when "unknown" then
--							proved [tag] := False
--						else
--							-- report error
--						end
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

	output: STRING

	proved : HASH_TABLE [BOOLEAN, STRING]

	response (s: STRING)
		do
			if not s.is_empty then
	 			io.put_string ("%Nresponse from " + cmd  + " command in directory: " +dir)
	 			io.new_line
	 			io.put_string (s)
	 			output.append (s)
	 		end
 		end





end


