defmodule Palindrome do

  # Takes string, returns map with letters as keys and frequencies as values
  defp count_letters(string) do
    letters = String.split(string, "", trim: true)
    List.foldl(letters, %{}, fn(x, acc) -> Map.update(acc, String.to_atom(x), 1, fn(val) -> val + 1 end) end)
  end

  # Takes map, returns true if at most one letter exists in odd frequency
  def can_be_palindrome(map) do
    import Integer, only: [is_odd: 1]
    values = Map.values(map)
    odds = Enum.filter(values, fn(x) -> rem(x, 2) != 0 end)
    if Enum.count(odds) <= 1, do: true, else: false
  end

  def is_palindrome(string) do
    if string == String.reverse(string) do
      IO.puts "#{string} is a palindrome."
    else
      IO.puts "#{string} is not palindrome."
    end
  end

  # def create(map) do
  # end

  # def main(string) do
  # end
end
