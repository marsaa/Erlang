-module(moves).
-compile(export_all).

single({one, N}, {Main, L, Two}) when N < 0 -> Length = list:length(L), 
{Main ++ list:drop(L, Length - (-N)), list:take(L, Length - (-N)), Two};

single({two, N}, {Main, One, L}) when N < 0 -> Length = list:length(L), 
{Main ++ list:drop(L, Length - (-N)), One, list:take(L, Length - (-N))};

single({one, N}, {L, One, Two}) -> Length = list:length(L), 
{list:take(L, Length - N) , One ++ list:drop(L, Length - N), Two};


single({two, N}, {L, One, Two}) -> Length = list:length(L), 
{list:take(L, Length - N) ,One , Two ++ list:drop(L, Length - N)}.

move([], _) -> [];
move([H|[]], State) -> [State, single(H, State)];
move([H|T], State) -> [State | move(T, single(H, State))].