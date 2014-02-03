note

	description: "Parser token codes"
	generator: "geyacc version 3.9"

deferred class CALC_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_string_value: STRING

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
	EOL: INTEGER = 260
	UMINUS: INTEGER = 261

end
