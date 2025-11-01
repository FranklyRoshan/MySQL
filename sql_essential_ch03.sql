-- Types of Operators in MySQL
-- Operators are special symbols used to perform operations on data — like comparisons, arithmetic, or logical checks.

/*

🧮 A. Arithmetic Operators
| Operator | Description         | Example  | Result |
| -------- | ------------------- | -------- | ------ |
| `+`      | Addition            | `10 + 5` | `15`   |
| `-`      | Subtraction         | `10 - 5` | `5`    |
| `*`      | Multiplication      | `10 * 5` | `50`   |
| `/`      | Division            | `10 / 5` | `2`    |
| `%`      | Modulus (remainder) | `10 % 3` | `1`    |

*/

SELECT 100 + 50 AS Total;

/*

⚖️ B. Comparison Operators
Used in WHERE clauses to compare values.

| Operator     | Description             | Example                       | Result                      |
| ------------ | ----------------------- | ----------------------------- | --------------------------- |
| `=`          | Equal to                | `age = 25`                    | True if age is 25           |
| `!=` or `<>` | Not equal to            | `city != 'Chennai'`           | True if city is not Chennai |
| `>`          | Greater than            | `salary > 5000`               | True if salary > 5000       |
| `<`          | Less than               | `marks < 40`                  | True if marks < 40          |
| `>=`         | Greater or equal        | `age >= 18`                   | True if age ≥ 18            |
| `<=`         | Less or equal           | `age <= 60`                   | True if age ≤ 60            |
| `BETWEEN`    | Within range            | `age BETWEEN 18 AND 25`       | True if 18 ≤ age ≤ 25       |
| `IN`         | Match any value in list | `city IN ('Chennai','Delhi')` | True if city matches        |
| `LIKE`       | Pattern match           | `name LIKE 'R%'`              | True if name starts with R  |
| `IS NULL`    | Check for NULL          | `email IS NULL`               | True if no value            |

*/

/*

🔗 C. Logical Operators
Used to combine multiple conditions.

| Operator | Description                      | Example                              |
| -------- | -------------------------------- | ------------------------------------ |
| `AND`    | True if both conditions are true | `age > 18 AND city = 'Chennai'`      |
| `OR`     | True if any condition is true    | `city = 'Chennai' OR city = 'Delhi'` |
| `NOT`    | Reverses condition               | `NOT (age < 18)`                     |

*/

/*

🧱 D. Bitwise Operators
Operate on binary representations.

| Operator | Description | Example    | Result |    |     |
| -------- | ----------- | ---------- | ------ | -- | --- |
| `&`      | Bitwise AND | `5 & 3`    | `1`    |    |     |
| `        | `           | Bitwise OR | `5     | 3` | `7` |
| `^`      | Bitwise XOR | `5 ^ 3`    | `6`    |    |     |
| `~`      | Bitwise NOT | `~5`       | `-6`   |    |     |
| `<<`     | Left shift  | `5 << 1`   | `10`   |    |     |
| `>>`     | Right shift | `5 >> 1`   | `2`    |    |     

*/

/*

🧩 E. Assignment Operator

| Operator | Description                 | Example              |
| -------- | --------------------------- | -------------------- |
| `:=`     | Assigns value to a variable | `SET @total := 100;` |

*/

-- 🔢 2. Types of Functions in MySQL
-- Functions perform specific operations on data — like calculations, text processing, or date extraction.

/*

🧮 A. Numeric Functions

| Function                  | Description         | Example           | Result |
| ------------------------- | ------------------- | ----------------- | ------ |
| `ABS(x)`                  | Absolute value      | `ABS(-5)`         | 5      |
| `CEIL(x)` or `CEILING(x)` | Round up            | `CEIL(4.2)`       | 5      |
| `FLOOR(x)`                | Round down          | `FLOOR(4.9)`      | 4      |
| `ROUND(x, d)`             | Round to d decimals | `ROUND(3.1416,2)` | 3.14   |
| `MOD(x, y)`               | Remainder           | `MOD(10,3)`       | 1      |
| `POWER(x, y)`             | x to the power y    | `POWER(2,3)`      | 8      |
| `RAND()`                  | Random number       | `RAND()`          | 0.4837 |

*/

