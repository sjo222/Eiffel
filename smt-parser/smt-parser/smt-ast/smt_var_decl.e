note
	description: "Summary description for {SMT_VAR_DECL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_VAR_DECL
inherit
	SMT_EXP
	redefine
		out
	end
create
	make
feature -- constructor
	make (n: STRING; t: SMT_TYPE)
		do
			name := n
			type := t
		end
feature
	name : STRING
	type : SMT_TYPE
feature
	out : STRING
		do
			Result := paren(<<decl_const, name, bool>>)
		end

	pretty_print : STRING
		do
			Result := "var " + name + " : " + type.pretty_print
		end
end
