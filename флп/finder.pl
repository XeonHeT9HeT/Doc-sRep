% Предикат для разбиения строки на слова
split_string(String, Words) :-
    atomic_list_concat(Words, ' ', String).

% Предикат для подсчета количества вхождений слова в списке слов
count_word_occurrences(_, [], 0).
count_word_occurrences(Word, [Word|Words], Count) :-
    count_word_occurrences(Word, Words, TempCount),
    Count is TempCount + 1.
count_word_occurrences(Word, [_|Words], Count) :-
    count_word_occurrences(Word, Words, Count).

% Предикат для подсчета вхождений слова в строке
count_word_occurrences_in_string(Word, String, Count) :-
    split_string(String, Words),
    count_word_occurrences(Word, Words, Count).

% Пример использования:
% count_word_occurrences_in_string('слово', 'это слово встречается в этой строке много раз и это слово', Count).
% Результат: Count = 2