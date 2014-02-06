note
	description: "Summary description for {SMT_CONJUNCTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_BOOL_CONJUNCTION
inherit
	SMT_BOOL_OP
	redefine
		out
	end
create
	make

feature -- constructor
  make(l, r: SMT_BOOL_EXP)
	  do
		left := l
		right := r
	  end

feature
  left, right : SMT_EXP
feature
  out : STRING
  	do
  		Result := paren(<<op_and, left.out, right.out>>)
  	end
  pretty_print : STRING
	do
		Result := left.pretty_print + " /\ " + right.pretty_print
	end
end
