-module(recursive).
-export([zip/2, tail_zip/2, qsort/1, lc_qsort/1]).

zip([], _) -> [];
zip(_, []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

tail_zip(X, Y) -> lists:reverse(tail_zip(X, Y, [])).

tail_zip([], _, Acc) -> Acc;
tail_zip(_, [], Acc) -> Acc;
tail_zip([X | Xs], [Y | Ys], Acc) -> tail_zip(Xs, Ys, [{X, Y}|Acc]).

qsort([]) -> [];
qsort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot, Rest, [], []),
    qsort(Smaller) ++ [Pivot] ++ qsort(Larger).

partition(_, [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H | T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.

lc_qsort([]) -> [];
lc_qsort([Pivot|Rest]) ->
    lc_qsort([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ [Pivot] ++
    lc_qsort([Larger || Larger <- Rest, Larger > Pivot]).
