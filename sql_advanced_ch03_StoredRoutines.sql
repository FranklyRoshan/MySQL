/*

⚙️ Stored Routine — Overview
A stored routine is a block of SQL statements that is stored on the server and can be executed repeatedly.

Advantages:
Noarmalized operations
Centralized maintenace
Reduced traffic
Enhanced security

Disadvantage
Migration cost
Maintance challenges

There are two types:
| Type                 | Description                                                 | Returns                             |
| -------------------- | ----------------------------------------------------------- | ----------------------------------- |
| **Stored Procedure** | Performs an action (like insert, update, select).           | May return multiple values or none. |
| **Stored Function**  | Similar to a procedure, but **must return a single value**. | Always returns one value.           |

*/

-- Stored Function
/*

🧠 What Is a Stored Function?

A Stored Function in MySQL is a reusable block of SQL code that:
Takes input parameters.
Performs calculations or logic.
Returns a single value.

You can call it inside a SELECT statement — 
just like MySQL’s built-in functions (LENGTH(), ROUND(), etc.).

-- syntax
DELIMITER $$

CREATE FUNCTION function_name (parameter_name datatype, ...)
RETURNS return_datatype
[DETERMINISTIC | NOT DETERMINISTIC]
BEGIN
    -- variable declarations
    -- SQL statements
    RETURN value;
END$$

DELIMITER ;


-- syntax 
DELIMITER //

CREATE FUNCTION function_name (parameter_name datatype, ...)
RETURNS return_datatype
[DETERMINISTIC | NOT DETERMINISTIC]
BEGIN
    -- variable declarations
    -- SQL statements
    RETURN value;
END//

DELIMITER ;

Key Notes:
RETURNS defines the data type of the value to return.
DETERMINISTIC means it always gives the same output for the same input.
You must RETURN exactly one value.

*/

-- 💡 Example 1 — Simple Calculation
-- A function to add two numbers:

DELIMITER $$

CREATE FUNCTION AddNumbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END$$

DELIMITER ;

SELECT AddNumbers(10, 5) AS SumResult;

DROP TABLE IF EXISTS temp;

-- Stored Function 
-- 💼 Example 2 — Using Table Data

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


