class Palindrome
{
    static Bool isPalindrome(Str s) {s == s.reverse}

    // Frequency map graciously stolen from
    // http://fantom.org/doc/examples/sys-wordcount
    static Void buildIfPossible(Str input)
    {
        chCounts := Int:Int[:] { def = 0 }
        input.each |ch| { chCounts[ch] += 1 }
        evenCounts := chCounts.findAll |v,ch| {v % 2 == 0}
        oddCounts  := chCounts.exclude |v,ch| {v % 2 == 0}
        if (oddCounts.size > 1)
            echo("${input} cannot be made into a palindrome")
        else
        {
            output := ""
            evenCounts.each |v,ch|
            {
                for (i:=0; i < v/2; i++)
                    output += ch.toChar
            }
            single := ""
            oddCounts.each |v,ch|
            {
                if (v > 1)
                    for (i:=0; i < v/2; i++)
                        output += ch.toChar
                else
                    single = ch.toChar
            }
            output = output + single + output.reverse
            echo("A palindromic form of ${input} is ${output}")
        }
    }

    static Void main(Str[] args)
    {
        input := args[0]
        if (isPalindrome(input))
            echo("${input} is a palindrome")
        else
            buildIfPossible(input)
    }
}
