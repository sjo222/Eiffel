note
	description : "process-simple application root class"
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
	           p: PROCESS
	           pf : PROCESS_FACTORY
	       do
	           print ("Hello Eiffel World!%N")
	           create pf
				p := pf.process_launcher_with_command_line("z3\z3.exe -smt2 simple.z3", "z3")
	           p.redirect_output_to_agent (agent response)
	           p.redirect_error_to_same_as_output
	           p.launch
	           -- Do we need the next two lines?
	           p.wait_for_exit
	           print(p.exit_code)
       end

   response (s: STRING)
       do
           if not s.is_empty then
             io.put_string ("response from time command:")
             io.new_line
             io.put_string (s)
           end
       end

end
