-module(rev).
-export([reverse/1, tail_rev/1]).

reverse([]) -> [];
reverse([H | T]) -> reverse(T)++[H].

tail_rev(List) ->
    tail_rev(List, []).

tail_rev([], Acc) -> Acc;
tail_rev([H | T], Acc) ->
    tail_rev(T, [H | Acc]).
