gelex calc_scanner.l
geyacc -o calc_parser.e -t calc_tokens calc_parser.y
pause