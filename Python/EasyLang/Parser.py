import re


class Errors:
    class InvalidSyntax(Exception):
        def __init__(self, token):
            self.token = token

        def __str__(self):
            return f"Invalid syntax '{self.token.value}' " \
                   f"found at position {self.token.position[0]+1}:{self.token.position[1]+1}"


class Parser:
    @staticmethod
    def isTerminal(symbol):
        nonTerminal = re.compile(r"^[A-Z]\'?$")
        # print(symbol, nonTerminal.match(symbol.strip()))
        #
        return nonTerminal.match(symbol.strip()) is None

    def __init__(self, table):
        self.table = table

    def parse(self, tokens):
        stack = ['$', 'E']
        #
        token = next(tokens, None)
        #
        endTokens = False
        endStack  = False
        while True:
            rule = stack.pop()
            if rule == '$':
                endStack = True
                break
            #
            action = None
            if self.isTerminal(rule):
                if endTokens:
                    break
                if rule == token.type:
                    # check if there's a token left
                    if not token.next:
                        endTokens = True
                    else:
                        token = next(tokens, None)
                else:
                    raise Errors.InvalidSyntax(token)
            elif not endTokens:
                if token.type in self.table[rule]:
                    action = self.table[rule][token.type]
                    # if action is ε, do nothing!
                    if action != 'e':
                        if action not in ('ID', ):  # check if action have more than one rule
                            stack.extend(reversed(action.split()))
                        else:
                            stack.append(action)
                else:
                    raise Errors.InvalidSyntax(token)
            # yield result
            yield stack, token, rule, action
        # check if file is correct or not
        if endTokens and endStack:
            return  # everything is fine
        else:
            raise Errors.InvalidSyntax(token)
