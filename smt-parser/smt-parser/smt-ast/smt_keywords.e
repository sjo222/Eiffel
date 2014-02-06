note
	description: "Summary description for {SMT_KEYWORDS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_KEYWORDS
feature
	paren(args: ARRAY[STRING]) : STRING
		local
			i : INTEGER
		do
			create Result.make_empty
			from
				i := args.lower
			until
				i > args.upper
			loop
				Result.append (args[i])
				if i < args.upper then
					Result.append (" ")
				end
				i := i + 1
			end
			Result.prepend ("(")
			Result.append  (")")
		end
feature
	decl_const 	: STRING do Result := "declare-const" end
	def_const	: STRING do Result := "define-const"  end
	bool       	: STRING do Result := "Bool" 		  end
	assert     	: STRING do Result := "assert" 		  end
	const_true 	: STRING do Result := "true" 			 end
	const_false : STRING do Result := "false" 		 end
	op_and		: STRING do Result := "and" 			 end
	op_or 		: STRING do Result := "or" 			 end
	op_not		: STRING do Result := "not" 			 end
end
