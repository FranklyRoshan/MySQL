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

--

--  String comparison function

/*

🧠 String Comparison Functions in MySQL
These functions help you compare text values, check equality, 
or find ordering differences (alphabetical sorting, case sensitivity, etc.).

*/

/*

+----------------------+------------------------------------------+--------------------------------------------+
| Function             | Description                              | Example                                    |
+----------------------+------------------------------------------+--------------------------------------------+
| STRCMP(s1, s2)       | Compares two strings                     | STRCMP('apple', 'banana') → -1             |
|                      | Returns:                                 |                                            |
|                      |  0 → strings are equal                   | STRCMP('apple', 'apple') → 0               |
|                      |  1 → s1 > s2                             | STRCMP('banana', 'apple') → 1              |
|                      | -1 → s1 < s2                             | STRCMP('apple', 'banana') → -1             |
| LIKE                 | Pattern matching (wildcards % and _)     | 'name' LIKE 'A%' → TRUE (starts with A)    |
| NOT LIKE             | Negation of LIKE                         | 'name' NOT LIKE '%z' → TRUE if not ends z  |
| REGEXP / RLIKE       | Matches a regular expression pattern     | 'Hello' REGEXP '^H' → TRUE (starts with H) |
| BINARY               | Makes comparison case-sensitive          | BINARY 'a' = 'A' → FALSE                   |
| =, !=, <, >, <=, >=  | Normal comparison operators (lexical)    | 'cat' < 'dog' → TRUE                       |
| SOUNDEX(str)         | Returns phonetic code of string          | SOUNDEX('Frank') = SOUNDEX('Frnk') → TRUE  |
+----------------------+------------------------------------------+--------------------------------------------+

*/

-- 🧠 MySQL REGEXP (or RLIKE) Overview
/*

MySQL’s Regular Expressions (REGEXP / RLIKE) let you search for patterns in text 
(like wildcards on steroids).

syntax
expression REGEXP pattern

✅ Returns 1 (TRUE) if the pattern matches,
❌ Returns 0 (FALSE) if it doesn’t.

*/


-- 🎯 Common Regular Expression Patterns
/*

| Pattern  | Meaning                     | Example                 | Matches                 |       |              |
| -------- | --------------------------- | ----------------------- | ----------------------- | ----- | ------------ |
| `^`      | Start of string             | `'Apple' REGEXP '^A'`   | ✅ Starts with "A"       |       |              |
| `$`      | End of string               | `'Banana' REGEXP 'a$'`  | ✅ Ends with "a"         |       |              |
| `.`      | Any single character        | `'Cat' REGEXP 'C.t'`    | ✅ C + any + t           |       |              |
| `[abc]`  | Any one of a, b, or c       | `'bat' REGEXP '[abc]'`  | ✅ contains b            |       |              |
| `[^abc]` | Not a, b, or c              | `'dog' REGEXP '[^abc]'` | ✅ doesn’t contain a/b/c |       |              |
| `[a-z]`  | Any lowercase letter        | `'x' REGEXP '[a-z]'`    | ✅ any lowercase         |       |              |
| `[A-Z]`  | Any uppercase letter        | `'Z' REGEXP '[A-Z]'`    | ✅ uppercase letters     |       |              |
| `[0-9]`  | Any digit                   | `'5' REGEXP '[0-9]'`    | ✅ digits                |       |              |
| `a       | b`                          | OR operator             | `'cat' REGEXP 'cat      | dog'` | ✅ cat or dog |
| `{n}`    | Exactly *n* occurrences     | `'aaa' REGEXP 'a{3}'`   | ✅ 3 a’s                 |       |              |
| `{n,}`   | n or more occurrences       | `'aaaa' REGEXP 'a{3,}'` | ✅ ≥ 3 a’s               |       |              |
| `{n,m}`  | Between n and m occurrences | `'aa' REGEXP 'a{1,3}'`  | ✅ 1 to 3 a’s            |       |              |
| `*`      | Zero or more                | `'dog' REGEXP 'do*g'`   | ✅ "dg", "dog", "dooog"  |       |              |
| `+`      | One or more                 | `'dooog' REGEXP 'do+g'` | ✅ "dog", "dooog"        |       |              |
| `?`      | Zero or one                 | `'dog' REGEXP 'do?g'`   | ✅ "dg", "dog"           |       |              |

*/


