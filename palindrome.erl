-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([perms/1]).
-export([findPalindrome/1]).

% Taken from http://www.erlang.org/doc/programming_examples/list_comprehensions.html
perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

isPalindrome(InputString) ->
  StrLen = string:len(InputString),
  FirstHalf = if
    StrLen =:= 1 -> InputString;
    true         -> string:sub_string(InputString, 1, StrLen div 2)
  end,
  SecondHalf = lists:reverse(
    if
      StrLen         =:= 1 -> InputString;
      (StrLen rem 2) =:= 0 -> string:sub_string(InputString, StrLen div 2 + 1, StrLen);
      true                 -> string:sub_string(InputString, StrLen div 2 + 2, StrLen)
    end
  ),
  FirstHalf =:= SecondHalf.

findPalindrome(InputString) ->
  IsPal = isPalindrome(InputString),
  if
    IsPal -> InputString;
    true  -> ""
  end.

display(InputString) ->
  InputIsPalindrome = isPalindrome(InputString),
  if
    InputIsPalindrome =:= true ->
      io:format("~s is a palindrome!~n", [InputString]);
    true ->
      InputPerms      = perms(InputString),
      PermResults     = lists:map(fun palindrome:findPalindrome/1, InputPerms),
      ResultsNoBlanks = lists:filter(fun (Result) -> Result =/= [] end, PermResults),
      case ResultsNoBlanks of
        [] -> io:format("A palindromic form of ~s is impossible~n", [InputString]);
        _  -> io:format("A palindromic form of ~s is ~s~n", [InputString, hd(ResultsNoBlanks)])
      end
  end.
