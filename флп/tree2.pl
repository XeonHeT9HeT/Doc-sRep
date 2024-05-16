% Определение предиката для нахождения глубины бинарного дерева
depth(empty, 0). % Глубина пустого дерева равна 0
depth(tree(_, Left, Right), Depth) :- % Глубина непустого дерева
    depth(Left, LeftDepth), % Находим глубину левого поддерева
    depth(Right, RightDepth), % Находим глубину правого поддерева
    Depth is max(LeftDepth, RightDepth) + 1. % Глубина текущего дерева - максимальная из глубин поддеревьев плюс 1

% Предикат для нахождения глубины каждого дерева в списке
depth_list([], []). % Базовый случай: для пустого списка возвращаем пустой список глубин
depth_list([Tree|Trees], [Depth|Depths]) :- % Находим глубину для каждого дерева в списке
    depth(Tree, Depth), % Находим глубину текущего дерева
    depth_list(Trees, Depths). % Рекурсивно обрабатываем оставшиеся деревья в списке

% Пример использования:
% Пример списка непустых бинарных деревьев: [tree(1, tree(2, empty, empty), tree(3, tree(4, empty, empty), empty)), tree(5, empty, empty)]
% Вызываем предикат depth_list с этим списком, чтобы получить список глубин
% Например: depth_list([tree(1, tree(2, empty, empty), tree(3, tree(4, empty, empty), empty)), tree(5, empty, empty)], Depths).
% Depths = [3, 2].

% Предикат для циклического сдвига списка вправо на один элемент
shift_right([Last|Rest], Shifted) :-
    append(Rest, [Last], Shifted).

% Предикат для циклического сдвига списка вправо на заданное количество раз
shift_right_n(Times, List, Shifted) :-
    length(List, Length),
    Shift is Times mod Length, % Учитываем случаи, когда сдвиг больше длины списка
    shift_right_n_times(Shift, List, Shifted).

shift_right_n_times(0, List, List) :- !.
shift_right_n_times(N, List, Shifted) :-
    shift_right(List, ShiftedTemp),
    NextN is N - 1,
    shift_right_n_times(NextN, ShiftedTemp, Shifted).

% Пример использования:
% Пример списка глубин: [3, 2].
% Вызываем предикат shift_right_n с этим списком и количеством сдвигов, например, 1:
% shift_right_n(1, [3, 2], ShiftedDepths).
% ShiftedDepths = [2, 3].
