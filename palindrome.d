import std.stdio;
import std.algorithm.mutation;
import std.string;

bool isPalindrome(string input)
{
    char[] inputCopy = chomp(input).dup;
    reverse(inputCopy);
    return input == inputCopy;
}

void main(string[] args)
{
    // Args[1] is the 1st command line arg,
    // args[0] is the filename itself lol
    if (isPalindrome(args[1])) {
        writeln(args[1], " is a palindrome");
    } else {
        // do parts 2 and 3
    }
}