-- String Comparison Function
SELECT STRCMP('apple', 'banana') AS result1, 
       STRCMP('apple', 'apple') AS result2, 
       STRCMP('banana', 'apple') AS result3;
DROP TABLE IF EXISTS temp;
--
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (id, name, marks)
VALUES 
(1, 'Alice', 85),
(2, 'Bob', 45),
(3, 'Carol', 70),
(4, 'Messiah', 90);
SELECT * FROM students;
-- String Comparison Function
SELECT name FROM students WHERE name LIKE 'A%';

-- String Regular Expression (REGEXP / RLIKE)
-- 1️⃣ Names Starting with ‘A’
SELECT * FROM students WHERE name REGEXP '^A'; -- SELECT * FROM students WHERE name RLIKE '^A-- ';
-- 2️⃣ Names Ending with ‘l’
SELECT * FROM students WHERE name REGEXP 'l$';
-- 3️⃣ Names Containing a Vowel-- 
SELECT * FROM students WHERE name REGEXP '[aeiou]';
-- 4️⃣ Names with Only Letters (No Digits or Symbols)
SELECT * FROM students WHERE name REGEXP '^[A-Za-z]+$';
-- 5️⃣ Names Containing ‘ar’ or ‘ob’
SELECT * FROM students WHERE name REGEXP 'ar|ob';
-- 6️⃣ Names with Double Letters
SELECT * FROM students WHERE name REGEXP '(.)\\1';

DROP TABLE IF EXISTS students;
--
SELECT 'Apple' = 'apple' AS normal_compare,
       BINARY 'Apple' = 'apple' AS binary_compare;

SELECT SOUNDEX('Frank'), SOUNDEX('Frnk');
--

-- 🧠 String Concatenation in MySQL
-- 1️⃣ Using the CONCAT() Function
/*

Syntax:
CONCAT(str1, str2, str3, ...)
Joins all given strings together into a single string.

*/

SELECT CONCAT('Hello', ' ', 'Frank') AS greeting;
-- 2️⃣ Using the CONCAT_WS() Function
/*
Syntax:
CONCAT_WS(separator, str1, str2, ...)
“WS” means With Separator — it joins strings using a separator.
*/
SELECT CONCAT_WS('-', '2025', '10', '25') AS formatted_date;
SELECT CONCAT_WS(' ', 'MySQL', 'String', 'Concatenation') AS sentence;
SELECT CONCAT_WS(' ', 'Do', 'what', 'you', 'can,','with', 'what', 'you', 'have,', 'where', 'you', 'are') AS sentence;
/*
⚠️ Note:
If any argument in CONCAT() is NULL, the entire result becomes NULL.
But CONCAT_WS() ignores NULLs.
*/
SELECT CONCAT('Frank', NULL, 'Roshan') AS result1,
       CONCAT_WS(' ', 'Frank', NULL, 'Roshan') AS result2;

-- 3️⃣ Concatenating Column Values

