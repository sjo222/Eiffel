%{
deferred class CALC_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end
		
	CALC_TOKENS
%}

-- instructs gelex to send its output to the file calc_scanner.e rather than stdout
%option nodefault outfile="calc_scanner.e"

-- a digit is 1 or more characters between 0 and 9
DIGIT		[0-9]+

-- a word is 1 or more characters between a and z or A and Z
WORD		[a-zA-Z]+

-- whitespace is 1 or more spaces, tabs, or carriage returns
WS		[ \t\r]+

%%

{WS}		-- ignore whitespaces

[\n\r?]		{ -- return an end-of-line token when the new line character is encountered
			last_token := EOL 
		}
		
{DIGIT}		{ -- return a digit token and store the integer value in last_integer_value, which the parser will use
			last_integer_value := text.to_integer
			last_token := NUMBER
		}

{WORD}		{ -- return an identifier and store the value in last_string_value, which the parser will use
			last_string_value := text
			last_token := IDENT
		}
		
.		{-- return the character code for a character, which are reserved tokens that the parser uses
			-- The character code for '+' is a value token and is used by the parser by writing
			-- '+' as a token in a rule
			last_token := text_item (1).code
		}

%%

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
