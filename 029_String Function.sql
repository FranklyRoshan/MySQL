-- String Fuction

/*

+------------------+-----------------------------------------+-----------------------------+
| Function Name    | Description                             | Example                     |
+------------------+-----------------------------------------+-----------------------------+
| CONCAT()         | Joins two or more strings               | CONCAT('My', 'SQL') → MySQL |
| CONCAT_WS()      | Joins strings with a separator           | CONCAT_WS('-', 'A','B') → A-B |
| LENGTH()         | Returns the length of a string (bytes)  | LENGTH('MySQL') → 5         |
| CHAR_LENGTH()    | Returns the number of characters         | CHAR_LENGTH('MySQL') → 5    |
| LOWER() / LCASE()| Converts to lowercase                   | LOWER('HELLO') → hello      |
| UPPER() / UCASE()| Converts to uppercase                   | UPPER('hello') → HELLO      |
| SUBSTRING()      | Extracts part of a string                | SUBSTRING('MySQL', 1, 2) → My |
| LEFT()           | Returns left part of string              | LEFT('MySQL', 2) → My       |
| RIGHT()          | Returns right part of string             | RIGHT('MySQL', 2) → QL      |
| TRIM()           | Removes spaces from both sides           | TRIM('  hi  ') → hi         |
| LTRIM()          | Removes spaces from left side            | LTRIM('  hi') → hi          |
| RTRIM()          | Removes spaces from right side           | RTRIM('hi  ') → hi          |
| REPLACE()        | Replaces all occurrences of a substring  | REPLACE('Hello','H','J') → Jello |
| REVERSE()        | Reverses a string                        | REVERSE('SQL') → LQS        |
| INSTR()          | Returns position of substring            | INSTR('MySQL','S') → 3      |
| LOCATE()         | Same as INSTR(), position of substring   | LOCATE('SQL','MySQL') → 3   |
| LPAD()           | Pads string on the left side             | LPAD('7', 3, '0') → 007     |
| RPAD()           | Pads string on the right side            | RPAD('7', 3, '0') → 700     |
| REPEAT()         | Repeats a string a given number of times | REPEAT('Hi', 3) → HiHiHi    |
| ELT()            | Returns string at given index position   | ELT(2,'Hi','Bye','Yo') → Bye|
| FIELD()          | Returns index of value in list           | FIELD('b','a','b','c') → 2  |
| FIND_IN_SET()    | Returns index of string in comma list    | FIND_IN_SET('b','a,b,c') → 2|
| FORMAT()         | Formats a number with commas             | FORMAT(12345.678, 2) → 12,345.68 |
+------------------+-----------------------------------------+-----------------------------+

*/