note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class SMT_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_string_value: STRING
	last_boolean_value: BOOLEAN

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when NUMBER then
				Result := "NUMBER"
			when IDENT then
				Result := "IDENT"
			when TK_VAR then
				Result := "TK_VAR"
			when TK_CONJECTURE then
				Result := "TK_CONJECTURE"
			when TK_BOOLEAN then
				Result := "TK_BOOLEAN"
			when TK_TRUE then
				Result := "TK_TRUE"
			when TK_FALSE then
				Result := "TK_FALSE"
			when TK_AND then
				Result := "TK_AND"
			when TK_NOT then
				Result := "TK_NOT"
			when TK_OR then
				Result := "TK_OR"
			when EOL then
				Result := "EOL"
			when UMINUS then
				Result := "UMINUS"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	NUMBER: INTEGER = 258
	IDENT: INTEGER = 259
	TK_VAR: INTEGER = 260
	TK_CONJECTURE: INTEGER = 261
	TK_BOOLEAN: INTEGER = 262
	TK_TRUE: INTEGER = 263
	TK_FALSE: INTEGER = 264
	TK_AND: INTEGER = 265
	TK_NOT: INTEGER = 266
	TK_OR: INTEGER = 267
	EOL: INTEGER = 268
	UMINUS: INTEGER = 269

end
