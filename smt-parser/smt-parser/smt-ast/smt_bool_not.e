note
	description: "Summary description for {SMT_BOOL_NOT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_BOOL_NOT
inherit
	SMT_BOOL_OP
	redefine
		out
	end
create
	make
feature -- constructor
	make(e: SMT_BOOL_EXP)
		do
			exp := e
		end
feature
	exp : SMT_BOOL_EXP
feature
	out : STRING
		do
			Result := paren(<<op_not, exp.out>>)
		end
	pretty_print : STRING
		do
			Result := "!" + exp.pretty_print
		end
end
