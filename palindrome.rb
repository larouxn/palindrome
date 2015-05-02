freq_hash = {} and palindrome = "" and word = gets.chomp and letters = word.split('') and letters.each do |letter|
  freq_hash.has_key?(letter) ? freq_hash[letter] += 1 : freq_hash[letter] = 1
end
if word == word.reverse
  puts "String given is already a palindrome."
elsif freq_hash.values.select {|num| num.odd?}.length > 1
  puts "String given cannot be made into a palindrome."
else
  freq_hash.each_pair {|key, value| palindrome = key and value - 1 if value.odd? } and freq_hash.each_pair do |key, value|
    palindrome = key * (value / 2) + palindrome + key * (value / 2)
  end and puts "Palindrome: #{palindrome}"
end
