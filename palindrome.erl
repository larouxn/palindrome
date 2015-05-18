-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([checkIfCanBuildPalindrome/1]).
-export([buildPalindrome/3]).

isPalindrome(InputString) ->
  InputString =:= lists:reverse(InputString).

buildPalindrome(EvensMap, OddsMap, InputString) ->
  InputString.

checkIfCanBuildPalindrome(InputString) ->
  UpdateFun = fun(Old)    -> Old + 1 end,
  FoldFun   = fun(C, Map) -> dict:update(C, UpdateFun, 1, Map) end,
  OccurrencesMap = lists:foldl(FoldFun, dict:new(), InputString),
  EvensMap = dict:filter(fun(K, V) -> V rem 2 == 0 end, OccurrencesMap),
  OddsMap  = dict:filter(fun(K, V) -> V rem 2 /= 0 end, OccurrencesMap),
  OddsSize = dict:size(OddsMap),
  if
    OddsSize > 1 ->
      io:format("~s cannot be made into a palindrome~n", [InputString]);
    true ->
      io:format("A palindromic form of ~s is ~s~n", [InputString, buildPalindrome(EvensMap, OddsMap, InputString)])
  end.

display(InputString) ->
  IsPalindrome = isPalindrome(InputString),
  if
    IsPalindrome ->
      io:format("~s is a palindrome!~n", [InputString]);
    true ->
      checkIfCanBuildPalindrome(InputString)
  end.
