[word, palindrome, freq, numberOfOdds] = ["rraacce", "", {}, 0]

for letter in word.split("")
  if freq[letter] += 1
  else freq[letter] = 1

for letter, amount of freq
  numberOfOdds++ if amount % 2 != 0

isPalindrome = (x) -> if x == x.split("").reverse().join "" then true else false
cannotBePalindrome = (x) -> if numberOfOdds > 1 then true else false
makePalindrome = (x) ->
  if isPalindrome(x) then console.log("String given is already a palindrome.")
  else if cannotBePalindrome(x) then console.log("String given cannot be made into a palindrome.")
  else for letter, amount of freq
    if amount % 2 != 0 then (palindrome = letter) && (freq[letter]--)
    for letter, amount of freq
      if amount != 0 then palindrome = (Array(Math.floor(amount / 2) + 1).join(letter)) + palindrome + (Array(Math.floor(amount / 2) + 1).join(letter))
  console.log("Palindrome: #{palindrome}")

makePalindrome(word)
