var freq = {}

/// BORROWED reverse() and repeat()
function reverse(string) {
  return string.split("").reverse().join("");
}

function repeat(str, num) {
  return (new Array(num+1)).join(str);
}

/// UTILITY
// sets up letters frequency map
function countLetters(string) {
  var freq = {}
  for (var letter of string.split("")) {
    freq.hasOwnProperty(letter) ? freq[letter]++ : freq[letter] = 1
  }
  return freq;
}
// find the odd letter, decrements its freq value
function findOdd(string) {
  for (var key in freq) {
    if (freq[key] % 2 !== 0) {
      freq[key] -= 1
      return key;
    }
  }
}

/// MAIN FUNCTIONS
function isPalindrome(string) {
  return string == reverse(string) ? true : false
}
// Makes sure only one letter occurs an odd number of times
function canBePalindrome(string) {
  var numberOfOdds = 0,
      freq = countLetters(string)
  for (var key in freq) {
    if (freq[key] % 2 !== 0) {
      numberOfOdds += 1
    }
  }
  return numberOfOdds > 1 ? false : true
}
// Creates palindrome from a candidate string
function createPalindrome(string) {
  var palindrome = findOdd(string);
  for (var key in freq) {
    if(freq[key] > 0) {
      palindrome = repeat(key, (freq[key] / 2)).concat(palindrome)
      palindrome += repeat(key, (freq[key] / 2))
    }
  }
  return palindrome;
}

function main(string) {
  freq = countLetters(string);
  if(isPalindrome(string)) {
    console.log(string.concat(" is a palindrome."))
  } else if(!canBePalindrome(string)) {
    console.log(string.concat(" cannot be made into a palindrome."))
  } else {
    console.log(createPalindrome(string))
  }
}
