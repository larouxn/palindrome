defmodule Palindrome do
  word = "racecar"
  letters = String.split(word, "", trim: true)
  numberOfOdds = 0
  freq = %{r: 2, a: 2, c: 2, e: 1}

  odd? = &(rem(&1, 2) != 0) # from Elixir's site | Enum.filter(1..3, odd?)

  def palindrome?(string) do
    if string == String.reverse(string) do
      IO.puts "#{string} is a palindrome."
    else
      IO.puts "#{string} is not palindrome."
    end
  end

  List.foldl(letters, %{}, fn(x, acc) -> Map.update(acc, String.to_atom(x), 1, fn(val) -> val + 1 end) end)
  
end
