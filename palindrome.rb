module Palindrome
  def Palindrome.count_letters(string)
    freq = {}
    string.split('').each do |letter|
      freq.has_key?(letter) ? freq[letter] += 1 : freq[letter] = 1
    end and return freq
  end

  def Palindrome.is_a?(string)
    string == string.reverse ? true : false
  end

  def Palindrome.can_be_a?(string)
    freq = Palindrome.count_letters(string)
    freq.values.select {|num| num.odd?}.length <= 1 ? true : false
  end

  def Palindrome.create(string)
    freq = Palindrome.count_letters(string) and palindrome = ""
    # Handle letter that occurs an odd number of times
    freq.each_pair {|key, value| palindrome = key and value - 1 if value.odd? }
    freq.each_pair do |key, value|
      palindrome = key * (value / 2) + palindrome + key * (value / 2)
    end and return palindrome
  end

  def Palindrome.main(string)
    if Palindrome.is_a?(string)
      puts "Already a palindrome."
    elsif !Palindrome.can_be_a?(string)
      puts "Cannot be made into a palindrome."
    else
      puts "Palindrome: #{Palindrome.create(string)}"
    end
  end
end
