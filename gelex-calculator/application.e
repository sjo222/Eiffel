note
	description : "gelex-calculator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
		local
			parser : CALC_PARSER
		do
			create parser.make

			parser.parse_file("test_input1-linux.txt")
			--comment2
		end

end
