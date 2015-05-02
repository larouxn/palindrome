[word, palindrome, freq, numberOfOdds] = ["racecar", "", {}, 0]
letters = word.split("")

for letter in letters
  if freq[letter] += 1
  else freq[letter] = 1

for letter, frequency of freq
  numberOfOdds++ if frequency % 2 != 0

isPalindrome = (x) -> if x == x.split("").reverse().join "" then true else false
cannotBePalindrome = (x) -> if numberOfOdds > 1 then true else false
