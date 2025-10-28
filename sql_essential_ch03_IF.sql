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

