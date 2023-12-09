random_list(0, _, _, []).
random_list(Size, LowerBound, UpperBound, List) :-
    Size > 0,
    random_between(LowerBound, UpperBound, RandomNumber),
    NewSize is Size - 1,
    random_list(NewSize, LowerBound, UpperBound, SubList),
    append([RandomNumber], SubList, List).
