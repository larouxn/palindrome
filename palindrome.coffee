makePalindrome = (x) ->
  [palindrome, freq, numberOfOdds] = ["", {}, 0]
  isPalindrome = (x) -> if x == x.split("").reverse().join "" then true else false
  cannotBePalindrome = (x) -> if numberOfOdds > 1 then true else false
  for letter in x.split("")
    if freq[letter] then freq[letter] += 1 else freq[letter] = 1
  for letter, amount of freq
    numberOfOdds++ if amount % 2 != 0
  if isPalindrome(x) then console.log("#{x} is already a palindrome.")
  else if cannotBePalindrome(x) then console.log("#{x} cannot be made into a palindrome.")
  else
    for letter, amount of freq
      if amount % 2 != 0 then (palindrome = letter) && (freq[letter]--)
    for letter, amount of freq
      if amount != 0 then palindrome = (Array(Math.floor(amount / 2) + 1).join(letter)) + palindrome + (Array(Math.floor(amount / 2) + 1).join(letter))
    console.log("#{x} as a palindrome: #{palindrome}")