INSERT INTO employees (emp_id, name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', 103);

SELECT * FROM departments;
SELECT * FROM employees;

DELIMITER $$

CREATE FUNCTION CountEmployees(deptName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE empCount INT;
    SELECT COUNT(*) INTO empCount
    FROM employees AS e
    JOIN departments AS d ON e.dept_id = d.dept_id
    WHERE d.dept_name = deptName;
    RETURN empCount;
END$$

DELIMITER ;

SELECT CountEmployees('HR') AS HR_Employees;

DROP TABLE IF EXISTS temp;

-- 🧩 Example 3 — String Function
-- A function to return a name in uppercase:

DELIMITER //

CREATE FUNCTION ToUpper(name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN UPPER(name);
END//

DELIMITER ;

SELECT ToUpper('frank') AS UpperName;
DROP TABLE IF EXISTS temp;

/*

🧠 Difference Between Stored Function & Stored Procedure
| Feature        | Stored Function            | Stored Procedure               |
| -------------- | -------------------------- | ------------------------------ |
| Returns        | Exactly one value          | None or multiple results       |
| Called in SQL  | Yes (`SELECT func_name()`) | No (`CALL proc_name()`)        |
| Used for       | Calculations               | Actions (insert/update/select) |
| RETURN keyword | Required                   | Optional                       |

*/



/*

🧮 2️⃣ Stored Function Example
A function must return a value.
Let’s create one that returns total employees in a department.

*/
DELIMITER $$

CREATE FUNCTION CountEmployees(deptName VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE empCount INT;
    SELECT COUNT(*) INTO empCount
    FROM employees AS e
    JOIN departments AS d
    ON e.dept_id = d.dept_id
    WHERE d.dept_name = deptName;
    RETURN empCount;
END$$

DELIMITER ;

SELECT CountEmployees('HR') AS HR_Employees;

/*
🧠 Quick Summary Table

| Feature                 | Stored Procedure                 | Stored Function               |
| ----------------------- | -------------------------------- | ----------------------------- |
| Created using           | `CREATE PROCEDURE`               | `CREATE FUNCTION`             |
| Called using            | `CALL proc_name()`               | `SELECT func_name()`          |
| Returns                 | 0 or more result sets            | Always returns 1 value        |
| Can be used in `SELECT` | ❌ No                             | ✅ Yes                         |
| Used for                | Actions (INSERT, UPDATE, SELECT) | Calculations, transformations |


*/


-- 02 Creating a stored function

USE album;

DELIMITER //
CREATE FUNCTION track_len(seconds INT)
RETURNS VARCHAR(16)
DETERMINISTIC
BEGIN
    RETURN CONCAT_WS(':', seconds DIV 60, LPAD(seconds MOD 60, 2, '0' ));
END //
DELIMITER ;

SELECT title, duration AS secs, track_len(duration) AS len
  FROM track ORDER BY duration DESC;

SELECT a.artist AS artist,
    a.title AS album,
    t.title AS track,
    t.track_number AS trackno,
    track_len(t.duration) AS length
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  ORDER BY artist, album, trackno
;

SELECT a.artist AS artist,
    a.title AS album,
    track_len(SUM(duration)) AS length
  FROM track AS t
  JOIN album AS a
    ON a.id = t.album_id
  GROUP BY a.id
  ORDER BY artist, album
;

SHOW FUNCTION STATUS WHERE DEFINER LIKE 'admin%';

-- delete function with DROP FUNCTION IF EXISTS track_len;


-- ---------------------------------------------------------------------------------------------------
-- 🧩 1️⃣ Stored Procedure Example
/*

🧠 What Is a Stored Procedure?
A Stored Procedure is a named block of SQL statements that is stored in the database and executed as a single unit.

You can:
Pass parameters (IN, OUT, INOUT).
Use variables, loops, conditions.
Perform INSERT, UPDATE, DELETE, SELECT, etc.
Call it using the CALL statement.

syntax
DELIMITER $$

CREATE PROCEDURE procedure_name ([parameters])
BEGIN
    -- SQL statements go here
END$$

DELIMITER ;

-- To execute (call) it:
CALL procedure_name();


*/

USE workout;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


INSERT INTO employees (emp_id, name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', 103);

SELECT * FROM departments;
SELECT * FROM employees;


-- 💡 Example 1 — Simple Procedure
-- A basic stored procedure that displays all employees:
DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END$$

DELIMITER ;

CALL GetAllEmployees();


-- 💬 Example 2 — Procedure with Parameters
-- A stored procedure that shows employees by department:
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN deptName VARCHAR(50))
BEGIN
    SELECT e.name, d.dept_name
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    WHERE d.dept_name = deptName;
END$$

DELIMITER ;

CALL GetEmployeesByDept('HR');

-- 🔄 Example 3 — Procedure with OUT Parameter
-- This one returns the total number of employees:
DELIMITER $$

CREATE PROCEDURE GetEmployeeCount(OUT empCount INT)
BEGIN
    SELECT COUNT(*) INTO empCount FROM employees;
END$$

DELIMITER ;

CALL GetEmployeeCount(@total);
SELECT @total AS TotalEmployees;

-- 🧮 Example 4 — Inserting Data via Procedure
DELIMITER $$

CREATE PROCEDURE AddEmployee(IN empName VARCHAR(50), IN dept INT)
BEGIN
    INSERT INTO employees (name, dept_id) VALUES (empName, dept);
END$$

DELIMITER ;

CALL AddEmployee('Eve', 102);


DROP TABLE IF EXISTS temp;

--

USE workout;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');
SELECT * FROM departments;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (emp_id, name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', 103);
SELECT *FROM employees;

-- create a procedure 
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN deptName VARCHAR(50))
BEGIN
    SELECT e.emp_id, e.name, d.dept_name
    FROM employees AS e
    JOIN departments AS d
    ON e.dept_id = d.dept_id
    WHERE d.dept_name = deptName;
END$$

DELIMITER ;

-- Call the procedure
CALL GetEmployeesByDept('HR');

DROP TABLE IF EXISTS temp;

-- 03 Creating a stored procedure

USE album;

-- simple procedure
DROP PROCEDURE IF EXISTS list_albums;
DELIMITER //
CREATE PROCEDURE list_albums ()
BEGIN
    SELECT * FROM album;
END //
DELIMITER ;

CALL list_albums();


DROP PROCEDURE IF EXISTS list_albums;
DELIMITER //
CREATE PROCEDURE list_albums (param VARCHAR(255))
  BEGIN
    SELECT a.artist AS artist,
        a.title AS album,
        t.title AS track,
        t.track_number AS trackno,
        track_len(t.duration) AS length
      FROM track AS t
      JOIN album AS a
        ON a.id = t.album_id
      WHERE a.artist LIKE param
      ORDER BY artist, album, trackno
    ;
  END //
DELIMITER ;

CALL list_albums('%hendrix%');

-- with output parameter

DROP PROCEDURE IF EXISTS total_duration;
DELIMITER //
CREATE PROCEDURE total_duration (param VARCHAR(255), OUT outp VARCHAR(255))
  BEGIN
    SELECT track_len(SUM(duration)) INTO outp
      FROM track
      WHERE album_id IN (SELECT id FROM album WHERE artist LIKE param)
    ;
  END //
DELIMITER ;

CALL total_duration('%hendrix%', @dur);
SELECT @dur;

SHOW FUNCTION STATUS WHERE DEFINER LIKE 'admin%';
SHOW PROCEDURE STATUS WHERE DEFINER LIKE 'admin%';

DROP FUNCTION IF EXISTS track_len;
DROP PROCEDURE IF EXISTS list_albums;
DROP PROCEDURE IF EXISTS total_duration;

-- 04 Loops in stored procedures

USE scratch;

-- STR_COUNT()
-- count 1 to 5
-- concatenate in string
DROP PROCEDURE IF EXISTS str_count;
DELIMITER //
CREATE PROCEDURE str_count()
NO SQL
BEGIN
  DECLARE max_value INT UNSIGNED DEFAULT 5;
  DECLARE int_value INT UNSIGNED DEFAULT 0;
  DECLARE str_value VARCHAR(255) DEFAULT '';
  
  WHILE int_value < max_value DO
    SET int_value = int_value + 1;
    SET str_value = CONCAT(str_value, int_value, ' ');
  END WHILE;
  SELECT str_value;
END //
DELIMITER ;

CALL str_count();

DROP PROCEDURE IF EXISTS str_count;

/*

⚖️ Stored Procedure vs. Stored Function
| Feature         | Stored Procedure               | Stored Function               |
| --------------- | ------------------------------ | ----------------------------- |
| Returns         | None or multiple results       | Always returns a single value |
| Called by       | `CALL procedure_name()`        | `SELECT function_name()`      |
| Can modify data | ✅ Yes (INSERT, UPDATE, DELETE) | ❌ No (shouldn’t modify)       |
| RETURN keyword  | Optional                       | Required                      |
| Used for        | Actions or operations          | Calculations                  |

*/

-- ---------------------------------------------------------------------------------------------------
-- Language Extensions 
/*

🧠 What Are Language Extensions in MySQL?
In standard SQL, you can mostly only write queries — like SELECT, INSERT, etc.
But MySQL extends SQL with procedural language features, similar to other programming languages — such as:
Variables
Conditional statements
Loops
Flow control
Error handling

These are called MySQL procedural language extensions.

*/
USE workout;
CREATE TABLE employees (name VARCHAR(50));
INSERT INTO employees VALUES ('Alice'), ('Bob'), ('Charlie');

CREATE TABLE test (id INT);

DELIMITER //

CREATE PROCEDURE demo_control_structures()
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE counter INT DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_name VARCHAR(50);
    DECLARE dept_id INT DEFAULT 101;
    DECLARE deptName VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT name FROM employees;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- ✅ 1. Variables
    SET total = 10;
    SELECT total;

    SELECT COUNT(*) INTO total FROM employees;

    -- ✅ 2. Conditional Statements
    IF total > 10 THEN
        SELECT 'More than 10 employees';
    ELSE
        SELECT '10 or fewer employees';
    END IF;

    CASE dept_id
        WHEN 101 THEN SET deptName = 'HR';
        WHEN 102 THEN SET deptName = 'IT';
        ELSE SET deptName = 'Others';
    END CASE;
    SELECT deptName AS Department;

    -- ✅ 3. Loops
    SET counter = 1;
    WHILE counter <= 5 DO
        INSERT INTO test VALUES (counter);
        SET counter = counter + 1;
    END WHILE;


-- ✅ 4. Cursors
-- LEAVE — to exit a loop.
-- ITERATE — to skip to the next iteration.
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT emp_name;
    END LOOP;
    CLOSE cur;
    
END //

DELIMITER ;

CALL demo_control_structures();

/*
📘 Summary Table
| Feature        | Keyword                             | Purpose                 |
| -------------- | ----------------------------------- | ----------------------- |
| Variables      | `DECLARE`, `SET`, `SELECT ... INTO` | Store temporary data    |
| Conditions     | `IF`, `CASE`                        | Control logic           |
| Loops          | `WHILE`, `REPEAT`, `LOOP`           | Repeat operations       |
| Cursors        | `DECLARE CURSOR`, `FETCH`, `CLOSE`  | Process rows one by one |
| Error Handling | `HANDLER`, `SQLEXCEPTION`           | Handle runtime errors   |
| Flow Control   | `LEAVE`, `ITERATE`                  | Control loop execution  |

*/


-- -------------------------------------------------------------------------------------------------------


/*
🧠 Why Do We Use DELIMITER // or $$ in MySQL?

By default, MySQL recognizes ; (semicolon) as the end of a statement.
But when you create a stored procedure/function, the body itself contains multiple ; inside it — like this:

CREATE PROCEDURE sample()
BEGIN
    SELECT 'Hello';
    SELECT 'World';
END;

👉 The problem:
MySQL sees the first semicolon after SELECT 'Hello';
and thinks the procedure definition ended there — which causes a syntax error.

🛠️ Solution → Change the Delimiter
We tell MySQL to temporarily change the statement terminator to something else — commonly // or $$.

✅ Example:
DELIMITER //

CREATE PROCEDURE sample()
BEGIN
    SELECT 'Hello';
    SELECT 'World';
END /


Now, MySQL will treat everything until it sees // as part of the same block.
🔚 Why END //
END marks the end of the procedure/function,
and // tells MySQL that the entire procedure definition ends here.

So:
END //

means
👉 "End of procedure and execute the whole block now."
🔁 After You’re Done, Restore the Default
Always switch back to the default ; afterward:

DELIMITER ;

📘 Complete Example
DELIMITER //

CREATE PROCEDURE greet()
BEGIN
    SELECT 'Hello, Frank!';
END //

DELIMITER ;

-- Now call the procedure
CALL greet();


Output:
Hello, Frank!


*/