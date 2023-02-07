import Scanner
import Parser
#
import argparse


def scan(buffer):
    scanner = Scanner.Scanner(SCANNER_RULES)
    return scanner.scan(buffer).iterate()


def parse(tokens):
    parser = Parser.Parser(PARSER_TABLE)
    return parser.parse(tokens)


def main(path):
    file = open(path)
    #
    try:
        for _ in parse(scan(file)):
            pass
    except Scanner.Errors.InvalidToken as e:
        print("ERROR:", e)
    except Parser.Errors.InvalidSyntax as e:
        print("ERROR:", e)
    else:
        print("SUCCEED: File is accepted")


R = Scanner.Rule
SCANNER_RULES = [
  # Words
    R('ID', r'[^\W0-9][^\W_]*|\d+'),
  # Operators
    R('', '+', 1),  # 1 means convert it to character, + will convert to \+
    R('', '-', 1),
    R('', '*', 1),
    R('', '/', 1),
  # Statements
    R('IF'  , 'if'),
    R('ELSE', 'else'),
    R('THEN', 'then'),
  # No Tokens
    R('INVALID_NO_TOKEN', r'\S+?'),
]

PARSER_TABLE = {
    "E": {
        "ID": "T E'",
        "(" : "T E'"},
    "E'": {
        "+": "+ T E'",
        ")": "e"},
    "T" : {
        "ID": "F T'",
        "(" : "F T'"},
    "T'": {
        "+": "e",
        "*": "* F T'",
        ")": "e"},
    "F": {
        "ID": "ID",
        "(" : "( E )"}
}


if __name__ == '__main__':
    argReader = argparse.ArgumentParser()
    argReader.add_argument('path')
    #
    args = argReader.parse_args()
    #
    main(args.path)