/*

✍️ B. String Functions

| Function                   | Description          | Example                  | Result  |
| -------------------------- | -------------------- | ------------------------ | ------- |
| `LENGTH(str)`              | Length of string     | `LENGTH('Frank')`        | 5       |
| `UPPER(str)`               | Convert to uppercase | `UPPER('hello')`         | `HELLO` |
| `LOWER(str)`               | Convert to lowercase | `LOWER('HELLO')`         | `hello` |
| `CONCAT(a,b,...)`          | Join strings         | `CONCAT('My','SQL')`     | `MySQL` |
| `SUBSTRING(str, pos, len)` | Extract substring    | `SUBSTRING('MySQL',2,3)` | `ySQ`   |
| `REPLACE(str, old, new)`   | Replace substring    | `REPLACE('TCS','C','Z')` | `TZS`   |
| `TRIM(str)`                | Remove spaces        | `TRIM('  hello  ')`      | `hello` |

*/

/*

📅 C. Date and Time Functions

| Function                         | Description           | Example                                  | Result                |
| -------------------------------- | --------------------- | ---------------------------------------- | --------------------- |
| `NOW()`                          | Current date and time | `NOW()`                                  | `2025-10-25 15:30:00` |
| `CURDATE()`                      | Current date          | `CURDATE()`                              | `2025-10-25`          |
| `CURTIME()`                      | Current time          | `CURTIME()`                              | `15:30:00`            |
| `YEAR(date)`                     | Extract year          | `YEAR('2025-10-25')`                     | `2025`                |
| `MONTH(date)`                    | Extract month         | `MONTH('2025-10-25')`                    | `10`                  |
| `DAY(date)`                      | Extract day           | `DAY('2025-10-25')`                      | `25`                  |
| `DATE_ADD(date, INTERVAL n DAY)` | Add days              | `DATE_ADD('2025-10-25', INTERVAL 5 DAY)` | `2025-10-30`          |
| `DATEDIFF(date1, date2)`         | Difference in days    | `DATEDIFF('2025-10-30','2025-10-25')`    | `5`                   |

*/

/*

📊 D. Aggregate Functions

| Function        | Description   | Example       |
| --------------- | ------------- | ------------- |
| `COUNT(column)` | Count rows    | `COUNT(id)`   |
| `SUM(column)`   | Sum values    | `SUM(salary)` |
| `AVG(column)`   | Average value | `AVG(marks)`  |
| `MIN(column)`   | Minimum value | `MIN(age)`    |
| `MAX(column)`   | Maximum value | `MAX(salary)` |

*/

/*

🧠 E. Control Flow Functions

| Function                                       | Description           | Example                       | Result        |
| ---------------------------------------------- | --------------------- | ----------------------------- | ------------- |
| `IF(condition, value_if_true, value_if_false)` | Conditional check     | `IF(marks>=40,'Pass','Fail')` | `'Pass'`      |
| `IFNULL(expr, alt_value)`                      | Replace NULL          | `IFNULL(phone,'No Number')`   | `'No Number'` |
| `CASE`                                         | Multi-condition logic | See below                     |               |

*/

SELECT 
    name,
    CASE 
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 75 THEN 'B'
        WHEN marks >= 60 THEN 'C'
        ELSE 'Fail'
    END AS grade
FROM students;


-- 

-- Arithmetic Operators

/*

| Operator | Description         | Example  | Result |
| -------- | ------------------- | -------- | ------ |
| `+`      | Addition            | `10 + 5` | `15`   |
| `-`      | Subtraction         | `10 - 5` | `5`    |
| `*`      | Multiplication      | `10 * 5` | `50`   |
| `/`      | Division            | `10 / 5` | `2`    |
| `%`      | Modulus (remainder) | `10 % 3` | `1`    |

*/

SELECT 10 + 5;
SELECT 10 - 5;
SELECT 10 * 5;
SELECT 10 / 5;
SELECT 10 % 3; -- SELECT MOD(10, 3);

DROP TABLE temp;

/*

| **Operator**   | **Meaning**         | **Example**                              | **Result** |
| -------------- | ------------------- | ---------------------------------------- | ---------- |
| `+`            | Addition            | `SELECT 10 + 5;`                         | ✅ `15`     |
| `-`            | Subtraction         | `SELECT 10 - 5;`                         | ✅ `5`      |
| `*`            | Multiplication      | `SELECT 10 * 5;`                         | ✅ `50`     |
| `/`            | Division            | `SELECT 10 / 5;`                         | ✅ `2`      |
| `%` or `MOD()` | Modulus (remainder) | `SELECT 10 % 3;` or `SELECT MOD(10, 3);` | ✅ `1`      |

*/

