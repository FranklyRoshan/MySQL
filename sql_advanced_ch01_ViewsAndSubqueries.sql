-- INDEX
/*

🔹 What is an INDEX?
An index in SQL/MySQL is a data structure (like an index in a book) that makes data retrieval faster.
It helps the database quickly locate rows instead of scanning every row in a table.

🧠 Analogy:

Think of a library book.
If you have an index at the back, you can jump straight to the topic’s page instead of reading every page.
That’s exactly how an index works in a database.

🔹 Why use Indexes?
✅ Speeds up:
SELECT queries
WHERE, JOIN, ORDER BY, and GROUP BY operations

❌ Slows down:
INSERT, UPDATE, and DELETE
(because the index must also be updated)

-- 🔹 Types of Indexes in MySQL
| Index Type             | Description                                                                          |
| ---------------------- | ------------------------------------------------------------------------------------ |
| **PRIMARY INDEX**      | Automatically created when you define a `PRIMARY KEY`. Uniquely identifies each row. |
| **UNIQUE INDEX**       | Ensures all values in a column are unique.                                           |
| **INDEX (Non-unique)** | Speeds up search queries but allows duplicates.                                      |
| **FULLTEXT INDEX**     | Used for text searching (`MATCH ... AGAINST`) in large text columns.                 |
| **COMPOSITE INDEX**    | Index on multiple columns together.                                                  |

| Feature         | Description                                            |
| --------------- | ------------------------------------------------------ |
| Purpose         | Speed up search queries                                |
| Downside        | Slower writes (INSERT/UPDATE/DELETE)                   |
| Stored          | As a separate data structure                           |
| Works Best With | Columns frequently used in `WHERE`, `JOIN`, `ORDER BY` |


-- INDEX (BTree data structure)
-- Indexes are used to find values wihtin a specific column more specific 
-- MySQL normally searches squentially through a column
-- The longer the column, the more expensive the operation is
-- UPDATE takes more time, SELECT takes less time 

🔹 What is BTREE?
BTREE (short for Balanced Tree) is a data structure that MySQL 
uses to store and organize index data efficiently.
It keeps data sorted and balanced, which makes searching, inserting, and 
deleting very fast — usually in O(log n) time complexity.

🧠 Analogy:
Think of BTREE like a dictionary:
The words are in sorted order.
You don’t read from start to end; you open the middle, check the word, 
and jump to the right section — just like a binary search.
That’s exactly how BTREE works for database indexes.

| Feature              | Description                                             |
| -------------------- | ------------------------------------------------------- |
| **Structure**        | Balanced tree (data sorted in ascending order)          |
| **Search Speed**     | Very fast for lookups and range queries                 |
| **Default Type**     | Used in MySQL for most indexes (PRIMARY, UNIQUE, INDEX) |
| **Supports**         | `=`, `<`, `>`, `BETWEEN`, and `LIKE 'prefix%'`          |
| **Does NOT Support** | `LIKE '%suffix'` (cannot use ending wildcards)          |


*/

USE scratch;

-- 🧩 Step 1: Create a Sample Table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary INT
);

-- 🧩 Step 2: Insert a Large Number of Records
DELIMITER //
CREATE PROCEDURE insert_employees()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 100000 DO
        INSERT INTO employees (name, department, salary)
        VALUES (
            CONCAT('Employee', i),
            ELT(FLOOR(1 + RAND() * 4), 'HR', 'IT', 'Finance', 'Admin'),
            FLOOR(30000 + (RAND() * 70000))
        );
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL insert_employees();


-- 🧩 Step 3: Run a Query Without an Index
EXPLAIN SELECT * FROM employees 
WHERE department = 'IT' AND salary > 70000;


-- 🧩 Step 4: Create an Index on the Columns Used in the WHERE Clause
CREATE INDEX idx_dept_salary ON employees(department, salary);

-- 🧩 Step 5: Run the Same Query Again
EXPLAIN SELECT * FROM employees 
WHERE department = 'IT' AND salary > 70000;

/*

-- 🧠 What Happened?
| Before Index            | After Index            |
| ----------------------- | ---------------------- |
| Full table scan (slow)  | Index lookup (fast)    |
| No `possible_keys` used | Uses `idx_dept_salary` |
| Scanned 100K rows       | Scanned only 2.5K rows |


*/

-- 🧩 Step 6: Drop the Index (Optional)
DROP INDEX idx_dept_salary ON employees;

-- ⚡ Summary
/*

| Concept    | Without Index     | With Index          |
| ---------- | ----------------- | ------------------- |
| Query Type | Full table scan   | Range scan          |
| Speed      | Slow              | Fast                |
| Use Case   | Small tables      | Large tables        |
| Example    | department = 'IT' | department + salary |


*/


-- Creating an index
USE scratch;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    string1 VARCHAR(128) UNIQUE,
    string2 VARCHAR(128),
    UNIQUE INDEX i_str2 (string2)
);

SHOW INDEX FROM test;

CREATE INDEX i_str2 ON test(string2);
CREATE UNIQUE INDEX i_str2 ON test(string2);

DROP TABLE IF EXISTS test;

-- Showing indexes
USE scratch;

SHOW INDEXES IN customer;

SELECT * FROM information_schema.statistics WHERE table_schema = 'scratch';

-- Dropping indexes
USE scratch;

DESCRIBE customer;

SELECT * FROM customer;

SHOW INDEX FROM customer;

CREATE INDEX custzip ON customer(zip);

DROP INDEX custzip ON customer;

-- Multi-column indexes
USE scratch;

DROP TABLE IF EXISTS test;

CREATE TABLE test (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    string1 VARCHAR(128),
    string2 VARCHAR(128),
    INDEX twostrs(string1, string2)
);

SELECT *FROM test;
INSERT INTO test (string1, string2) VALUES ('foo', 'bar'), ('this', 'that'), ('another', 'row'), ('foo', 'alpha');
SELECT string1, string2 FROM test ORDER BY string1, string2;

SHOW INDEX FROM test;
EXPLAIN SELECT string1, string2 FROM test ORDER BY string1, string2;

ALTER TABLE test DROP INDEX twostrs;
SHOW INDEXES FROM test;

DROP TABLE IF EXISTS test;




--

-- SubQuery
-- a query within another query
-- query(subquery)

USE world;

DROP TABLE IF EXISTS t;
CREATE TABLE T (a TEXT, b TEXT);
INSERT INTO t VALUES ('NY0123', 'US4567');
INSERT INTO t VALUES ('AZ9437', 'GB1234');
INSERT INTO t VALUES ('CA1279', 'FR5678');
SELECT * FROM  t;

SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode,
	SUBSTR(b, 1,2) as Country, SUBSTR (b, 3) AS CCode FROM t;
    
SELECT ss.CCode FROM (
	SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode,
		SUBSTR(b, 1,2) as Country, SUBSTR(b, 3) AS CCode FROM t
) AS ss;


SELECT co.Name, ss.CCode FROM (
	SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode,
		SUBSTR(b, 1,2) AS Country, SUBSTR(b, 3) AS CCode FROM t
) AS ss
JOIN Country AS co 
	ON co.Code2 = ss.Country;
 
 DROP TABLE IF EXISTS t;

