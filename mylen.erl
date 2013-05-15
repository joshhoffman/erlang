-module(mylen).
-export([mylen/1, my_tail_len/1]).

mylen([]) -> 0;
mylen([_|T]) -> 1 + mylen(T).

my_tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).
