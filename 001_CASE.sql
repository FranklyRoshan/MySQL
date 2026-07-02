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