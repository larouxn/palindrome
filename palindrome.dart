import 'dart:io';

Map countLetters(String string) {
    var freq  = new Map();
    for (var letter in string.split('')) {
        if (freq.containsKey(letter)) {
            ++freq[letter];
        } else {
            freq[letter] = 1;
        }
    }
    return freq;
}

Bool isPalindrome(String input) {
    return (input == input.split('').reversed.join(''))
        ? true
        : false;
}

Bool canBePalindrome(Map freq) {
    var numberOfOdds = 0;
    for (var amount in freq.values) {
        if (amount % 2 != 0) {
            ++numberOfOdds;
        }
    }
    return (numberOfOdds <= 1)
        ? true
        : false;
}

// String createPalindrome(Map freq) {
//
// }

void main() {
    stdout.writeln("Enter a word or phrase");
    String input = stdin.readLineSync();
    Map freq = countLetters(input);
    if (canBePalindrome(freq)) {
        print("Can totally be a pally.");
    } else {
        print("Cannot be a pally.");
    }
}

// void main() {
//     stdout.writeln("Enter a word or phrase");
//     String input = stdin.readLineSync();
//     Map freq = countLetters(input);
//     if (isPalindrome(input)) {
//         print("$input is already a palindrome.");
//     } else if (canBePalindrome(freq)) {
//         print("$input cannot be made into a palindrome.");
//     } else {
//         print("Palindrome of $string: ${Palindrome.create(freq)}");
//     }
// }
