import 'dart:io';

var palindrome = "";
var freq = new Map();

Map countLetters(String string) {
  for (var letter in string.split('')) {
    if (freq.containsKey(letter)) {
      ++freq[letter];
    } else {
      freq[letter] = 1;
    }
  }
  return freq;
}

Bool isPalindrome(String string) {
  return (string == string.split('').reversed.join(''))
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

void findOdd(Symbol k, Num v) {
  if (v % 2 != 0) {
    palindrome = palindrome + k.toString();
    freq[k] -= 1;
  }
}

String combineParts(Symbol k, Num v) {
  palindrome = palindrome + (k * (v / 2).floor());
  palindrome = (k * (v / 2).floor()) + palindrome;
}

String createPalindrome(Map freq) {
  freq.forEach((k, v) => findOdd(k, v));
  freq.forEach((k, v) => combineParts(k, v));
  return palindrome;
}

void main() {
  stdout.writeln("Enter a word or phrase");
  String input = stdin.readLineSync();
  freq = countLetters(input);
  if (isPalindrome(input)) {
      print("$input is already a palindrome.");
  } else if (!canBePalindrome(freq)) {
      print("$input cannot be made into a palindrome.");
  } else {
      print("Palindrome of $input: ${createPalindrome(freq)}");
  }
}
