note
	description: "Summary description for {SMT_BOOL_CONST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_BOOL_CONST
inherit
	SMT_BOOL_EXP
	redefine
		out
	end
create
	make

feature -- constructor
  	make (v: BOOLEAN)
  		do
			value := v
  		end
feature
	value : BOOLEAN
feature
	out : STRING
		do
			if value then
				Result := const_true
			else
				Result := const_false
			end
		end

	pretty_print : STRING
		do
			Result := out
		end
end
