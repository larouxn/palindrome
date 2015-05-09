defmodule Palindrome do # Needs serious refactoring, more |>, less variables

  # Takes string, returns map with letters as keys and frequencies as values
  defp count_letters(string) do
    letters = String.split(string, "", trim: true)
    List.foldl(letters, %{}, fn(x, acc) -> Map.update(acc, String.to_atom(x), 1, fn(val) -> val + 1 end) end)
  end

  # Takes map, returns true if at most one letter exists in odd frequency
  def can_be_palindrome(map) do
    values = Map.values(map)
    odds = Enum.filter(values, fn(x) -> rem(x, 2) != 0 end)
    if Enum.count(odds) <= 1, do: true, else: false
  end

  def is_palindrome(string) do
    if string == String.reverse(string), do: true, else: false
  end

  # Takes map from of characters and frequencies, constructs a palindrome
  def create_palindrome(string) do
    map = count_letters(string)
    list = Map.to_list(map)
    odd_tuple = Enum.filter(list, fn({key, val}) -> rem(val, 2) != 0 end)
    odd_char = Keyword.keys(odd_tuple) |> List.first |> Atom.to_string()
    even_map = Map.update(map, String.to_atom(odd_char), 0, fn(val) -> val - 1 end)
    concat_list = Enum.map(even_map, fn({key, val}) -> String.duplicate(Atom.to_string(key), round(val / 2)) end)
    left_side = List.foldl(concat_list, "", fn (x, acc) -> x <> acc end)
    IO.puts(left_side <> odd_char <> String.reverse(left_side))
  end
  
  def main(string) do
    letters = count_letters(string)
    cond do
      is_palindrome(string)       -> IO.puts "#{string} is a palindrome."
      !can_be_palindrome(letters) -> IO.puts "#{string} cannot be made into a palindrome."
      true                        -> create_palindrome(string)
    end
  end
end # First attempt at functional programming, ever
