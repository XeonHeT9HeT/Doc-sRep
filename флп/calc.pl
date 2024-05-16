add(X, Y, Result) :- Result is X + Y.
subtract(X, Y, Result) :- Result is X - Y.
multiply(X, Y, Result) :- Result is X * Y.
divide(X, Y, Result) :- Y =\= 0, Result is X / Y.

% Предикат для вычисления арифметического выражения
calculate(Operation, X, Y, Result) :-
    (
        Operation = add, add(X, Y, Result);
        Operation = subtract, subtract(X, Y, Result);
        Operation = multiply, multiply(X, Y, Result);
        Operation = divide, divide(X, Y, Result)
    ).

% Пример использования:
% calculate(add, 5, 3, Result). % Результат: Result = 8
% calculate(subtract, 10, 4, Result). % Результат: Result = 6
% calculate(multiply, 7, 2, Result). % Результат: Result = 14
% calculate(divide, 20, 5, Result). % Результат: Result = 4