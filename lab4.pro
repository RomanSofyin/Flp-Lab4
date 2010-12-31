domains
	charList = char*
predicates
	nondeterm run
	nondeterm strToList(string,charList)
	nondeterm excludeDigitsChar(charList,charList)
	nondeterm readListWithoutDigits(char,charList)
	nondeterm intersectionOfLists(charList,charList,charList)
	nondeterm sortList(charList,charList)
	nondeterm sortListX(char,charList,charList)
	order(char,char)
	isDigit(char)
	nondeterm isElementOfList(char,charList)
	writeList(charList)
clauses
	run :-
		write("Введите две строки:\n"),
		write("1 -> "),readln(Str1),strToList(Str1,CharList1),
		writeList(CharList1),
		excludeDigitsChar(CharList1,List1),
		writeList(List1),
		write("2 -> "),readln(Str2),strToList(Str2,CharList2),
		writeList(CharList2),
		excludeDigitsChar(CharList2,List2),
		writeList(List2),
		readListWithoutDigits('y',List3),
		writeList(List3),
		intersectionOfLists(List2,List1,List21),
		intersectionOfLists(List21,List3,List),
		writeList(List),
		sortList(List,SortedList),
		writeList(SortedList).
	
	% Выводит элементы списка
	writeList ([ ]) :- nl. 
	writeList ([H | T]) :-
		write (H), 
		write (' '), 
		writeList(T).
	
	% Конвертирует строку в список символов
	strToList("",[]).
	strToList(Str,[H|T]) :-
		frontstr(1,Str,StrH,StrRest),
		str_char(StrH,H),
		strToList(StrRest,T).
	
	% Исключает из списка символы-цифры
	excludeDigitsChar([],[]).
	excludeDigitsChar([H1|T1],[H1|T2]) :-
		not(isDigit(H1)),
		excludeDigitsChar(T1,T2).
	excludeDigitsChar([H1|T1],List) :-
		excludeDigitsChar(T1,List).
	
	% Чтение списка без символов-цифр
	readListWithoutDigits('n',[ ]).
	readListWithoutDigits(_,[H|T]) :-
		write("Введите элемент списка: "),
		readchar(H),nl,
		not(isDigit(H)),
		write("Продолжать ввод? (_/n)"),
		readchar(R),nl,
		readListWithoutDigits(R,T).
	readListWithoutDigits(Char,List) :-
		write("Извините, символы-цифры вводить нельзя."),nl,
		readListWithoutDigits(Char,List).
	
	% List3 = подмножеству элементов принадлежащих List1 и List2
	intersectionOfLists([], _, []).
	intersectionOfLists(_, [], []).
	intersectionOfLists([H1|T1], List2, [H1|T3]) :-
		isElementOfList(H1,List2),
		intersectionOfLists(T1, List2, T3).
	intersectionOfLists([H1|T1], List2, List) :-
		intersectionOfLists(T1, List2, List).
	
	% Сортировка списка методом вставок
	sortList([],[]).
	sortList([X|Rest],Out) :-
		sortList(Rest,SortRest),
		sortListX(X,SortRest,Out).
		
	sortListX(X,[A|Rest],[A|Out]) :-
		order(A,X),!,
		sortListX(X,Rest,Out).
	sortListX(X,Rest,[X|Rest]).
	
	order(X,Y) :-
		X <= Y.
		
	% Является ли символ Char символом-цифрой
	isDigit(Char) :-
		char_int(Char,Int),
		Int >= 48,
		Int <= 57.
		
	% Проверка на принадлежность списку
	isElementOfList(Char,[Char|_]).
	isElementOfList(Char,[_|Tail]) :-
		isElementOfList(Char,Tail).
goal
	run.