--

CREATE TABLE products (
    id INT,
    name VARCHAR(50),
    price DECIMAL(8,2),
    quantity INT
);

INSERT INTO products VALUES
(1, 'Pen', 10.00, 5),
(2, 'Book', 50.00, 2),
(3, 'Bag', 250.00, 1),
(4, 'Pencil', 5.00, 10);

SELECT * FROM products;

SELECT name, price + 5 AS 'Price with Tax' FROM products;
SELECT name, price - 2 AS 'Discounted Price' FROM products;
SELECT name, price * quantity AS 'Total Value' FROM products;
SELECT name, price / 2 AS 'Half Price' FROM products;
SELECT 10 % 3 AS Remainder;
-- or
SELECT MOD(10, 3) AS Remainder;
SELECT name, (price * quantity) + 10 AS 'Total + Handling Fee' FROM products;
 
DROP TABLE products;

--

-- MySQL Operator Precedence (from Highest → Lowest) (PEDMAS, BODMAS)
/*

| **Precedence** | **Operator(s)**                                                              | **Description**                        |            |            |
| -------------- | ---------------------------------------------------------------------------- | -------------------------------------- | ---------- | ---------- |
| 🔹 1           | `BINARY`, `COLLATE`                                                          | Character set and collation operations |            |            |
| 🔹 2           | `!`                                                                          | Logical NOT                            |            |            |
| 🔹 3           | `-` (unary minus), `~`                                                       | Negative, bitwise NOT                  |            |            |
| 🔹 4           | `^`                                                                          | Bitwise XOR                            |            |            |
| 🔹 5           | `*`, `/`, `DIV`, `%`, `MOD`                                                  | Multiplication, division, modulus      |            |            |
| 🔹 6           | `+`, `-`                                                                     | Addition and subtraction               |            |            |
| 🔹 7           | `<<`, `>>`                                                                   | Bitwise shift operators                |            |            |
| 🔹 8           | `&`                                                                          | Bitwise AND                            |            |            |
| 🔹 9           | `                                                                            | `                                      | Bitwise OR |            |
| 🔹 10          | `=` , `<=>`, `>=`, `>`, `<=`, `<`, `<>`, `!=`, `IS`, `LIKE`, `IN`, `BETWEEN` | Comparison operators                   |            |            |
| 🔹 11          | `NOT`                                                                        | Logical NOT (for conditions)           |            |            |
| 🔹 12          | `AND`, `&&`                                                                  | Logical AND                            |            |            |
| 🔹 13          | `XOR`                                                                        | Logical exclusive OR                   |            |            |
| 🔹 14          | `OR`, `                                                                      |                                        | `          | Logical OR |
| 🔹 15          | `= (assignment)`                                                             | Used in SET or UPDATE                  |            |            |
| 🔹 16          | `( )`                                                                        | Parentheses (override all precedence)  |            |            |

*/

-- Key Rule:
-- If an expression contains multiple operators, MySQL executes them in the above order, unless you use parentheses ( ) to change it.

-- ✅ Examples
-- 1️⃣ Without Parentheses
SELECT 10 + 5 * 2;

-- 2️⃣ With Parentheses
SELECT (10 + 5) * 2;

-- 3️⃣ Logical Operators Example
SELECT 10 > 5 AND 8 < 6 OR 4 = 4;

-- 4️⃣ Using Parentheses to Change Logic
SELECT 10 > 5 AND (8 < 6 OR 4 = 4);

-- 5️⃣ Bitwise vs Arithmetic
SELECT 5 + 3 * 2 & 4;

DROP TABLE temp;

/*

🧩 Tip
Always use parentheses to make your logic clear — even if you know the precedence order. 
It improves readability and prevents bugs.

*/

--

-- Logical Operators
-- Used to combine multiple conditions.

/*

| Operator | Description                      | Example                              |
| -------- | -------------------------------- | ------------------------------------ |
| `AND`    | True if both conditions are true | `age > 18 AND city = 'Chennai'`      |
| `OR`     | True if any condition is true    | `city = 'Chennai' OR city = 'Delhi'` |
| `NOT`    | Reverses condition               | `NOT (age < 18)`                     |

*/

