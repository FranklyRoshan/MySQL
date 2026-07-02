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

