import os
import tables
import strutils

# Graciously stolen from Nim's Wikipedia page
proc reverse(s: string): string =
    result = ""
    for i in countdown(high(s), 0):
        result.add s[i]

proc buildPalindrome(s: string, odds: CountTable[char], evens: CountTable[char]) =
    var
        buildStr = ""
        single   = ""
    for k,v in evens:
        buildStr.add repeat(k, v div 2)
    for k,v in odds:
        if v > 1:
            buildStr.add repeat(k, v div 2)
        else:
            single.add k

    buildStr = buildStr & single & reverse(buildStr)
    echo "A palindromic form of ", s, " is ", buildStr

proc checkForIfPossible(s: string) =
    var counts = initCountTable[char]()
    for c in s:
        counts.inc(c)

    var
        oddCounts  = initCountTable[char]()
        evenCounts = initCountTable[char]()
    for k,v in counts.pairs:
        if v mod 2 != 0:
            oddCounts.inc(k, v)
        else:
            evenCounts.inc(k, v)

    if oddCounts.len > 1:
        echo s, " cannot be made into a palindrome"
    else:
        buildPalindrome(s, oddCounts, evenCounts)

let input = paramStr(1)
if input == reverse(input):
    echo input, " is a palindrome"
else:
    checkForIfPossible(input)
