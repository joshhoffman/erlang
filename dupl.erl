-module(dupl).
-export([duplicate/2, tail_dupl/2]).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 ->
    [Term | duplicate(N-1, Term)].

tail_dupl(N, Term) ->
    tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) ->
    List;
tail_duplicate(N, Term, List) when N > 0 ->
    tail_duplicate(N-1, Term, [Term | List]).
