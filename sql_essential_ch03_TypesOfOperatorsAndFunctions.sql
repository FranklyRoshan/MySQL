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
