gelex smt_scanner.l
geyacc -v smt_parser_out.txt -o smt_parser.e -t smt_tokens smt_parser.y 
pause