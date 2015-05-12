var word = "racecar",
    freq = {}

function reverse(string) {
  return string.split("").reverse().join("");
}

function isPalindrome(string) {
  string == reverse(string) ? true : false
}

function canBePalindrome(string) {
  var numberOfOdds = 0

  for (letter of word.split("")) {
    freq.hasOwnProperty(letter) ? freq[letter]++ : freq[letter] = 1
  }
  for (letter of Object.getOwnPropertyNames(freq)) {
    if (freq[letter] % 2 != 0) numberOfOdds++
  }

  numberOfOdds > 1 ? false : true
}

// function createPalindrome(string) {
//
// }

function main(string) {
  if isPalindrome(string) {
    string + "is a palindrome."
  } else if !canBePalindrome(string ){
    string + "cannot be made into a palindrome."
  } else {
    createPalindrome(string)
  }
}
