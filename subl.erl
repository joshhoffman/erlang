-module(subl).
-export([subl/2, tail_subl/2]).

subl(_, 0) -> [];
subl([], _) -> [];
subl([H | T], N) when N > 0 -> [H | subl(T, N-1)].

tail_subl(L, N) -> lists:reverse(tail_subl(L, N, [])).

tail_subl(_, 0, SubList) -> SubList;
tail_subl([], _, SubList) -> SubList;
tail_subl([H | T], N, SubList) when N > 0 ->
    tail_subl(T, N-1, [H | SubList]).
