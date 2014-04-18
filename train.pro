predicates
	nondeterm test(string)
clauses
	test(Str) :-
		str_int (Str, Integer),
		write(Integer),nl.
	test(Str) :-
		write("ѕреобразовать строку в число не удалось"),nl.
goal
	test("-3f4").
	% str_int ("34", Integer).
	% frontchar (String, Char, Rest).	% String = Char + Rest
	% fronttoken (String, Token, Rest).	% 
	% frontstr (N, String, StartString, EndString).