CREATE TABLE profile (
	id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

INSERT INTO profile VALUES
	(1, 'Frank', 'Roshan'),
    (2, 'Wyatt', 'Russell'),
    (3, 'Ryan', 'Reynolds'),
    (4, 'Stan', 'Lee');
SELECT * FROM profile;

SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM profile;
--

/*

In MySQL, numeric conversion functions are used to convert strings or other data types into numbers 
(integers, decimals, etc.), or to explicitly change numeric formats.

*/

/*

🔹 1. CAST()
Converts a value from one data type to another.
Syntax:
CAST(expression AS type)

*/
SELECT CAST('123.45' AS DECIMAL(5,2));
SELECT CAST('100' AS UNSIGNED);

/*

🔹 2. CONVERT()
Similar to CAST(), but also used for changing character sets.
Syntax:
CONVERT(expression, type)

*/
SELECT CONVERT('45.67', DECIMAL(5,2));


/*

🔹 3. Implicit Conversion
MySQL automatically converts strings to numbers when used in numeric context.

*/
SELECT '100' + 25;

/*

🔹 4. FORMAT()
Converts a number to a formatted string with commas and specified decimals.

*/
SELECT FORMAT(12345.6789, 2);


/*

🔹 5. CEILING(), FLOOR(), ROUND()
These functions change numeric precision but are often part of conversion logic.

*/
SELECT ROUND(45.678, 1);   -- 45.7
SELECT FLOOR(45.678);      -- 45
SELECT CEILING(45.678);    -- 46

/*

🔹 6. SIGNED / UNSIGNED Cast
Convert explicitly to signed or unsigned integer.

*/
SELECT CAST('-100' AS SIGNED), CAST('100' AS UNSIGNED);

-- 
USE world;
-- String Comparison Function
SELECT Name FROM country WHERE Name LIKE '_as%' ORDER BY Name;
SELECT Name FROM Country WHERE STRCMP(Name, 'France') <= 0 ORDER BY Name;
SELECT name FROM Country WHERE name LIKE 'A%';
-- Regular Expressions (REGEXP / RLIKE)
SELECT Name FROM Country WHERE Name RLIKE 'ys' ORDER BY Name;
SELECT Name FROM country WHERE Name RLIKE '[rd][ae]' ORDER BY Name;

DROP TABLE IF EXISTS world;
--

-- Numeric Conversions
/*

In MySQL, trimming and padding functions are used to remove or 
add characters (usually spaces) from/to strings.

*/

/*

🔹 1. TRIM()
Removes unwanted characters (default: spaces) from both ends of a string.
Syntax:
TRIM([BOTH | LEADING | TRAILING] [remstr] FROM str)

*/

SELECT TRIM('   MySQL   ');
SELECT TRIM(LEADING 'x' FROM 'xxxHello');
SELECT TRIM(BOTH '!' FROM '!!Welcome!!');
SELECT TRIM(TRAILING '.' FROM 'Ellipsis...');

/*

🔹 2. LTRIM()
Removes spaces (or unwanted characters) from the left side of a string.

*/
SELECT LTRIM('   Hello');

/*

🔹 3. RTRIM()
Removes spaces (or unwanted characters) from the right side of a string.

*/
SELECT RTRIM('Hello   ');

/*

🔹 4. LPAD()
Pads (adds) characters to the left side of a string until it reaches a specified length.
Syntax:
LPAD(str, length, padstr)

*/
SELECT LPAD('123', 6, '0');


/*

🔹 5. RPAD()
Pads (adds) characters to the right side of a string until it reaches a specified length.
Syntax:
RPAD(str, length, padstr)

*/
SELECT RPAD('SQL', 6, '*');

/*

| Function  | Description                               | Example              | Output   |
| --------- | ----------------------------------------- | -------------------- | -------- |
| `TRIM()`  | Removes spaces/characters from both sides | `TRIM('  hi  ')`     | `'hi'`   |
| `LTRIM()` | Removes from left                         | `LTRIM('  hi')`      | `'hi'`   |
| `RTRIM()` | Removes from right                        | `RTRIM('hi  ')`      | `'hi'`   |
| `LPAD()`  | Pads on left                              | `LPAD('7', 3, '0')`  | `'007'`  |
| `RPAD()`  | Pads on right                             | `RPAD('hi', 4, '*')` | `'hi**'` |

*/

-- CASE
/*

In MySQL, case conversion functions are used to change the text case — 
converting to upper, lower, or capitalized format.

*/

/*

🔹 1. UPPER() / UCASE()
Converts all characters in a string to uppercase.
Syntax:
UPPER(str)
-- or
UCASE(str)

*/
SELECT UPPER('mysql');
SELECT UCASE('Frank Roshan');

/*

🔹 2. LOWER() / LCASE()
Converts all characters in a string to lowercase.
Syntax:
LOWER(str)
-- or
LCASE(str)

*/
SELECT LOWER('MYSQL');
SELECT LCASE('HELLO WORLD');

/*

🔹 3. INITCAP() (Not built-in in MySQL)
⚠️ MySQL doesn’t have a direct INITCAP() 
(capitalize first letter) function like Oracle does.

*/

SELECT CONCAT(UPPER(LEFT('frank', 1)), LOWER(SUBSTRING('frank', 2)));

/*

| Function               | Description              | Example                                                       | Output    |
| ---------------------- | ------------------------ | ------------------------------------------------------------- | --------- |
| `UPPER()` / `UCASE()`  | Converts to uppercase    | `UPPER('mysql')`                                              | `'MYSQL'` |
| `LOWER()` / `LCASE()`  | Converts to lowercase    | `LOWER('MYSQL')`                                              | `'mysql'` |
| `INITCAP()` *(custom)* | Capitalizes first letter | `CONCAT(UPPER(LEFT('frank',1)), LOWER(SUBSTRING('frank',2)))` | `'Frank'` |

*/

-- Substring
/*

🔹 SUBSTRING() Function
The SUBSTRING() function extracts a specific part of a string.
🧩 Syntax:
SUBSTRING(str, start, length)

| Parameter             | Description                           |
| --------------------- | ------------------------------------- |
| `str`                 | The input string                      |
| `start`               | The starting position (1-based index) |
| `length` *(optional)* | Number of characters to return        |

⚠️ If length is omitted, it returns the substring from start to the end.

*/

-- 1️⃣ Extract substring from position
SELECT SUBSTRING('Frankly Roshan', 1, 7);

-- 2️⃣ Extract from middle
SELECT SUBSTRING('MySQL Database', 7, 8);

-- 4️⃣ Using negative start value
-- (Counts from the end of the string)
SELECT SUBSTRING('BackEnd Developer', -9, 9);

/*

💡 Equivalent Aliases:
SUBSTR(str, start, length)
MID(str, start, length)
All three (SUBSTRING, SUBSTR, MID) work the same way in MySQL.

*/

CREATE TABLE Employees (
	id INT,
    name VARCHAR(255)
);

INSERT INTO Employees VALUES 	
	(1, 'Frankly Roshan'),
    (2, 'Alison Simth'),
    (3, 'John Doe')
;

SELECT name, SUBSTRING(name, 1, 5)  AS ShortName
FROM Employees; 

DROP TABLE IF EXISTS Employees;


--


/*

🔹 SOUNDEX() Function	
The SOUNDEX() function converts a string into a phonetic code (based on how it sounds in English).
It helps you compare words that sound similar, even if they’re spelled differently.

🧩 Syntax:
SOUNDEX(string)

| Parameter | Description                                     |
| --------- | ----------------------------------------------- |
| `string`  | The input text you want to compare phonetically |

*/

-- 🧠 Example 1 — Basic Usage
SELECT SOUNDEX('Frank'), SOUNDEX('Frnk');
-- F652  |  F652
-- 👉 Both produce the same code, meaning they sound similar.

-- 🧠 Example 2 — Comparing with =
SELECT SOUNDEX('Smith') = SOUNDEX('Smyth') AS SimilarSound;
-- 1 means True — both names sound alike.

-- 🧠 Example 3 — With WHERE clause
SELECT name
FROM Employees
WHERE SOUNDEX(name) = SOUNDEX('Roshan');
-- ✅ This finds all names in the table that sound like “Roshan”, even if slightly misspelled (like Rosan, Roson, etc.).

/*

💡 How it works (Internally)
Keeps the first letter of the word.
Converts the rest into numeric digits based on sound groups (e.g., B/F/P/V = 1).
Pads or truncates the result to a 4-character code (e.g., R250).

*/

/*

| Example            | SOUNDEX() Output | Meaning               |
| ------------------ | ---------------- | --------------------- |
| `SOUNDEX('Frank')` | `F652`           | Phonetic code         |
| `SOUNDEX('Frnk')`  | `F652`           | Same sound as ‘Frank’ |
| `SOUNDEX('Smith')` | `S530`           | Sounds like “Smyth”   |
| `SOUNDEX('Smyth')` | `S530`           | Matches “Smith”       |

*/

--