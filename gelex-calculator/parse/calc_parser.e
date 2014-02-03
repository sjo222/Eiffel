-- a simple calculator
class CALC_PARSER 

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		end
		
	CALC_SCANNER
		rename
			make as make_scanner
		end

create 
	make
		
feature {ANY}


feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_string_value, yyvsp3)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval1: detachable ANY
			yyval2: INTEGER
		do
				inspect yy_act
when 1 then
--|#line 50 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 50")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 52 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 52")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 55 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 55")
end

		-- once we have an expression followed by an end-of-line, print and store the value of the expression
		
		io.put_string("Result= "+(yyvs2.item (yyvsp2)).out+"%N")
		result_val:=yyvs2.item (yyvsp2)
	
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 62 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 62")
end

-- assign the expression's value to the variable identifier by the given identifier
		variables[yyvs3.item (yyvsp3)]:=yyvs2.item (yyvsp2)
	
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 65 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 65")
end

		-- 'error' is a special pseudo-token that marks a rule that is a "back-out" point, that is if an
		-- error is encountered while parsing, the parser will pop items off its stack until it can unify
		-- with this rule, rather than printing an error message and just quiting; this allows some error
		-- recovery with more complex grammars so multiple syntax errors can be found
		
		-- not a very helpful message, error should be used more wisely with more complex grammars
		print("Parse error, bad expression")
	
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 74 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 74")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 85 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 85")
end

yyval2:=yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 8 then
--|#line 88 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 88")
end

yyval2:=variables[yyvs3.item (yyvsp3)] 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 9 then
--|#line 90 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 90")
end

yyval2 := variables[yyvs3.item (yyvsp3)] * -1 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 10 then
--|#line 92 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 92")
end

yyval2 := yyvs2.item (yyvsp2) * -1 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 11 then
--|#line 94 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 94")
end

yyval2 := yyvs2.item (yyvsp2 - 1) + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 12 then
--|#line 96 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 96")
end

yyval2 := yyvs2.item (yyvsp2 - 1) - yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 13 then
--|#line 98 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 98")
end

yyval2 := yyvs2.item (yyvsp2 - 1) * yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 14 then
--|#line 100 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 100")
end

yyval2 := yyvs2.item (yyvsp2 - 1) // yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 15 then
--|#line 102 "calc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'calc_parser.y' at line 102")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
				else
					debug ("GEYACC")
						std.error.put_string ("Error in parser: unknown rule id: ")
						std.error.put_integer (yy_act)
						std.error.put_new_line
					end
					abort
				end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 27 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   12,   13,    8,    6,    2,    7,    2,    9,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   11,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,   10, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   15,   15,   16,   16,   16,   16,   14,   14,   14,
			   14,   14,   14,   14,   14,   14, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    3,    2,    1,    2,    1,
			    3,    2,    3,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    2,    2,    2,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    1,    0,    0,    0,    6,    8,    7,    0,    0,    2,
			    8,    0,    9,   10,    0,    5,    0,    0,    0,    0,
			    3,   15,    0,   14,   13,   12,   11,    4,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    8,    1,    9, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,    1,   15,   25, -32768,   -4, -32768,    4,   31, -32768,
			 -32768,   17, -32768, -32768,   15, -32768,   15,   15,   15,   15,
			 -32768, -32768,   26, -32768, -32768,    2,    2, -32768,    3, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -2, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   11,   28,    7,   29,    6,    5,    4,   14,    3,   15,
			   17,   16,   22,    2,   23,   24,   25,   26,    6,   10,
			    0,    0,    3,   19,   18,   17,   16,    2,   13,   12,
			   21,   27,   19,   18,   17,   16,   20,   19,   18,   17,
			   16, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    2,    0,    1,    0,    3,    4,    5,   11,    7,    5,
			    8,    9,   14,   12,   16,   17,   18,   19,    3,    4,
			   -1,   -1,    7,    6,    7,    8,    9,   12,    3,    4,
			   13,    5,    6,    7,    8,    9,    5,    6,    7,    8,
			    9, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER = 29
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 14
			-- Number of tokens

	yyLast: INTEGER = 40
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 261
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 17
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- create

	make
			-- Create a new calculator
		do
			last_string_value := ""
			make_parser_skeleton
			make_scanner
			
			create variables.make(5)
		end
		
feature -- access

	result_val : INTEGER -- the value of the last parsed expression is stored here for testing
	
	variables : HASH_TABLE[INTEGER,STRING] -- the list of variables and their values; name is used as the key
	
feature -- parsing

	parse_string(str :STRING)
			-- parse the text of this given string
		local
			buf : YY_BUFFER
		do
			create buf.make(str)
			
			reset
			set_input_buffer(buf)
			parse
		end

	parse_file(filename:STRING)
			-- parse the text of the given input file
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_file.make (filename)
			a_file.open_read
			
			if a_file.is_open_read then
				reset
				set_input_buffer (new_file_buffer (a_file))
				parse
				a_file.close
			else
				std.error.put_string ("calculator: cannot read %'"+filename+"%'%N")
			end
		end
	
end
