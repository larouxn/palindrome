function reverse(string) {
  return string.split("").reverse().join("");
}

function isPalindrome(string) {
  if(string == reverse(string)) {
    return true
  } else {
    return false
  }
}
