%{
deferred class SMT_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end
		
	SMT_TOKENS
%}

-- instructs gelex to send its output to the file calc_scanner.e rather than stdout
%option nodefault outfile="smt_scanner.e"

TK_VAR        var
TK_CONJECTURE conjecture
TK_BOOLEAN    BOOLEAN
TK_TRUE	   	  true
TK_FALSE	  false 
TK_AND		  "/\\"
TK_OR         "\\/"
TK_NOT		  "!"

-- a digit is 1 or more characters between 0 and 9
DIGIT		[0-9]+

-- a word is 1 or more characters between a and z or A and Z
WORD		[a-zA-Z][a-zA-Z0-9_]*

-- whitespace is 1 or more spaces, tabs, or carriage returns
WS		[ \t\r]+

%%

{WS}		-- ignore whitespaces

[\n\r?]		-- ignore new lines
		
{TK_VAR}		{last_token := TK_VAR}
{TK_CONJECTURE} {last_token := TK_CONJECTURE}
{TK_BOOLEAN}	{last_token := TK_BOOLEAN}
{TK_TRUE}       {last_token := TK_TRUE}
{TK_FALSE}      {last_token := TK_FALSE}  
{TK_AND}		{last_token := TK_AND}
{TK_NOT}		{last_token := TK_NOT}
{TK_OR}			{last_token := TK_OR}
		
{DIGIT}		{ -- return a digit token and store the integer value in last_integer_value, which the parser will use
			last_integer_value := text.to_integer
			last_token := NUMBER
		}

{WORD}		{ -- return an identifier and store the value in last_string_value, which the parser will use
			last_string_value := text
			last_token := IDENT
		}

. 		{-- DO NOT REMOVE THIS!!!!! 
        -- return the character code for a character, which are reserved tokens that the parser uses
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
