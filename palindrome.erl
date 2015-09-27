-module(palindrome).
-export([isPalindrome/1]).
-export([display/1]).
-export([checkIfCanBuildPalindrome/1]).
-export([buildPalindrome/2]).

isPalindrome(InputString) ->
  InputString == lists:reverse(InputString).

buildPalindrome(EvensMap, OddsMap) ->
  % Character duplication graciously borrowed from
  % http://stackoverflow.com/questions/12973566/list-of-repeating-element-in-erlang
  EvensStr = dict:fold(
    fun(Key, Count, Acc) ->
      string:concat(Acc, lists:flatten(lists:duplicate(Count div 2, Key)))
    end,
  "", EvensMap),
  OddsStr  = dict:fold(
    fun(Key, Count, Acc) when Count > 1 ->
      string:concat(Acc, lists:flatten(lists:duplicate(Count div 2, Key)));
      (Key, _, Acc) -> string:concat(Acc, [Key])
    end,
  "", OddsMap),
  string:concat(string:concat(EvensStr, OddsStr), lists:reverse(EvensStr)).

checkIfCanBuildPalindrome(InputString) ->
  UpdateFun = fun(Old)    -> Old + 1 end,
  FoldFun   = fun(Char, Map) -> dict:update(Char, UpdateFun, 1, Map) end,
  OccurrencesMap = lists:foldl(FoldFun, dict:new(), InputString),
  EvensMap = dict:filter(fun(_, Value) -> Value rem 2 == 0 end, OccurrencesMap),
  OddsMap  = dict:filter(fun(_, Value) -> Value rem 2 /= 0 end, OccurrencesMap),
  OddsSize = dict:size(OddsMap),
  if
    OddsSize > 1 ->
      io:format("~s cannot be made into a palindrome~n", [InputString]);
    true ->
      io:format("A palindromic form of ~s is ~s~n", [InputString, buildPalindrome(EvensMap, OddsMap)])
  end.

display(InputString) ->
  IsPalindrome = isPalindrome(InputString),
  if
    IsPalindrome ->
      io:format("~s is a palindrome!~n", [InputString]);
    true ->
      checkIfCanBuildPalindrome(InputString)
  end.
