deferred class CALC_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end
		
	CALC_TOKENS

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
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 29 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 29")
end
-- ignore whitespaces
else
--|#line 31 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 31")
end
 -- return an end-of-line token when the new line character is encountered
			last_token := EOL 
		
end
else
--|#line 35 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 35")
end
 -- return a digit token and store the integer value in last_integer_value, which the parser will use
			last_integer_value := text.to_integer
			last_token := NUMBER
		
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 40 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 40")
end
 -- return an identifier and store the value in last_string_value, which the parser will use
			last_string_value := text
			last_token := IDENT
		
else
--|#line 45 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 45")
end
-- return the character code for a character, which are reserved tokens that the parser uses
			-- The character code for '+' is a value token and is used by the parser by writing
			-- '+' as a token in a rule
			last_token := text_item (1).code
		
end
else
--|#line 0 "calc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'calc_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
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
			    0,    4,    5,    6,    7,    8,    9,   10,   11,   13,
			   12,   13,   12,   14,    3,   14,   14,   14,   14,   14,
			   14,   14, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,   15,   13,
			   12,   10,    8,    3,   14,   14,   14,   14,   14,   14,
			   14,   14, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   13,   14,    0,   14,    0,    7,   14,
			    4,    0,    5,    2,   14,    6, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   14,    1,   14,   14,   15,   14,   15,   14,   14,
			   14,   15,   14,   14,    0,   14, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    1,    1,
			    1,    1,    1,    6,    1,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    1,    1,    1,    1,    1,    1,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    1,    1,    1,    1,    1,    1,    1,
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
			    0,    1,    2,    1,    2,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    7,    5,    1,    2,    1,    3,    2,
			    4,    1,    3,    4,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 14
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 14
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 15
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

	yyNb_rules: INTEGER = 6
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 7
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
