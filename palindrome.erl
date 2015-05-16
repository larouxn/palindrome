-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([findPalindrome/1]).

isPalindrome(InputString) -> InputString =:= lists:reverse(InputString).

findPalindrome(InputString) ->
  IsPal = isPalindrome(InputString),
  if
    IsPal -> InputString;
    true  -> ""
  end.

createPalindrome(InputString) ->
  % do stuff
  end.

display(InputString) ->
  InputIsPalindrome = isPalindrome(InputString),
  if
    InputIsPalindrome =:= true ->
      io:format("~s is a palindrome!~n", [InputString]);
    true ->
      createPalindrome(InputString)
  end.
