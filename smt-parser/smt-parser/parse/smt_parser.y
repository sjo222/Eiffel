--
--	grammar for simple calculator
--
%{
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

%}

-- the symbol calculate is the root of the parse tree
%start	smt

-- these are tokens that appear as part of the grammar in addition to single characters
%token<INTEGER> NUMBER -- a integer number
%token<STRING>  IDENT  -- a string identifier
%token 			TK_VAR
%token 			TK_CONJECTURE
%token 			TK_BOOLEAN
%token<BOOLEAN> TK_TRUE
%token<BOOLEAN> TK_FALSE
%token 			TK_AND
%token			TK_NOT
%token 			TK_OR
%token	EOL -- an end-of-line character

-- this specifies that these characters are operators, with left associativity, and with + and -
-- having lower precedence than * or /, which are lower still then unary - (negative)
%left	'+' '-' TK_OR
%left	'*' '/' TK_AND
-- this is a phantom token that is never produced by the scanner but used to force the parser
-- to give precedence to unary minus (negative) over binary minus, otherwise the parser will
-- encounter an error when it sees a '-' in front of a number rather than between 2 expressions
%right	UMINUS TK_NOT

-- this states that the symbol expr has a type of INTEGER, that is it will store an integer value
-- that is a result of the rule's code being executed, and which can be used by other rules
%type<LINKED_LIST[SMT_EXP]>	smt
%type<SMT_EXP>      		expr
%type<SMT_BOOL_EXP> 		bool_expr  

%%

smt :
	-- Empty rule, do nothing
	{ create {LINKED_LIST[SMT_EXP]} $$.make }
	|	smt expr {
		  create {LINKED_LIST[SMT_EXP]} $$.make
		  across $1 as exp 
		  loop 
		    $$.extend(exp.item) 
		  end 
		  $$.extend($2)
		  expressions := $$
		}
	;

expr : 
		TK_VAR IDENT ':' TK_BOOLEAN { 
		  bool_variables.extend($2)
		  variable_declarations.extend(create {SMT_VAR_DECL}.make($2, create {SMT_TYPE_BOOLEAN}))
		  $$ := variable_declarations.last
		}
	|   TK_CONJECTURE IDENT ':' bool_expr { 
		  conjectures.extend(create {SMT_CONJECTURE}.make($2, $4))
		  $$ := conjectures.last
		}
	;

bool_expr :
		TK_TRUE {
	   	  create {SMT_BOOL_CONST} $$.make(true)
		}
	|   TK_FALSE {
	   	  create {SMT_BOOL_CONST} $$.make(false)
		}
	|   bool_expr TK_AND bool_expr {
	   	  create {SMT_BOOL_CONJUNCTION} $$.make($1, $3)
		}
	|   bool_expr TK_OR bool_expr {
	   	  create {SMT_BOOL_DISJUNCTION} $$.make($1, $3)
		}
	|   TK_NOT bool_expr {
	 	  create {SMT_BOOL_NOT} $$.make($2)
		}
	|   IDENT {
		  create {SMT_BOOL_VAR} $$.make($1)
		}
	|	'(' bool_expr ')' {
		  $$ := $2
		}
	;

%%

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
