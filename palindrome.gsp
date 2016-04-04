uses gw.lang.cli.CommandLineAccess

function isPalindrome(str : String) : boolean {
  return str == str.reverse()
}

function createPalindromeIfPossible(str : String) {
  
}

var args = CommandLineAccess.RawArgs

if (isPalindrome(args[0])) {
  print("${args[0]} is a palindrome")
} else {
  createPalindromeIfPossible(args[0])
}
