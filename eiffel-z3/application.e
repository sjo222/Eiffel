note
	description : "simple-z3 application root class"
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
			s: STRING
		do
			print ("Hello Eiffel World!%N")

			s := output_of_command2 ("bash -c ls", "/")
			print(s)

--			create pf
--			p := pf.process_launcher_with_command_line ("bash -c time","/Users/jonathan/Desktop" )
--			p.redirect_output_to_agent (agent response)
--			p.redirect_error_to_same_as_output
--			p.launch
--			-- Do we need the next two lines?
--			p.wait_for_exit
--			print(p.exit_code)
		end

	response (s: STRING)
		do
			io.put_string ("response from time command:")
			io.new_line
			io.put_string (s)
			print(s.count)
			io.new_line
		end

	make2
			-- Run application.
		local
			p: PROCESS_IMP
			pf: PROCESS_FACTORY
			e: EXECUTION_ENVIRONMENT
		do
			--| Add your code here
			create e
			print ("Hello Eiffel World!%N")
			create p.make_with_command_line ("z3 -smt2 /Users/jonathan/Desktop/Eiffel-Z3/simple.z3", Void)
--			p.redirect_output_to_agent (agent response)
--			p.redirect_output_to_file ("/Users/jonathan/Desktop/Eiffel-Z3/out.txt")
			p.redirect_error_to_same_as_output

--			p.set_separate_console (True)
			p.launch

			p.wait_for_exit
			e.sleep (1*1000000000)
			print(p.exit_code)
		end

	output_of_command (a_cmd, a_dir, output_file: STRING)
		require
			cmd_attached: a_cmd /= Void
			dir_attached: a_dir /= Void
			out_attached: output_file /= void
		local
			pf: PROCESS_FACTORY
			p: PROCESS
			retried: BOOLEAN
			last_error: INTEGER
			is_timed_out: BOOLEAN
			timeout : INTEGER
		do
			timeout := 100
			is_timed_out := false
			if not retried then
				last_error := 0
				create pf
				p := pf.process_launcher_with_command_line (a_cmd, a_dir)
				p.set_hidden (true)
				p.set_separate_console (False)
				p.redirect_input_to_stream
				p.redirect_output_to_file (output_file)

				p.redirect_error_to_same_as_output
				p.launch
				p.wait_for_exit
				p.wait_for_exit_with_timeout (timeout)

				if not p.has_exited then
					is_timed_out := true
					p.terminate
					p.wait_for_exit
					print ("WARNING! execution of command " + a_cmd + " TIMED OUT%N")
				end
			else
				last_error := 1
			end
		rescue
			retried := True
			retry
		end

	output_of_command2 (a_cmd, a_dir: STRING): STRING
		-- Output of command `a_cmd' launched in directory `a_dir'.
		require
			cmd_attached: a_cmd /= Void
			dir_attached: a_dir /= Void
		local
			pf: PROCESS_FACTORY
			p: PROCESS
			retried: BOOLEAN
			last_error: INTEGER
		do
			Result := ""
			if not retried then
				last_error := 0
				create pf
				p := pf.process_launcher_with_command_line (a_cmd, a_dir)
				p.set_hidden (True)
				p.set_separate_console (False)
--				p.redirect_error_to_agent (agent response2(?))
				p.redirect_output_to_agent (agent response2(?))
				p.launch
				p.wait_for_exit
			else
				last_error := 1
			end
		rescue
			retried := True
			retry
		end

	response2 (s: STRING)
		do
			io.put_string ("response from time command:")
			io.new_line
			io.put_string (s)
			print(s.count)
			io.new_line
		end
end


