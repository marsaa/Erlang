-module(trains).

-compile(export_all).

take(Xs, N) -> take(Xs, N, []).
take(_, N, Return) when N == 0 -> Return; 
take([H|T], N, Return) -> take(T, N - 1, Return ++ [H]). 

drop(Xs, N) -> drop(Xs, N, []).
drop([], _, Return) -> Return;
drop([H|T], N, Return) -> case N > 0 of
	true -> drop(T, N - 1, Return);
	false -> drop(T, N - 1, Return ++ [H])
end.

append(Xs, Ys) -> Xs ++ Ys.

member([H|_], A) when H == A -> true;
member([_|T], A) -> member(T, A);
member([], _) -> false.

position(Xs, Y) -> position(Xs, Y, 1).
position([H|_], Y, Count) when H == Y -> Count;
position([_|T], A, Count) -> position(T, A, Count + 1);
position([], _, _) -> false.