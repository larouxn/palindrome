defmodule Palindrome do
  word = "racecar"
  letters = String.split(word, "", trim: true)
  numberOfOdds = 0
  freq = %{r: 2, a: 2, c: 2, e: 1}

  odd? = &(rem(&1, 2) != 0) # from Elixir's site | Enum.filter(1..3, odd?)

  def palindrome?(string) do
    if string == String.reverse(string), do: IO.puts "#{string} is a palindrome."
  end

  def counting(map, key) do
    if Map.has_key?(map, key) do
      Map.put(map, "bringo")
    else
      Map.put(map, String.to_atom(x), 1)
    end
  end

  Enum.map(letters, fn x -> if Map.has_key?(freq, x), do: freq[x] += 1, else: freq[x] = 1 end)
end
