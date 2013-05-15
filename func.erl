-module(func).
-export([map/2, even/1, old_men/1, filter/2, fold/3, reverse/1, map2/2, filter2/2]).

map(_, []) -> [];
map(F, [H | T]) -> [F(H) | map(F, T)].

even(L) -> lists:reverse(even(L, [])).

even([], Acc) -> Acc;
even([H | T], Acc) when H rem 2 == 0 ->
    even(T, [H | Acc]);
even([_ | T], Acc) ->
    even(T, Acc).

old_men(L) -> lists:reverse(old_men(L, [])).

old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
    old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
    old_men(People, Acc).

%% only need to provide a func and a list of stuff
%% this function will cycle through the list and throw
%% out what doesn't match the func
filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H | T], Acc) ->
    case Pred(H) of
        true -> filter(Pred, T, [H | Acc]);
        false -> filter(Pred, T, Acc)
    end.

fold(_, Start, []) -> Start;
fold(F, Start, [H | T]) -> fold(F, F(H, Start), T).

reverse(L) ->
    fold(fun(X, Acc) -> [X | Acc] end, [], L).

map2(F, L) ->
    reverse(fold(fun(X, Acc) -> [F(X)|Acc] end, [], L)).

filter2(Pred, L) ->
    F = fun(X, Acc) ->
        case Pred(X) of
            true -> [X|Acc];
            false -> Acc
        end
    end,
    reverse(fold(F, [], L)).
