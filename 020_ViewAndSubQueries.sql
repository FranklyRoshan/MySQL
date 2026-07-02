-- 01 SubQuery
/* 
🔹 What Is a Sub-Selection (Subquery)?
A subquery is a query inside another query.
It allows you to use the result of one SELECT statement inside another SELECT, INSERT, UPDATE, or DELETE.

👉 Think of it as a query within a query.
-- query(subquery)

🔸 Basic Syntax
SELECT column_name
FROM table_name
WHERE column_name operator (SELECT column_name FROM another_table WHERE condition);

*/

USE world;

CREATE TABLE employees1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    dept_id INT,
    salary INT
);

INSERT INTO employees1 (id, name, dept_id, salary) VALUES
(1, 'Alice', 1, 60000),
(2, 'Bob', 2, 45000),
(3, 'Charlie', 1, 55000);

CREATE TABLE departments1 (
	id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(255)
);

INSERT INTO departments1 VALUES 
(1, 'HR'),
(2, 'IT');

SELECT * FROM employees1;
SELECT * FROM departments1;

-- 🔹 Example 1 — Simple Subquery in WHERE Clause
SELECT name
FROM empolyees1
WHERE dept_id = (
  SELECT id FROM departments1 WHERE dept_name = 'HR'
);
-- ✅ The inner query gets id = 1
-- ✅ The outer query then returns all employees whose dept_id = 1

-- 🔹 Example 2 — Subquery in FROM (Inline View)
-- You can also use a subquery as a temporary table.
SELECT dept_id, AVG(salary) AS avg_salary
FROM (
    SELECT * FROM employees1 WHERE salary > 50000
) AS high_paid
GROUP BY dept_id;
-- Here:
-- Inner query → selects employees with salary > 50000
-- Outer query → groups them by department to calculate average

-- 🔹 Example 3 — Subquery in SELECT List
SELECT 
  name,
  (SELECT dept_name FROM departments1 WHERE departments1.id = employees1.dept_id) AS department
FROM employees1;
-- his returns each employee’s name along with their department name.

-- 🔹 Example 4 — Subquery with IN
-- Find employees in departments IT or HR (based on subquery result):
SELECT name
FROM employees1
WHERE dept_id IN (
  SELECT id FROM departments1 WHERE dept_name IN ('IT', 'HR')
);

-- Example 5 — Correlated Subquery
-- A correlated subquery depends on the outer query for its value.
-- It runs once per row of the outer query.
SELECT name, salary
FROM employees1 e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
-- ➡ Finds employees earning more than their department’s average salary.
DROP TABLE IF EXISTS temp;

/*

🔹 Types of Subqueries
| Type             | Description                      | Example Keyword        |
| ---------------- | -------------------------------- | ---------------------- |
| **Single-row**   | Returns one value                | `=`                    |
| **Multi-row**    | Returns multiple values          | `IN`, `ANY`, `ALL`     |
| **Multi-column** | Returns multiple columns         | `(col1, col2)`         |
| **Correlated**   | Depends on outer query           | references outer alias |
| **Nested**       | Subquery inside another subquery | multiple layers        |


*/

/*

⚡ In short:
| Subquery Type  | Purpose                                |
| -------------- | -------------------------------------- |
| **In WHERE**   | Filter data based on another query     |
| **In FROM**    | Use temporary result set (inline view) |
| **In SELECT**  | Add computed column                    |
| **Correlated** | Compare each row to related data       |


*/


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



-- 02 Searching within a result set

/*

🔹 What Does “Search Within a Result Set” Mean?
It means applying an additional filter or query on top of a previous query’s result —
like saying:
“First, find all students who passed. Then, among those, find who scored above 90.”
In SQL, you can do this in two main ways:
Using a subquery (nested SELECT)
Using a derived table (subquery in FROM)

*/



USE album;
SELECT DISTINCT album_id FROM track WHERE duration <= 90;

SELECT * FROM album
	WHERE id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
;
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
  FROM album AS a
  JOIN track AS t
    ON t.album_id = a.id
  WHERE a.id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
  ORDER BY a.title, t.track_number
;
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
  FROM album AS a
  JOIN (
    SELECT DISTINCT album_id, track_number, duration, title
    FROM track
    WHERE duration <= 90
  ) AS t
    on t.album_id = a.id
  ORDER BY a.title, t.track_number
;
DROP TABLE IF EXISTS t;


-- 03 Create view
/*

In MySQL, a view is a virtual table that’s based on the result of an SQL query.
It doesn’t store actual data but acts as a saved query that you can use like a regular table.

🔹 Creating a View

Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

*/
USE scratch;

CREATE TABLE employees2 (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees2 VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'IT', 70000),
(3, 'Charlie', 'IT', 80000),
(4, 'David', 'Finance', 60000);

SELECT * FROM employees2;

CREATE VIEW it_employees2 AS
SELECT name, salary
FROM employees2
WHERE department = 'IT';

SELECT * FROM it_employees2;

CREATE OR REPLACE VIEW it_employees2 AS
SELECT name, salary, department
FROM employees2
WHERE department = 'IT';
SELECT * FROM it_employees2;

DROP VIEW it_employees2;

DROP TABLE IF EXISTS employees;


/*
🔹 Key Points
| Feature           | Description                                                     |
| ----------------- | --------------------------------------------------------------- |
| **Virtual Table** | Doesn’t store data; fetches fresh data each time you query it   |
| **Security**      | You can restrict users to see only part of the data             |
| **Simplicity**    | Simplifies complex queries by saving them as reusable views     |
| **Updatability**  | Some views (simple ones) can be updated directly; others cannot |
*/



-- 03 Creating a view

USE album;

SELECT id, album_id, title, track_number, duration DIV 60 AS m, duration MOD 60 AS s FROM track;

CREATE VIEW trackView AS
  SELECT id, album_id, title, track_number, duration DIV 60 AS m, duration MOD 60 AS s FROM track;

SELECT * FROM trackView;

SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.m, t.s
  FROM album AS a
  JOIN trackView AS t
    ON t.album_id = a.id
  ORDER BY a.title, t.track_number
;

SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, 
    CONCAT(t.m, ':', SUBSTR(CONCAT('00', t.s), -2, 2)) AS duration
  FROM album AS a
  JOIN trackView AS t
    ON t.album_id = a.id
  ORDER BY a.title, t.track_number
;

DROP VIEW IF EXISTS trackView;

--

/*

🔹 What is a Joined View?
A joined view combines columns from two or more tables using a JOIN 
(e.g., INNER JOIN, LEFT JOIN) and saves that result as a reusable virtual table.

*/

USE scratch;

CREATE TABLE departments3 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments3 (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');

SELECT * FROM departments3;

CREATE TABLE employees3 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees3 (emp_id, name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', 103);

SELECT *FROM employees3;

CREATE VIEW employee_details AS
SELECT e.emp_id, e.name, d.dept_name
FROM employees3 AS e
JOIN departments3 AS d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_details;

DROP VIEW employee_details;
DROP TABLE IF EXISTS temp;

/*

🔹 Benefits of Joined Views
| Feature                         | Description                                                           |
| ------------------------------- | --------------------------------------------------------------------- |
| 🧩 **Simplifies complex joins** | You don’t have to write the join repeatedly                           |
| 🔒 **Security**                 | You can hide sensitive columns                                        |
| 🔄 **Dynamic**                  | Always reflects the latest data from both tables                      |
| 📊 **Read-only**                | Joined views usually cannot be updated directly (depends on the join) |


*/