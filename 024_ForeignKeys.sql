

/*

🔑 What is a Foreign Key?
A Foreign Key (FK) is a field in one table that links to the Primary Key (PK) of another table.
It helps maintain referential integrity — ensuring that relationships between tables stay consistent.

🧱 Example Scenario
Let’s use two related tables:
departments — parent table
employees — child table

*/

-- 🏗 Step 1: Create Parent Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- 🧩 Step 2: Create Child Table with a Foreign Key
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

/*
✅ This means:
Every dept_id in employees must exist in departments.
You cannot insert or update an employee with a non-existent dept_id.
*/

-- 🧮 Step 3: Insert Data
INSERT INTO departments VALUES (101, 'HR'), (102, 'IT'), (103, 'Finance');

INSERT INTO employees (name, dept_id)
VALUES ('Alice', 101), ('Bob', 102);


-- ✅ Works fine — because 101 and 102 exist in the parent table.
-- ❌ The following will fail:

INSERT INTO employees (name, dept_id) VALUES ('Charlie', 999);

-- ➡ Error:
-- Cannot add or update a child row: a foreign key constraint fails

/*

⚙️ Foreign Key Constraints (Actions)
You can define what happens when a referenced parent row is updated or deleted.

| Action               | Meaning                                                                       |
| -------------------- | ----------------------------------------------------------------------------- |
| `ON DELETE CASCADE`  | If a department is deleted, all its employees are deleted automatically.      |
| `ON DELETE SET NULL` | If a department is deleted, the employee’s `dept_id` becomes NULL.            |
| `ON DELETE RESTRICT` | Prevents deletion of the department if any employee refers to it.             |
| `ON UPDATE CASCADE`  | If a department’s `dept_id` changes, it updates in all related employee rows. |

*/

/*

🧠 Example with CASCADE
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

✅ Now, deleting or updating a department affects the child table automatically.

*/

-- 🔍 Checking Foreign Keys
-- To see foreign keys on a table:
SHOW CREATE TABLE employees;

-- or

SELECT * FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'employees';

/*
🧩 Summary
| Concept              | Description                                             |
| -------------------- | ------------------------------------------------------- |
| **Foreign Key**      | Links one table’s column to another table’s Primary Key |
| **Purpose**          | Maintain referential integrity                          |
| **Parent Table**     | Contains the referenced key                             |
| **Child Table**      | Contains the foreign key                                |
| **Actions**          | `CASCADE`, `SET NULL`, `RESTRICT`, `NO ACTION`          |
| **Error Protection** | Prevents invalid or orphaned references                 |

*/

-- --------------------------------------------------------------------------------------------------------------------------
-- Foreign Constraints
/*
🔑 1️⃣ What Is a Foreign Key Constraint?
A foreign key constraint ensures that values in one table (child) must match values in another table (parent).
It prevents invalid data and controls what happens when parent data changes or is deleted.

🏗️ 2️⃣ Example Setup
Let’s use two tables again:
departments → parent table
employees → child table

*/

-- 🧱 Create Parent Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- 🧩 Create Child Table With Foreign Key Constraints
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/* 🧮 3️⃣ How These Constraints Work

| Constraint           | Meaning                                                       | Example                                                       |
| -------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- |
| `ON DELETE CASCADE`  | Deletes child rows automatically when parent is deleted       | Deleting a department removes all its employees               |
| `ON DELETE SET NULL` | Sets child’s foreign key column to `NULL`                     | If department is deleted, employee’s `dept_id` becomes `NULL` |
| `ON DELETE RESTRICT` | Prevents deleting parent if child exists                      | You can’t delete a department if employees still reference it |
| `ON UPDATE CASCADE`  | Updates child foreign key automatically if parent key changes | If `dept_id` changes in departments, it updates in employees  |

*/

