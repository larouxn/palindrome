isPalindrome = fn a -> a == String.reverse(a) end

word = "racecar"

if isPalindrome.(word) do
  IO.puts "#{word} is a palindrome."
end
