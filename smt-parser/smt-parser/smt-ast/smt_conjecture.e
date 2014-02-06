note
	description: "Summary description for {SMT_CONJECTURE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_CONJECTURE
inherit
	SMT_EXP
	redefine
		out
	end
create
	make

feature -- constructor
	make(n: STRING; e: SMT_BOOL_EXP)
		do
			name := n
			exp  := e
		end

feature
	name : STRING
	exp  : SMT_BOOL_EXP
feature
	out : STRING
		do
			Result := paren (<<def_const, name, bool, exp.out>>)
		end
	pretty_print : STRING
		do
			Result := "conjecture " + name + " : " + exp.pretty_print
		end
end
