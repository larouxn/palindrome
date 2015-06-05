class Palindrome
{
    static Bool isPalindrome(Str s) {s == s.reverse}

    // Frequency map graciously stolen from
    // http://fantom.org/doc/examples/sys-wordcount
    static Void checkIfPossible(Str input)
    {
        chCounts := Int:Int[:] { def = 0 }
        input.each |ch| { chCounts[ch] += 1 }
        evenCounts := chCounts.findAll |v| {v % 2 == 0}
        oddCounts  := chCounts.exclude |v| {v % 2 == 0}
        if (oddCounts.size > 1)
            echo(input + " cannot be made into a palindrome")
        else
            echo("dingo") // TODO use .toChar on the Int keys
    }

    static Void main(Str[] args)
    {
        input := args[0]
        if (isPalindrome(input))
            echo(input + " is a palindrome")
        else
            checkIfPossible(input)
    }
}
