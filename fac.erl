-module(fac).
-export([factorial/1, tail_fac/1]).

factorial(0) ->
    1;
factorial(N) ->
    N * factorial(N-1).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).