SELECT (10 > 5 AND 8 < 12);
SELECT (10 = 5 OR 8 < 12);
SELECT NOT (10 = 5);
SELECT (10 > 5 XOR 8 < 6);

DROP TABLE temp;

/*

| **Operator** | **Meaning**                                        | **Example**                   | **Result** |
| ------------ | -------------------------------------------------- | ----------------------------- | ---------- |
| `AND`        | True if **both** conditions are true               | `SELECT (10 > 5 AND 8 < 12);` | ✅ `1`      |
| `OR`         | True if **any one** condition is true              | `SELECT (10 = 5 OR 8 < 12);`  | ✅ `1`      |
| `NOT`        | Reverses the condition                             | `SELECT NOT (10 = 5);`        | ✅ `1`      |
| `XOR`        | True if **only one** of the two conditions is true | `SELECT (10 > 5 XOR 8 < 6);`  | ✅ `1`      |
| `XOR`        | True if **only one** of the two conditions is true | `SELECT (10 > 5 XOR 8 < 6);`  | ✅ `1`      |

*/

-- 

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Aarav', 20, 'Chennai'),
(2, 'Divya', 22, 'Mumbai'),
(3, 'Rahul', 18, 'Delhi'),
(4, 'Sneha', 21, 'Chennai'),
(5, 'Vikram', 25, 'Bangalore');

-- AND
SELECT * FROM students WHERE city = 'Chennai' AND age > 20;
-- OR
SELECT * FROM students WHERE city = 'Chennai' OR city = 'Mumbai';
-- NOT
SELECT * FROM students WHERE NOT city = 'Delhi';
-- XOR
SELECT * FROM students WHERE (city = 'Chennai') XOR (age < 20);
-- Combinations of logical operators
SELECT * FROM students WHERE (city = 'Chennai' OR city = 'Mumbai') AND age BETWEEN 20 AND 22;

DROP TABLE students;

--

USE world;

SELECT NAME AS 'Country', ROUND(Population/ 1000000) AS popMM
	FROM Country
    WHERE Population > 50000000 AND Continent IN ('Asia', 'Europe')
    ORDER BY popMM DESC;
    
DROP TABLE world;

USE album;

SELECT * FROM album;
SELECT * FROM track;

-- JOIN (Joining Queries across the tables)
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num', t.title AS Track, t.duration AS Seconds
	FROM album AS a
    JOIN track AS t ON a.id = t.album_id
    WHERE t.duration > 120 AND t.track_number > 3
    ORDER BY a.artist, a.title, t.track_number;

DROP TABLE album;

--

-- ⚖️ Comparison Operators
-- Used in WHERE clauses to compare values.

SELECT 10 = 10; -- 1 true & 0 false
SELECT 10 != 5; -- SELECT 10 <> 5;
SELECT 15 > 10;
SELECT 8 < 12;
SELECT 5 >= 5;
SELECT 9 <= 15;
SELECT NULL <=> NULL; -- Safe equal to (treats NULL as a value) ~ SELECT NULL != NULL;
SELECT 10 BETWEEN 5 AND 15;
SELECT 20 NOT BETWEEN 5 AND 15;
SELECT 10 IN (5, 10, 15);
SELECT 20 NOT IN (5, 10, 15);
SELECT NULL IS NULL;
SELECT 5 IS NOT NULL;
SELECT 'apple' LIKE 'a%';
SELECT 'apple' NOT LIKE 'b%';


