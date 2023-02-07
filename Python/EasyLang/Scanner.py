import re


class Errors:
    class InvalidToken(Exception):
        def __init__(self, token):
            self.token = token

        def __str__(self):
            return f"Invalid token '{self.token.value}' " \
                   f"found at position {self.token.position[0]+1}:{self.token.position[1]+1}"


class Token:
    def __init__(self, value, type, position):
        self.value    = value
        self.type     = type
        self.position = position
        #
        self.next = None

    def iterate(self):
        tokenHead = self
        while tokenHead:
            yield tokenHead
            # move to next token
            tokenHead = tokenHead.next


class Rule:
    @staticmethod
    def characterize(string):
        return '\\' + '\\'.join(string)

    def __init__(self, type, expression, characterize=False):
        if characterize:
            expression = self.characterize(expression)
        #
        self.type       = type
        self.expression = expression
        #
        self.pattern = type and fr"(?P<{type}>{expression})" or expression


class Scanner:
    def __init__(self, rules):
        self.rules = rules
        #
        self.regex = re.compile('|'.join(map(lambda rule: rule.pattern, rules)))

    def scan(self, buffer):
        tokenLast = None
        tokenHead = None
        for row, line in enumerate(buffer):
            for match in self.regex.finditer(line):
                value = match.group().strip()
                token = Token(value, match.lastgroup or value, (row, match.start()))
                if tokenLast:
                    tokenLast.next = token
                else:
                    tokenHead = token
                tokenLast = token
                # validate token
                if match.lastgroup and match.lastgroup.startswith('INVALID'):
                    raise Errors.InvalidToken(token)
        #
        return tokenHead
