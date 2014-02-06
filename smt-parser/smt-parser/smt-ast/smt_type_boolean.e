note
	description: "Summary description for {SMT_TYPE_BOOLEAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SMT_TYPE_BOOLEAN
inherit
	SMT_TYPE
create
	default_create
feature
	pretty_print : STRING
		do
			Result := "BOOLEAN"
		end
end
