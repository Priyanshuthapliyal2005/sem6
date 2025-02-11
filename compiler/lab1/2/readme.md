Design lex code to identify and print identifiers of C/C++ in a given input pattern.

Rules:
- The first character should be an alphabet or an underscore.
- Space is not allowed.
- The identifier cannot match any keywords.
- The identifier should not start with a number or a special character except for an underscore.
- The length of the identifier should be only 31 characters (but this may vary based on the platform and compiler).

Regular Expression:
```
^[a-z,A-Z,_][a-z,A-Z,0-9,_]{0,30}$
^[first_char][second to last char][length of indeitifier]$
```