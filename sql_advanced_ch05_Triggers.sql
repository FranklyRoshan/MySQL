-- Triggers
/*
⚙️ What Is a Trigger?
A trigger is a stored program in MySQL that automatically executes (fires) in response to a specific event on a table — s
uch as an INSERT, UPDATE, or DELETE.

🔹 In short:
A trigger is an automatic response to a table data modification.

🧠 Syntax
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
BEGIN
    -- SQL statements to execute automatically
END;

*/


USE workout;

-- 💡 Example 1: Log every new employee
-- Let’s say we have an employees table and a log table.
DROP TABLE IF EXISTS temp;
DROP TABLE IF EXISTS empolyees;

CREATE TABLE employees_id (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

CREATE TABLE emp_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT
ON employees_id
FOR EACH ROW
BEGIN
    INSERT INTO emp_log (message)
    VALUES (CONCAT('New employee added: ', NEW.name));
END //

DELIMITER ;

-- 🧩 What happens?
-- When a new employee is added,
-- MySQL automatically logs a message into emp_log.

INSERT INTO employees_id (name, dept_id) VALUES ('Frank', 101);

SELECT * FROM employees_id;
SELECT * FROM emp_log;

DROP TRIGGER IF EXISTS after_employee_insert;
DROP TABLE IF EXISTS employees_id;
DROP TABLE IF EXISTS emp_log;

-- 💡 Example 2: Prevent deleting important data
DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE
ON employees
FOR EACH ROW
BEGIN
    IF OLD.dept_id = 101 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You cannot delete HR department employees!';
    END IF;
END //

DELIMITER ;

-- 🧱 This trigger blocks deletion of HR employees.

/*

⚙️ Keywords: NEW and OLD
| Keyword | Description                             | Available in   |
| ------- | --------------------------------------- | -------------- |
| **NEW** | Refers to new data (inserted/updated)   | INSERT, UPDATE |
| **OLD** | Refers to existing data (before change) | UPDATE, DELETE |

*/

-- 🧩 Example 3: Audit salary updates
DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_log (message)
    VALUES (CONCAT('Salary changed for employee ID ', OLD.emp_id,
                   ' from ', OLD.salary, ' to ', NEW.salary));
END //

DELIMITER ;

-- 🧾 Viewing and Deleting Triggers
-- View all triggers
SHOW TRIGGERS;

-- Delete a trigger
DROP TRIGGER IF EXISTS after_employee_insert;

/*

️ Advantages of Triggers

✅ Automates repetitive auditing tasks
✅ Enforces business rules automatically
✅ Maintains data integrity
✅ Reduces application-side logic

⚠️ Disadvantages

🚫 Harder to debug (run in the background)
🚫 Can slow down performance if overused
🚫 Trigger order can be tricky if multiple triggers fire

*/

-- ------------------------------------------------------------------------------------------------------------------

-- Update with Trigger
/*

⚙️ Concept: “Trigger on UPDATE”
A trigger on UPDATE is a stored block of code that automatically executes before or after an UPDATE statement on a table.
It allows you to:
Log the changes made to data
Validate or restrict updates
Automatically modify or adjust related data


-- 🧠 Syntax
CREATE TRIGGER trigger_name
{BEFORE | AFTER} UPDATE
ON table_name
FOR EACH ROW
BEGIN
    -- SQL code to execute
END;

*/

-- 🔹 Example 1: Log Employee Salary Changes
-- Let’s assume we have these tables 👇

CREATE TABLE employees_salary (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Now we create a trigger that runs AFTER an UPDATE on the employees table:
DELIMITER //

CREATE TRIGGER after_salary_update
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
    -- Only log if salary actually changed
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log (emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
END //

DELIMITER ;

/*

✅ What Happens:
Whenever an employee’s salary is updated:
MySQL automatically inserts a log into salary_log
The trigger checks if salary really changed (not just re-updated same value)

*/

-- 🔹 Example 2: Automatically Update “Last Modified” Column
ALTER TABLE employees ADD COLUMN last_modified TIMESTAMP;

DELIMITER //

CREATE TRIGGER before_employee_update
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_modified = NOW();
END //

DELIMITER ;

-- 🕓 Effect: Every time you update a row in employees,
-- last_modified updates automatically to the current time.

-- 🔹 Example 3: Restrict Salary Decrease
-- If you want to prevent salary from being decreased:

DELIMITER //

CREATE TRIGGER prevent_salary_decrease
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary decrease not allowed!';
    END IF;
END //

DELIMITER ;

-- 💥 This will throw an error if someone tries to lower the salary.
-- 🧾 Checking & Managing Triggers
SHOW TRIGGERS;          -- list all triggers
DROP TRIGGER trigger_name;   -- delete a trigger

/*
🧩 Summary Table
| Trigger Timing    | Event                   | Common Use                   |
| ----------------- | ----------------------- | ---------------------------- |
| **BEFORE UPDATE** | Before the data changes | Validate or modify new data  |
| **AFTER UPDATE**  | After the data changes  | Logging or cascading updates |

*/

-- ------------------------------------------------------------------------------------------------------------------

-- Preventing Updates with Triggers
/*
⚙️ Concept: Preventing Updates

In MySQL, you can use a BEFORE UPDATE trigger to block or restrict certain updates by using the SIGNAL statement.
It’s like saying — “If this condition happens, stop the update and show an error message.”

🧠 Syntax
DELIMITER //

CREATE TRIGGER trigger_name
BEFORE UPDATE
ON table_name
FOR EACH ROW
BEGIN
    IF <condition_to_block> THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Custom error message';
    END IF;
END //

DELIMITER 
*/

-- 🔹 Example 1: Prevent Salary Reduction
-- Let’s protect employees’ salaries so that no one can reduce them accidentally 👇

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- ➤ Trigger:
DELIMITER //

CREATE TRIGGER prevent_salary_decrease
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '❌ Salary decrease is not allowed!';
    END IF;
END //

DELIMITER ;


-- ✅ Effect:
-- If anyone tries to run this:

UPDATE employees SET salary = 20000 WHERE emp_id = 1;

-- and the current salary is higher — MySQL will block it with:
-- ERROR 1644 (45000): ❌ Salary decrease is not allowed!

-- 🔹 Example 2: Prevent Updates to a Protected Column
-- Suppose you have a table of departments, and you don’t want anyone to update the department name.

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- ➤ Trigger:
DELIMITER //

CREATE TRIGGER prevent_deptname_update
BEFORE UPDATE
ON departments
FOR EACH ROW
BEGIN
    IF NEW.dept_name <> OLD.dept_name THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '❌ Department name cannot be updated!';
    END IF;
END //

DELIMITER ;


-- ✅ Effect:
-- Any UPDATE that tries to modify dept_name will be blocked with an error.

-- 🔹 Example 3: Prevent All Updates to a Table
-- You can block every update entirely — making the table effectively read-only for updates:

DELIMITER //

CREATE TRIGGER prevent_all_updates
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '❌ Updates are not allowed on this table!';
END //

DELIMITER ;


-- Now, any update attempt will fail immediately.

/*
🧩 Summary
| Goal                     | Trigger Type  | Example Condition         | Action            |
| ------------------------ | ------------- | ------------------------- | ----------------- |
| Prevent salary reduction | BEFORE UPDATE | `NEW.salary < OLD.salary` | `SIGNAL SQLSTATE` |
| Prevent name change      | BEFORE UPDATE | `NEW.name <> OLD.name`    | `SIGNAL SQLSTATE` |
| Prevent all updates      | BEFORE UPDATE | Always true               | `SIGNAL SQLSTATE` |

*/

-- ------------------------------------------------------------------------------------------------------------------

-- Example: Timestamp

-- 🕒 Goal: Automatically update a timestamp column whenever a record changes
-- You can use a BEFORE UPDATE trigger to automatically update a last_modified column with the current date and time whenever the row is updated.

-- 🧱 Step 1: Create a Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    last_modified DATETIME
);

-- 🧩 Step 2: Create the Trigger
DELIMITER //

CREATE TRIGGER update_timestamp
BEFORE UPDATE
ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_modified = NOW();
END //

DELIMITER ;

-- 🧮 Step 3: Insert Some Data
INSERT INTO employees (name, salary, last_modified)
VALUES ('Alice', 50000, NOW());

-- 🧾 Step 4: Test the Trigger
-- Now, when you update any record:

UPDATE employees
SET salary = 55000
WHERE name = 'Alice';
-- ✅ The trigger will automatically update last_modified with the current timestamp.

-- 🧠 Step 5: Verify the Change
SELECT * FROM employees;
/*

Output:
| emp_id | name  | salary   | last_modified       |
| ------ | ----- | -------- | ------------------- |
| 1      | Alice | 55000.00 | 2025-10-25 16:42:10 |

Every time you update that row, last_modified will refresh automatically.

*/

-- ⚙️ Shortcut: Using DEFAULT + ON UPDATE (Without Trigger)
-- MySQL also provides a shortcut using column definition:

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- That automatically behaves like the trigger — no need to create it manually.

/*
🧩 Summary
| Method                        | Use Case                                               | Behavior                                    |
| ----------------------------- | ------------------------------------------------------ | ------------------------------------------- |
| `BEFORE UPDATE` Trigger       | When you want custom logic along with timestamp update | Updates `last_modified` before every update |
| `ON UPDATE CURRENT_TIMESTAMP` | Simple automatic timestamp updates                     | Built-in and faster                         |
*/


-- ------------------------------------------------------------------------------------------------------------------

-- 01 update triggers

USE scratch;

DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetSale;

CREATE TABLE widgetCustomer ( id INTEGER AUTO_INCREMENT PRIMARY KEY, name VARCHAR(64), last_order_id INT );
CREATE TABLE widgetSale ( id INTEGER AUTO_INCREMENT PRIMARY KEY, item_id INT, customer_id INT, quan INT, price INT );

INSERT INTO widgetCustomer (name) VALUES ('Bob');
INSERT INTO widgetCustomer (name) VALUES ('Sally');
INSERT INTO widgetCustomer (name) VALUES ('Fred');

SELECT * FROM widgetCustomer;

DROP TRIGGER IF EXISTS newWidgetSale;
DELIMITER //
CREATE TRIGGER newWidgetSale AFTER INSERT ON widgetSale 
    FOR EACH ROW
    BEGIN
         UPDATE widgetCustomer SET last_order_id = NEW.id WHERE widgetCustomer.id = NEW.customer_id;
    END //
DELIMITER ;

INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (1, 3, 5, 1995);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (2, 2, 3, 1495);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (3, 1, 1, 2995);
SELECT * FROM widgetSale;

SELECT * FROM widgetCustomer;

DROP TRIGGER IF EXISTS newWidgetSale;
DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetSale;

-- 02 preventing updates
-- test.db

USE scratch;

USE scratch;

DROP TABLE IF EXISTS widgetSale;

CREATE TABLE widgetSale ( id INTEGER AUTO_INCREMENT PRIMARY KEY, item_id INT, customer_id INTEGER, quan INT, price INT,
    reconciled INT );
INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (1, 3, 5, 1995, 0);
INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (2, 2, 3, 1495, 1);
INSERT INTO widgetSale (item_id, customer_id, quan, price, reconciled) VALUES (3, 1, 1, 2995, 0);
SELECT * FROM widgetSale;

DROP TRIGGER IF EXISTS updateWidgetSale;
DELIMITER //
CREATE TRIGGER updateWidgetSale BEFORE UPDATE ON widgetSale
    FOR EACH ROW
    BEGIN
        IF OLD.id = NEW.id AND OLD.reconciled = 1 THEN
            SIGNAL SQLSTATE '45000' set message_text = 'cannot update reconciled row: "widgetSale"';
        END IF;
    END //
DELIMITER ;

UPDATE widgetSale SET quan = 9 WHERE id = 1;
UPDATE widgetSale SET quan = 9 WHERE id = 2;

SELECT * FROM widgetSale;

DROP TRIGGER IF EXISTS updateWidgetSale;
DROP TABLE IF EXISTS widgetSale;

-- 03 timestamps
-- test.db

USE scratch;

DROP TABLE IF EXISTS widgetSale;
DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetLog;

CREATE TABLE widgetCustomer ( id INTEGER AUTO_INCREMENT PRIMARY KEY, name VARCHAR(64), last_order_id INT, stamp VARCHAR(24) );
CREATE TABLE widgetSale ( id INTEGER AUTO_INCREMENT PRIMARY KEY, item_id INT, customer_id INTEGER, quan INT, price INT, stamp VARCHAR(24) );
CREATE TABLE widgetLog ( id INTEGER AUTO_INCREMENT PRIMARY KEY, stamp VARCHAR(24), event VARCHAR(64), username VARCHAR(64), tablename VARCHAR(64), table_id INT);

INSERT INTO widgetCustomer (name) VALUES ('Bob');
INSERT INTO widgetCustomer (name) VALUES ('Sally');
INSERT INTO widgetCustomer (name) VALUES ('Fred');
SELECT * FROM widgetCustomer;

DROP TRIGGER IF EXISTS stampSale;
DROP TRIGGER IF EXISTS newWidgetSale;
DELIMITER //
CREATE TRIGGER stampSale BEFORE INSERT ON widgetSale
    FOR EACH ROW
    BEGIN
        DECLARE nowstamp VARCHAR(24) DEFAULT NOW();
        SET NEW.stamp = nowstamp;
    END //

CREATE TRIGGER newWidgetSale AFTER INSERT ON widgetSale 
    FOR EACH ROW
    BEGIN
        DECLARE nowstamp VARCHAR(24) DEFAULT NOW();
        INSERT INTO widgetLog (stamp, event, username, tablename, table_id)
            VALUES (nowstamp, 'INSERT', USER(), 'widgetSale', NEW.id);
        UPDATE widgetCustomer SET last_order_id = NEW.id, stamp = nowstamp
             WHERE widgetCustomer.id = NEW.customer_id;
        
    END //
DELIMITER ;

INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (1, 3, 5, 1995);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (2, 2, 3, 1495);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (3, 1, 1, 2995);

SELECT * FROM widgetSale;
SELECT * FROM widgetCustomer;
SELECT * FROM widgetLog;

-- restore database
DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetSale;
DROP TABLE IF EXISTS widgetLog;

-- ----------------------------------------------------------------------------------------------------------------------