/*

| **Operator**              | **Meaning**                              | **Example**                       | **Result**   |
| ------------------------- | ---------------------------------------- | --------------------------------- | ------------ |
| `=`                       | Equal to                                 | `SELECT 10 = 10;`                 | ✅ `1` (true) |
| `!=` or `<>`              | Not equal to                             | `SELECT 10 != 5;`                 | ✅ `1`        |
| `>`                       | Greater than                             | `SELECT 15 > 10;`                 | ✅ `1`        |
| `<`                       | Less than                                | `SELECT 8 < 12;`                  | ✅ `1`        |
| `>=`                      | Greater than or equal to                 | `SELECT 5 >= 5;`                  | ✅ `1`        |
| `<=`                      | Less than or equal to                    | `SELECT 9 <= 15;`                 | ✅ `1`        |
| `<=>`                     | Safe equal to (treats `NULL` as a value) | `SELECT NULL <=> NULL;`           | ✅ `1`        |
| `BETWEEN ... AND ...`     | Within a range (inclusive)               | `SELECT 10 BETWEEN 5 AND 15;`     | ✅ `1`        |
| `NOT BETWEEN ... AND ...` | Outside a range                          | `SELECT 20 NOT BETWEEN 5 AND 15;` | ✅ `1`        |
| `IN (...)`                | Matches any value in the list            | `SELECT 10 IN (5, 10, 15);`       | ✅ `1`        |
| `NOT IN (...)`            | Does not match any value                 | `SELECT 20 NOT IN (5, 10, 15);`   | ✅ `1`        |
| `IS NULL`                 | Checks for `NULL`                        | `SELECT NULL IS NULL;`            | ✅ `1`        |
| `IS NOT NULL`             | Checks if not `NULL`                     | `SELECT 5 IS NOT NULL;`           | ✅ `1`        |
| `LIKE`                    | Matches a pattern                        | `SELECT 'apple' LIKE 'a%';`       | ✅ `1`        |
| `NOT LIKE`                | Does not match a pattern                 | `SELECT 'apple' NOT LIKE 'b%';`   | ✅ `1`        |

*/

/*

| Operator     | Description             | Example                       | Result                      |
| ------------ | ----------------------- | ----------------------------- | --------------------------- |
| `=`          | Equal to                | `age = 25`                    | True if age is 25           |
| `!=` or `<>` | Not equal to            | `city != 'Chennai'`           | True if city is not Chennai |
| `>`          | Greater than            | `salary > 5000`               | True if salary > 5000       |
| `<`          | Less than               | `marks < 40`                  | True if marks < 40          |
| `>=`         | Greater or equal        | `age >= 18`                   | True if age ≥ 18            |
| `<=`         | Less or equal           | `age <= 60`                   | True if age ≤ 60            |
| `BETWEEN`    | Within range            | `age BETWEEN 18 AND 25`       | True if 18 ≤ age ≤ 25       |
| `IN`         | Match any value in list | `city IN ('Chennai','Delhi')` | True if city matches        |
| `LIKE`       | Pattern match           | `name LIKE 'R%'`              | True if name starts with R  |
| `IS NULL`    | Check for NULL          | `email IS NULL`               | True if no value            |

*/

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Aarav', 20, 'Chennai'),
(2, 'Divya', 22, 'Mumbai'),
(3, 'Rahul', 18, 'Delhi'),
(4, 'Sneha', 21, 'Chennai'),
(5, 'Vikram', 25, 'Bangalore');

SELECT * FROM students;
DESCRIBE students;
SELECT * FROM students WHERE age = 21;
SELECT * FROM students WHERE age != 18;
SELECT * FROM students WHERE age BETWEEN 20 AND 22;
SELECT * FROM students WHERE city IN ('Chennai', 'Delhi');
SELECT * FROM students WHERE name LIKE 'D%';
SELECT * FROM students WHERE age IS NULL;

DROP TABLE IF EXISTS students;

/*

| **Query**                                                    | **Description**                              |
| ------------------------------------------------------------ | -------------------------------------------- |
| `SELECT * FROM students WHERE age = 21;`                     | Finds students aged **21**                   |
| `SELECT * FROM students WHERE age != 18;`                    | Excludes **Rahul**                           |
| `SELECT * FROM students WHERE age BETWEEN 20 AND 22;`        | Gets **Aarav, Divya, Sneha**                 |
| `SELECT * FROM students WHERE city IN ('Chennai', 'Delhi');` | Gets students from **Chennai** and **Delhi** |
| `SELECT * FROM students WHERE name LIKE 'D%';`               | Gets names starting with **D**               |
| `SELECT * FROM students WHERE age IS NULL;`                  | Checks for missing ages                      |

*/



--

-- IF Function

/*

🧠 Definition
The IF() function in MySQL is used to return a value based on a condition.
It works like an inline conditional statement (similar to if-else in programming).

🧩 Syntax
IF(condition, value_if_true, value_if_false)


condition → The logical test or comparison to evaluate.
value_if_true → The value returned when the condition is TRUE.
value_if_false → The value returned when the condition is FALSE.

*/

