note
	description: "Summary description for {SMT_BOOL_VAR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_BOOL_VAR
inherit
	SMT_BOOL_EXP
		redefine
			out
		end
create
 	make
feature -- constructor
	make(n: STRING)
		do
			name := n
		end
feature
	name : STRING
feature
	out : STRING
		do
			Result := name
		end
	pretty_print : STRING
		do
			Result := name
		end
end