-- 🧠 4️⃣ Example of Each Constraint
-- 🔸 CASCADE Example
CREATE TABLE employees_cascade (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- ➡️ Deleting a department also deletes all related employees.

-- 🔸 SET NULL Example
CREATE TABLE employees_setnull (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
-- ➡️ Deleting a department sets all its employees’ dept_id to NULL.

-- 🔸 RESTRICT Example
CREATE TABLE employees_restrict (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
-- ➡️ You cannot delete a department if any employee is linked to it.

-- 🧾 5️⃣ Adding a Foreign Key Constraint to an Existing Table
-- If your table already exists, use ALTER TABLE:

ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- 📋 6️⃣ View Foreign Key Information
-- To check the existing constraints:
SHOW CREATE TABLE employees;
-- or:
SELECT
    CONSTRAINT_NAME, TABLE_NAME, REFERENCED_TABLE_NAME, UPDATE_RULE, DELETE_RULE
FROM information_schema.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'your_database_name';

/*
🧩 Summary
| Feature                    | Description                                     |
| -------------------------- | ----------------------------------------------- |
| **Purpose**                | Maintain referential integrity                  |
| **Foreign Key Constraint** | Ensures valid parent–child relationship         |
| **Common Actions**         | `CASCADE`, `SET NULL`, `RESTRICT`, `NO ACTION`  |
| **Add Later**              | Use `ALTER TABLE`                               |
| **View Info**              | Use `SHOW CREATE TABLE` or `INFORMATION_SCHEMA` |

*/

-- -------------------------------------------------------------------------------------------------------------------------

-- Deleting and changing foreign keys
-- These operations are important when you need to restructure relationships between tables or change cascade rules.

-- 🧩 1️⃣ Viewing Foreign Keys
-- Before deleting or changing, you should check the foreign key name because MySQL auto-generates one if you didn’t explicitly name it.
-- To view constraints:

SHOW CREATE TABLE employees;


-- You’ll see something like this:
-- CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE

-- Here,
-- ➡️ employees_ibfk_1 is the foreign key name.
-- You’ll need it to delete or modify the constraint.

-- 🧹 2️⃣ Deleting a Foreign Key
-- To delete (drop) a foreign key constraint:
ALTER TABLE employees
DROP FOREIGN KEY employees_ibfk_1;


-- 🟢 Optional: You can also drop the index created by that foreign key (if it exists):
ALTER TABLE employees
DROP INDEX dept_id;

-- 💡 Tip: When you created a foreign key, MySQL automatically created an index on that column.
-- 🔄 3️⃣ Changing (Modifying) a Foreign Key

-- MySQL doesn’t support direct ALTER CONSTRAINT syntax.
-- To modify a foreign key (like change ON DELETE action), you must:

-- Drop the old constraint, and
-- Add a new one with the new rule.

-- 🧠 Example: Change ON DELETE RESTRICT → ON DELETE CASCADE
-- Step 1: Drop existing constraint
ALTER TABLE employees
DROP FOREIGN KEY employees_ibfk_1;

-- Step 2: Add new one
ALTER TABLE employees
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ✅ Now, deleting a department automatically deletes its employees.
-- 🧾 4️⃣ Renaming a Foreign Key
-- To rename, drop and recreate it with a new name:
ALTER TABLE employees
DROP FOREIGN KEY employees_ibfk_1;

ALTER TABLE employees
ADD CONSTRAINT fk_dept_new
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);

/*
⚠️ 5️⃣ Error Handling Tips
| Error                                                                  | Cause                                                | Solution                                                      |
| ---------------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------- |
| `Error 1215: Cannot add foreign key constraint`                        | Data types mismatch between parent and child columns | Ensure both columns have the **same data type and collation** |
| `Error 1824: Failed to open the referenced table`                      | Parent table doesn’t exist                           | Create the parent table first                                 |
| `Cannot delete or update a parent row: a foreign key constraint fails` | Restrict rule prevents delete/update                 | Drop or modify constraint with `CASCADE` or `SET NULL`        |

*/

/*

📋 6️⃣ Summary
| Action        | Syntax                                             | Description                           |
| ------------- | -------------------------------------------------- | ------------------------------------- |
| 🔍 View FK    | `SHOW CREATE TABLE table_name;`                    | See foreign key names and actions     |
| ❌ Drop FK     | `ALTER TABLE table_name DROP FOREIGN KEY fk_name;` | Remove the foreign key                |
| 🔄 Modify FK  | Drop old one → Add new with updated actions        | To change `CASCADE`, `SET NULL`, etc. |
| 🧱 Drop Index | `ALTER TABLE table_name DROP INDEX column_name;`   | Optional if index exists              |

*/

-- ------------------------------------------------------------------------------------------------------------

-- 01 Foreign keys

USE scratch;

DROP TABLE IF EXISTS widgetSale;
DROP TABLE IF EXISTS widgetCustomer;

CREATE TABLE widgetCustomer ( id INTEGER AUTO_INCREMENT PRIMARY KEY, name VARCHAR(64) );
CREATE TABLE widgetSale ( 
    id INTEGER AUTO_INCREMENT PRIMARY KEY, 
    item_id INT, 
    customer_id INT,
    quan INT,
    price INT,
    INDEX custid (customer_id),
    CONSTRAINT custid FOREIGN KEY custid(customer_id) REFERENCES widgetCustomer(id)
        ON UPDATE RESTRICT
        ON DELETE SET NULL
);

INSERT INTO widgetCustomer (name) VALUES ('Bob'), ('Sally'), ('Fred');
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (1, 3, 5, 1995), (2, 2, 3, 1495), (3, 1, 1, 2995);
SELECT * FROM widgetSale;
SELECT * FROM widgetCustomer;

UPDATE widgetCustomer SET id = 9 WHERE id = 2;

-- 02 Dropping and changing foreign keys

USE scratch;

SELECT * FROM widgetSale;
SELECT * FROM widgetCustomer;

ALTER TABLE widgetSale DROP FOREIGN KEY custid;
ALTER TABLE widgetSale ADD CONSTRAINT custid
  FOREIGN KEY (customer_id) REFERENCES widgetCustomer(id)
  ON UPDATE RESTRICT 
  ON DELETE SET NULL;

UPDATE widgetCustomer SET id = 2 WHERE id = 9;
UPDATE widgetCustomer SET id = 9 WHERE id = 2;

DROP TABLE IF EXISTS widgetCustomer;
DROP TABLE IF EXISTS widgetSale;

DROP TABLE IF EXISTS widgetSale;
DROP TABLE IF EXISTS widgetCustomer;

