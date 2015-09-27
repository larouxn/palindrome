function countFreqs(s)
    freqDict = Dict()
    for c in s
        freqDict[c] = get(freqDict, c, 0) + 1
    end
    return freqDict
end

function buildPalindrome(evens, odds)
    s = ""
    for e in evens
        for i in [1:div(e[2], 2)]
            s = string(s, e[1])
        end
    end
    single = ""
    for e in odds
        if e[2] > 1
            for i in [1:div(e[2], 2)]
                s = string(s, e[1])
            end
        else
            single = e[1]
        end
    end
    return string (s, single, reverse(s))
end

if ARGS[1] == reverse(ARGS[1])
    println("$(ARGS[1]) is a palindrome")
else
    freqDict = countFreqs(ARGS[1])
    oddsDict = filter((e1, e2) -> e2 % 2 != 0, freqDict)
    if length(oddsDict) > 1
        println("$(ARGS[1]) cannot be made into a palindrome")
    else
        evensDict = filter((e1, e2) -> e2 % 2 == 0, freqDict)
        println("A palindromic form of $(ARGS[1]) is $(buildPalindrome(evensDict, oddsDict))")
    end
end
