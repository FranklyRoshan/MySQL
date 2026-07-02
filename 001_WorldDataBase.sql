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










