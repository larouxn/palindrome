class Palindrome
{
    static Bool isPalindrome(Str s) { s == s.reverse }

    static Void main(Str[] args)
    {
        input := args[0]
        if (isPalindrome(input))
            echo(input + " is a palindrome")
        else
        {
            // TODO
        }
    }
}
