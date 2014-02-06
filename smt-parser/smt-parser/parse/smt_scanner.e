deferred class SMT_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end
		
	SMT_TOKENS

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 38 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 38")
end
-- ignore whitespaces
else
--|#line 40 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 40")
end
-- ignore new lines
end
else
if yy_act = 3 then
--|#line 42 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 42")
end
last_token := TK_VAR
else
--|#line 43 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 43")
end
last_token := TK_CONJECTURE
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 44 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 44")
end
last_token := TK_BOOLEAN
else
--|#line 45 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 45")
end
last_token := TK_TRUE
end
else
--|#line 46 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 46")
end
last_token := TK_FALSE
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 47 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 47")
end
last_token := TK_AND
else
--|#line 48 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 48")
end
last_token := TK_NOT
end
else
if yy_act = 10 then
--|#line 49 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 49")
end
last_token := TK_OR
else
--|#line 51 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 51")
end
 -- return a digit token and store the integer value in last_integer_value, which the parser will use
			last_integer_value := text.to_integer
			last_token := NUMBER
		
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 56 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 56")
end
 -- return an identifier and store the value in last_string_value, which the parser will use
			last_string_value := text
			last_token := IDENT
		
else
--|#line 61 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 61")
end
-- DO NOT REMOVE THIS!!!!! 
        -- return the character code for a character, which are reserved tokens that the parser uses
		-- The character code for '+' is a value token and is used by the parser by writing
		-- '+' as a token in a rule
		last_token := text_item (1).code
		
end
else
--|#line 0 "smt_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'smt_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    8,    9,   10,   11,   12,
			   13,   12,   12,   12,   12,   12,   14,    4,   12,   15,
			   12,   16,   12,   12,   12,   12,   12,   12,   17,   12,
			   18,   19,   19,   19,   19,   19,   22,   19,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,   31,   30,   29,   21,   28,   27,
			   26,   25,   24,   23,   21,   20,   48,    3,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    5,    7,    5,    7,   19,   49,   19,   46,   45,
			   44,   42,   41,   39,   38,   36,   35,   34,   32,   31,
			   30,   29,   28,   27,   26,   25,   23,   21,   18,   17,
			   16,   15,   14,   13,   10,    9,    3,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   66,   67,   29,   67,   30,   67,   49,
			   57,   67,    0,   48,   56,   36,   42,   33,   40,   33,
			   67,   50,    0,   41,   67,   31,   31,   24,   26,   38,
			   28,   22,   28,    0,   35,   26,   25,    0,   35,   24,
			    0,   28,   13,    0,   11,   13,   18,    0,   67,   34, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   48,    1,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   49,   49,   48,   49,   49,   49,   49,   48,
			   48,   48,   49,   49,   48,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,    0,   48, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    6,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    1,    1,
			    1,    1,    1,    8,    1,    9,   10,   11,   11,   12,
			   11,   11,   11,   11,   11,   11,   13,   11,   14,   15,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,    1,   16,    1,    1,   17,    1,   18,   11,   19,

			   11,   20,   21,   11,   11,   11,   22,   11,   23,   11,
			   24,   25,   11,   11,   26,   27,   28,   29,   30,   11,
			   11,   11,   11,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    2,    1,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   15,   13,    1,    2,    1,    9,   13,
			   11,    2,   12,   12,   13,   12,   12,   12,   12,    1,
			    8,   11,   12,   12,   10,   12,   12,   12,   12,   12,
			   12,   12,   12,    3,   12,   12,   12,    6,   12,   12,
			    7,   12,   12,    5,   12,   12,   12,    4,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 67
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 48
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 49
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 14
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 15
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make 
		do
			make_compressed_scanner_skeleton
		end

feature -- reset

	reset 
		do
			reset_compressed_scanner_skeleton
		end

end
