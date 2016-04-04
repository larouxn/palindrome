def input = "imanamregalagermanami"

def isPalindrome(s) {
    return s == s.reverse()
}

def canBeAPalindrome(s, freqMap) {
    return (freqMap.count {it.value % 2 != 0} <= 1)
}

def buildPalindrome(s, freqMap) {
    def output = ""
    def freqMapOdds  = freqMap.findAll { entry -> entry.value % 2 != 0 }
    def freqMapEvens = freqMap.findAll { entry -> entry.value % 2 == 0 }
    def single = ""

    freqMapEvens.each { entry ->
        output += "${entry.key}" * (entry.value / 2)
    }

    freqMapOdds.each { entry ->
        if (entry.value > 1)
            output += "${entry.key}" * (entry.value / 2)
        else
            single = entry.key
    }

    return output + single + output.reverse()
}

if (isPalindrome(input))
    log.info "${input} is a palindrome"
else {
    def chs = input.getChars().toList()
    def freqMap = chs.countBy {it}

    if (canBeAPalindrome(input, freqMap))
        log.info "A palindromic form of ${input} is ${buildPalindrome(input, freqMap)}"
    else
        log.info "${input} cannot bemade into a palindrome"
}
