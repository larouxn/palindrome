import os

# Graciously stolen from Nim's Wikipedia page
proc reverse(s: string): string =
    result = ""
        for i in countdown(high(s), 0):
            result.add s[i]

let input = paramStr(1)

if input == reverse(input):
    echo input, " is a palindrome"
else:
    echo "nope"
