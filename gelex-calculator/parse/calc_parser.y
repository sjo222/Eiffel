--
--	grammar for simple calculator
--
%{
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

%}

-- the symbol calculate is the root of the parse tree
%start	calculate

-- these are tokens that appear as part of the grammar in addition to single characters
%token<INTEGER> NUMBER -- a integer number
%token<STRING> IDENT -- an identifier
%token	EOL -- an end-of-line character

-- this specifies that these characters are operators, with left associativity, and with + and -
-- having lower precedence than * or /, which are lower still then unary - (negative)
%left	'+' '-'
%left	'*' '/'
-- this is a phantom token that is never produced by the scanner but used to force the parser
-- to give precedence to unary minus (negative) over binary minus, otherwise the parser will
-- encounter an error when it sees a '-' in front of a number rather than between 2 expressions
%right	UMINUS

-- this states that the symbol expr has a type of INTEGER, that is it will store an integer value
-- that is a result of the rule's code being executed, and which can be used by other rules
%type<INTEGER> expr

%%

calculate :
	-- Empty rule, do nothing
|	calculate expr_eol
;

expr_eol : 
	expr EOL {
		-- once we have an expression followed by an end-of-line, print and store the value of the expression
		
		io.put_string("Result= "+($1).out+"%N")
		result_val:=$1
	}
|	IDENT '=' expr EOL { -- assign the expression's value to the variable identifier by the given identifier
		variables[$1]:=$3
	}
|	error EOL {
		-- 'error' is a special pseudo-token that marks a rule that is a "back-out" point, that is if an
		-- error is encountered while parsing, the parser will pop items off its stack until it can unify
		-- with this rule, rather than printing an error message and just quiting; this allows some error
		-- recovery with more complex grammars so multiple syntax errors can be found
		
		-- not a very helpful message, error should be used more wisely with more complex grammars
		print("Parse error, bad expression")
	}
|	EOL
	  {} -- do nothing on empty lines rather than creating a parse error
;

-- expressions are recursively defined since binary operators are functions of two separate expressions
-- this simple expression is defined as an integer, a negative integer, two expressions being operated on
-- using the +-*/ operators, or an expression between () brackets. This is powerful enough to create
-- compound statements such as 8*(7-2) but not powerful enough so write -(8/2) or 4.5+9
-- the rule code performs the mathematical operations defined by the rules and stores the result in the parent
-- rule, so for addition the line $$ := $1 + $3 adds the values of the left and right expression and stores the
-- sum in the parent expression (ie. the symbol produced as a result of this rule being unified and the code executed)
expr : 
	NUMBER 
		{ $$:=$1 }
|	IDENT
		{ $$:=variables[$1] } -- this allows a variable to be used in an expression
|	'-' IDENT %prec UMINUS
		{ $$ := variables[$2] * -1 } -- this allows the negation of a variable to be used in an expression
|	'-' NUMBER %prec UMINUS
		{ $$ := $2 * -1 }
|	expr '+' expr
		{ $$ := $1 + $3 }
|	expr '-' expr
		{ $$ := $1 - $3 }
|	expr '*' expr
		{ $$ := $1 * $3 }
|	expr '/' expr
	 	{ $$ := $1 // $3 }
|	'(' expr ')'
	 	{ $$ := $2 }
;

%%

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
