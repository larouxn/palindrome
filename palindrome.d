import std.stdio;
import std.algorithm.mutation;
import std.algorithm.iteration;
import std.string;

bool isPalindrome(string input)
{
    char[] inputCopy = chomp(input).dup;
    reverse(inputCopy);
    return input == inputCopy;
}

void buildPalindrome(string input)
{
    char[] inputChs = chomp(input).dup;
    int[char] occurrencesAA;
    foreach (char c; inputChs)
    {
        int* v = (c in occurrencesAA);
        if (v !is null)
            *v += 1;
        else
            occurrencesAA[c] = 1;
    }

    int[char] oddsAA;
    int[char] evensAA;
    foreach (char c; occurrencesAA.byKey())
    {
        if (occurrencesAA[c] % 2 == 0)
            evensAA[c] = occurrencesAA[c];
        else
            oddsAA[c] = occurrencesAA[c];
    }
    if (oddsAA.length > 1)
        writeln(input, " cannot be made into a palindrome");
    else
    {
        char[] buildStr;
        foreach (char c; evensAA.byKey())
            foreach (i; 0 .. evensAA[c] / 2)
                buildStr ~= c;

        char single = 'x';
        foreach (char c; oddsAA.byKey())
        {
            if (oddsAA[c] > 1)
                foreach (i; 0 .. oddsAA[c] / 2)
                    buildStr ~= c;
            else
                single = c;
        }

        char[] revCopy = buildStr.dup;
        reverse(revCopy);
        writeln("A palindromic form of ", input, " is ", buildStr ~ single ~ revCopy);
    }
}

void main(string[] args)
{
    if (isPalindrome(args[1]))
        writeln(args[1], " is a palindrome");
    else
        buildPalindrome(args[1]);
}
