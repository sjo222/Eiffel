-- a simple calculator
class SMT_PARSER 

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		end
		
	SMT_SCANNER
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
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
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
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_boolean_value, yyvsp4)
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
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
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
			yyval5: LINKED_LIST [SMT_EXP]
			yyval6: SMT_EXP
			yyval7: SMT_BOOL_EXP
		do
				inspect yy_act
when 1 then
--|#line 60 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 60")
end

create {LINKED_LIST[SMT_EXP]} yyval5.make 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 2 then
--|#line 63 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 63")
end

		  create {LINKED_LIST[SMT_EXP]} yyval5.make
		  across yyvs5.item (yyvsp5) as exp 
		  loop 
		    yyval5.extend(exp.item) 
		  end 
		  yyval5.extend(yyvs6.item (yyvsp6))
		  expressions := yyval5
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 3 then
--|#line 74 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 74")
end

		  bool_variables.extend(yyvs3.item (yyvsp3))
		  variable_declarations.extend(create {SMT_VAR_DECL}.make(yyvs3.item (yyvsp3), create {SMT_TYPE_BOOLEAN}))
		  yyval6 := variable_declarations.last
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 4 then
--|#line 80 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 80")
end

		  conjectures.extend(create {SMT_CONJECTURE}.make(yyvs3.item (yyvsp3), yyvs7.item (yyvsp7)))
		  yyval6 := conjectures.last
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 5 then
--|#line 86 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 86")
end

	   	  create {SMT_BOOL_CONST} yyval7.make(true)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 6 then
--|#line 90 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 90")
end

	   	  create {SMT_BOOL_CONST} yyval7.make(false)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 7 then
--|#line 93 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 93")
end

	   	  create {SMT_BOOL_CONJUNCTION} yyval7.make(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 8 then
--|#line 96 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 96")
end

	   	  create {SMT_BOOL_DISJUNCTION} yyval7.make(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 9 then
--|#line 99 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 99")
end

	 	  create {SMT_BOOL_NOT} yyval7.make(yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 10 then
--|#line 102 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 102")
end

		  create {SMT_BOOL_VAR} yyval7.make(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 11 then
--|#line 105 "smt_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'smt_parser.y' at line 105")
end

		  yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
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
			when 22 then
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
			   20,   21,   16,   14,    2,   15,    2,   17,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   19,    2,
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   18, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   22,   22,   23,   23,   24,   24,   24,   24,   24,
			   24,   24, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    5,    5,    1,    1,    6,    3,    3,    1,    1,    1,
			    1,    4,    4,    3,    7,    1,    7,    7,    1,    1,
			    1,    7,    7,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    1,    1,    1,    4,    4,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    1,    0,    0,    0,    2,    0,    0,    0,    0,    0,
			    0,    6,    5,   10,    4,    3,    0,    9,    0,    0,
			   11,    8,    7,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    1,    4,   14, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   14,   19,   17, -32768,    3,  -13,   -4,    8,   -4,
			   -4, -32768, -32768, -32768,    1, -32768,   -9, -32768,   -4,   -4,
			 -32768,    0, -32768,    2, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,   -1, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   13,   19,   24,   18,   12,   11,    8,   10,   16,   17,
			   19,   19,   20,   18,   23,   15,    9,   21,   22,    3,
			    2,    6,    7,    5, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    4,   10,    0,   12,    8,    9,   19,   11,    9,   10,
			   10,   10,   21,   12,    0,    7,   20,   18,   19,    5,
			    6,    4,   19,    4, yyDummy>>)
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

	yyvs4: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs5: SPECIAL [LINKED_LIST [SMT_EXP]]
			-- Stack for semantic values of type LINKED_LIST [SMT_EXP]

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LINKED_LIST [SMT_EXP]]
			-- Routines that ought to be in SPECIAL [LINKED_LIST [SMT_EXP]]

	yyvs6: SPECIAL [SMT_EXP]
			-- Stack for semantic values of type SMT_EXP

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [SMT_EXP]
			-- Routines that ought to be in SPECIAL [SMT_EXP]

	yyvs7: SPECIAL [SMT_BOOL_EXP]
			-- Stack for semantic values of type SMT_BOOL_EXP

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [SMT_BOOL_EXP]
			-- Routines that ought to be in SPECIAL [SMT_BOOL_EXP]

feature {NONE} -- Constants

	yyFinal: INTEGER = 24
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 22
			-- Number of tokens

	yyLast: INTEGER = 23
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 269
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 25
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
			
			create expressions.make
			create conjectures.make
			create bool_variables.make
			create variable_declarations.make
		end
		
feature -- access  
	expressions    		  : LINKED_LIST[SMT_EXP]
	conjectures    		  : LINKED_LIST[SMT_CONJECTURE]
	bool_variables 		  : LINKED_SET[STRING] 
	variable_declarations : LINKED_LIST[SMT_VAR_DECL]
	
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
