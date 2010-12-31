domains	list = char*
predicates
	nondeterm test(string)
	nondeterm rList(char,list)
clauses
	test(Str) :-
		str_int (Str, Integer),
		write(Integer),nl.
	test(Str) :-
		write("Преобразовать строку в число не удалось"),nl.
	
	rList ('n', [ ]).
	rList (_, [H | T] ) :-
		nl, write ("Введите элемент списка: "), 
		readint (H), 
		write ("Продолжать ввод? (_/n)"),
		readchar (R),
		rList (R, T).
goal
	rList('y', List).
	% test("-3f4").
	% str_int ("34", Integer).
	% frontchar (String, Char, Rest).	% String = Char + Rest
	% fronttoken (String, Token, Rest).	% 
	% frontstr (N, String, StartString, EndString).