-- ✅ Example 1: Basic Usage
USE scratch;
SELECT IF(10 > 5, 'Yes', 'No') AS Result;
DROP TABLE IF EXISTS temp;

-- ✅ Example 2: With Table Data
USE scratch;
CREATE TABLE students1 (
	id INT,
    name VARCHAR(255),
    marks INT
);

INSERT INTO students1 (id, name, marks)
VALUES
(1, 'Alice', 85),
(2, 'Bob', 45),
(3, 'Carol', 70);
SELECT * FROM students1;
-- You can use the IF() function to classify results:
SELECT 
  name,
  marks,
  IF(marks >= 50, 'Pass', 'Fail') AS Result
FROM students1;

DROP TABLE IF EXISTS students1;

-- LinkedIn Course - Bill Weinman Example
USE scratch;

DROP TABLE IF EXISTS booltest;
CREATE TABLE booltest (a INTEGER, B INTEGER);
INSERT INTO booltest VALUES (1, 0);
SELECT * FROM booltest;

SELECT IF (a < 5, 'TRUE', 'FALSE') FROM booltest;
SELECT IF (b > 0, 'TRUE', 'FALSE') FROM booltest;

DROP TABLE IF EXISTS booltest;


--

-- MySQL CASE Statement Overview
/*

The CASE statement goes through conditions and returns the first matching value.
Once a condition is true, it stops checking further conditions.

*/

/*

✅ Syntax 1 — Simple CASE

Used when you compare one expression to several possible values.

CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ...
    ELSE resultN
END

*/

-- 🧠 Example 1 — Simple CASE
USE scratch;
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    grade CHAR(1)
);

INSERT INTO students VALUES
(1, 'Aarav', 'A'),
(2, 'Divya', 'B'),
(3, 'Rahul', 'C'),
(4, 'Sneha', 'A'),
(5, 'Vikram', 'D');

SELECT 
    name,
    grade,
    CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Good'
        WHEN 'C' THEN 'Average'
        ELSE 'Needs Improvement'
    END AS remarks
FROM students;

/*

✅ Syntax 2 — Searched CASE

Used when you have different conditions instead of matching one value.

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END

*/

-- 🧠 Example 2 — Searched CASE
SELECT 
    name,
    grade,
    CASE 
        WHEN grade = 'A' OR grade = 'B' THEN 'Pass'
        WHEN grade = 'C' THEN 'Reappear'
        ELSE 'Fail'
    END AS result_status
FROM students;


-- 🧮 Example 3 — With Calculations
CREATE TABLE orders (
    id INT,
    total_amount DECIMAL(8,2)
);

INSERT INTO orders VALUES
(1, 800.00),
(2, 1500.00),
(3, 3000.00),
(4, 4500.00);

SELECT 
    id,
    total_amount,
    CASE 
        WHEN total_amount < 1000 THEN 'Low'
        WHEN total_amount BETWEEN 1000 AND 3000 THEN 'Medium'
        ELSE 'High'
    END AS order_level
FROM orders;

-- 🧩 Key Points
/*

| **Concept**                                       | **Explanation**                             |
| ------------------------------------------------- | ------------------------------------------- |
| Stops at first true condition                     | Doesn’t check remaining ones                |
| Works inside `SELECT`, `WHERE`, `ORDER BY`        | Can be used anywhere conditions are allowed |
| `ELSE` is optional                                | But good to include a fallback value        |
| Can replace `IF()` when multiple conditions exist | More readable for complex logic             |

*/

-- 💡 Example with ORDER BY
SELECT name, grade
FROM students
ORDER BY 
    CASE grade
        WHEN 'A' THEN 1
        WHEN 'B' THEN 2
        WHEN 'C' THEN 3
        ELSE 4
    END;


-- LinkedIn Course - Bill Weinman Example
USE scratch;

DROP TABLE IF EXISTS booltest;
CREATE TABLE booltest (a INTEGER, b INTEGER);
INSERT INTO booltest VALUES (1, 0);
SELECT * FROM booltest; 

SELECT 
	CASE WHEN a < 5 THEN 'true' ELSE 'false' END AS boolA,
    CASE WHEN b > 0 THEN 'true' ELSE 'false' END AS boolB
	FROM booltest
;

SELECT 
	CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA,
    CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB
    FROM booltest
;
	
DROP TABLE IF EXISTS booltest;

--