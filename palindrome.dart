import 'dart:io';

isPalindrome(String input) {
  if (input == input.split('').reversed.join('')) {
    print('$input is a palindrome.');
  } else {
    print('$input is not a palindrome.');
  }
}

void main() {
  stdout.writeln('Enter a word or phrase');
  String input = stdin.readLineSync();
  isPalindrome(input);
}
