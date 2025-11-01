USE album;

SELECT * FROM album;
SELECT * FROM track;

-- JOIN (Joining Queries across the tables)
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num', t.title AS Track, t.duration AS Seconds
	FROM album AS a
    JOIN track AS t ON a.id = t.album_id
    ORDER BY a.artist, a.title, t.track_number;
    
-- ⚙️ MySQL Workbench Shortcut Keys
-- 🧩 General Shortcuts
/*

| **Action**     | **Shortcut (Windows/Linux)** | **Shortcut (macOS)** |
| -------------- | ---------------------------- | -------------------- |
| New SQL Tab    | `Ctrl + T`                   | `Cmd + T`            |
| Open SQL File  | `Ctrl + O`                   | `Cmd + O`            |
| Save SQL File  | `Ctrl + S`                   | `Cmd + S`            |
| Close Tab      | `Ctrl + W`                   | `Cmd + W`            |
| Exit Workbench | `Ctrl + Q`                   | `Cmd + Q`            |
| Full Screen    | `F11`                        | `Cmd + Ctrl + F`     |

*/

-- 🧮 SQL Editor Shortcuts
/*

| **Action**                | **Shortcut (Windows/Linux)** | **Shortcut (macOS)**  |
| ------------------------- | ---------------------------- | --------------------- |
| Execute Current Statement | `Ctrl + Enter`               | `Cmd + Enter`         |
| Execute All Queries       | `Ctrl + Shift + Enter`       | `Cmd + Shift + Enter` |
| Stop Execution            | `Ctrl + .`                   | `Cmd + .`             |
| Comment Selected Lines    | `Ctrl + /`                   | `Cmd + /`             |
| Uncomment Lines           | `Ctrl + Shift + /`           | `Cmd + Shift + /`     |
| Duplicate Line            | `Ctrl + D`                   | `Cmd + D`             |
| Delete Line               | `Ctrl + E`                   | `Cmd + E`             |
| Auto-complete / Suggest   | `Ctrl + Space`               | `Ctrl + Space`        |
| Format SQL Code           | `Ctrl + B`                   | `Cmd + B`             |
| Reconnect to Server       | `Ctrl + R`                   | `Cmd + R`             |

*/


-- 🔍 Navigation Shortcuts
/*

| **Action**              | **Shortcut**         |
| ----------------------- | -------------------- |
| Move to Next Tab        | `Ctrl + Tab`         |
| Move to Previous Tab    | `Ctrl + Shift + Tab` |
| Go to Beginning of Line | `Home`               |
| Go to End of Line       | `End`                |
| Find Text               | `Ctrl + F`           |
| Replace Text            | `Ctrl + H`           |
| Jump to Line Number     | `Ctrl + G`           |

*/

-- ⚡ Result Grid Shortcuts
/*

| **Action**       | **Shortcut**       |
| ---------------- | ------------------ |
| Export Resultset | `Ctrl + Shift + E` |
| Copy Row(s)      | `Ctrl + C`         |
| Paste Row(s)     | `Ctrl + V`         |
| Select All Rows  | `Ctrl + A`         |
| Refresh Data     | `F5`               |
| Edit Row Data    | `F2`               |

*/

-- 💻 Command Line (MySQL Shell / CMD)
/*

| **Action**             | **Command / Shortcut**                  |
| ---------------------- | --------------------------------------- |
| Connect to MySQL       | `mysql -u root -p`                      |
| List Databases         | `SHOW DATABASES;`                       |
| Use a Database         | `USE db_name;`                          |
| Show Tables            | `SHOW TABLES;`                          |
| Describe Table         | `DESC table_name;`                      |
| Clear Screen           | `Ctrl + L` (or `system cls` on Windows) |
| Exit MySQL             | `exit` or `quit`                        |
| Rerun Previous Command | `↑` (Up Arrow)                          |
| Cancel Current Command | `Ctrl + C`                              |

*/


USE scratch;

-- Finding databases, tables and columns
SHOW DATABASES;
SHOW TABLES;
DROP TABLE scratch;
DESCRIBE customer;
SHOW TABLE STATUS;
SHOW CREATE TABLE customer;

-- INSERT (Inserting data)
SELECT * FROM customer;
INSERT INTO customer (name, address, city, state, zip) VALUES ('Fred Flintstone', '123 cobblestone way', 'Bedrock', 'CA', '91234');
INSERT INTO customer (name, city, state) VALUES ('Jimi Hendrix', 'Renton', 'WA');

-- UPDATE (Updating data)
SELECT * FROM customer WHERE name LIKE 'Jimi%';
UPDATE customer SET address = '123 Music Avenue', zip = '98056' WHERE name LIKE 'Jimi%'; 
UPDATE customer SET address = NULL, city = NULL WHERE name LIKE 'Jimi%'; 

-- DELETE (Deleting data)
SELECT * FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';
DELETE FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';


DROP TABLE customer;


--

USE world;

-- This is a comment
SELECT 'Hello, World';
SELECT 1 + 2;  

/*

	This is a c-style 
	multi-line
	comment.

*/
    
# not standard SQL comment

-- SELECT (Selecting Rows)
SELECT * FROM Country;
SELECT * FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy AS 'Life Exp' FROM Country ORDER BY Name;
SELECT COUNT(*) FROM Country;
SELECT * FROM Country ORDER BY Name LIMIT 5;
SELECT * FROM Country ORDER BY Name LIMIT 5, 5;
SELECT * FROM Country ORDER BY Name LIMIT 10, 5;


-- SELECT (Selecting Columns)
SELECT * FROM Country ORDER BY Code;
SELECT Code, Name, Region, Population FROM Country ORDER BY Code;
SELECT Code AS 'ISO', Name AS 'Country', Region, Population AS 'Pop' FROM Country ORDER BY Code;

-- COUNT (Count rows)
SELECT COUNT(*) FROM Country;
SELECT COUNT(*) FROM Country WHERE Population > 1000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000;
SELECT COUNT(*) FROM Country WHERE Population > 100000000 AND Continent = 'Europe';
SELECT COUNT(LifeExpectancy) FROM Country;


   
/*

a. SELECT
Fetch specific columns:
SELECT name, age FROM students;

Fetch all columns:
SELECT * FROM students;

b. WHERE
Filter rows:
SELECT * FROM students WHERE age > 20;

c. ORDER BY
Sort results:
SELECT name, age FROM students ORDER BY age DESC;

*/

-- Step 1: Create a Database
CREATE DATABASE school;
USE school;

-- Step 2: Create a Table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

-- Step 3: Insert Sample Data
INSERT INTO students (name, age, city) VALUES 
('Aarav', 20, 'Chennai'),
('Divya', 22, 'Mumbai'),
('Rahul', 18, 'Delhi'),
('Sneha', 21, 'Chennai'),
('Vikram', 25, 'Bangalore');

-- Select all students
SELECT * FROM students;

-- Select names of students who are 18 years old
SELECT name FROM students WHERE age = 18;

-- Sort students by name alphabetically
SELECT * FROM students ORDER BY name ASC;












