-- ============================================================================
-- CREATE DATABASE
-- ============================================================================

-- ============================================================================
-- 
-- ============================================================================

CREATE DATABASE IF NOT EXISTS frank;
USE frank;
SHOW DATABASES;

-- Data Preprocessing
-- SELECT * FROM consumer_compliant_records as consumer LIMIT 100;
-- DESCRIBE consumer_compliant_records;

-- ALTER TABLE consumer_compliant_records RENAME TO ConsumerComplaints;
-- -- Alternative SYNTAX:
-- RENAME TABLE consumer_compliant_records TO ConsumerComplaints;

-- ALTER TABLE consumer_complaints 
--     CHANGE COLUMN `Date Received` date_received DATE,
--     CHANGE COLUMN `Product Name` product_name VARCHAR(255),
--     CHANGE COLUMN `Sub Product` sub_product VARCHAR(255),
--     CHANGE COLUMN `Sub Issue` sub_issue VARCHAR(255),
--     CHANGE COLUMN `Consumer Complaint Narrative` consumer_complaint_narrative TEXT,
--     CHANGE COLUMN `Company Public Response` company_public_response TEXT,
--     CHANGE COLUMN `State Name` state_name VARCHAR(100),
--     CHANGE COLUMN `Zip Code` zip_code VARCHAR(20),
--     CHANGE COLUMN `Consumer Consent Provided` consumer_consent_provided VARCHAR(50),
--     CHANGE COLUMN `Submitted via` submitted_via VARCHAR(100),
--     CHANGE COLUMN `Date Sent to Company` date_sent_to_company DATE,
--     CHANGE COLUMN `Company Response to Consumer` company_response_to_consumer VARCHAR(255),
--     CHANGE COLUMN `Timely Response` timely_response VARCHAR(10),
--     CHANGE COLUMN `Consumer Disputed` consumer_disputed VARCHAR(10),
--     CHANGE COLUMN `Complaint ID` complaint_id INT;

-- RENAME TABLE consumer_complaints TO ConsumerComplaints;

-- ALTER TABLE ConsumerComplaints 
--     CHANGE COLUMN date_received DateReceived DATE,
--     CHANGE COLUMN product_name ProductName VARCHAR(255),
--     CHANGE COLUMN sub_product SubProduct VARCHAR(255),
--     CHANGE COLUMN sub_issue SubIssue VARCHAR(255),
--     CHANGE COLUMN consumer_complaint_narrative ConsumerComplaintNarrative TEXT,
--     CHANGE COLUMN company_public_response CompanyPublicResponse TEXT,
--     CHANGE COLUMN state_name StateName VARCHAR(100),
--     CHANGE COLUMN zip_code ZipCode VARCHAR(20),
--     CHANGE COLUMN consumer_consent_provided ConsumerConsentProvided VARCHAR(50),
--     CHANGE COLUMN submitted_via SubmittedVia VARCHAR(100),
--     CHANGE COLUMN date_sent_to_company DateSentToCompany DATE,
--     CHANGE COLUMN company_response_to_consumer CompanyResponseToConsumer VARCHAR(255),
--     CHANGE COLUMN timely_response TimelyResponse VARCHAR(10),
--     CHANGE COLUMN consumer_disputed ConsumerDisputed VARCHAR(10),
--     CHANGE COLUMN complaint_id ComplaintId INT;


-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

-- Insert the sample data
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

-- 3. Verify the inserted data
SELECT * FROM Customers;

-- 1. Create the table structure
CREATE TABLE products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierId INT,
    CategoryId INT,
    Unit VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- 2. Insert the data rows
INSERT INTO products (ProductId, ProductName, SupplierId, CategoryId, Unit, Price)
VALUES 
    (1, 'Chais', 1, 1, '10 boxes x 20 bags', 18.00),
    (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00),
    (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00),
    (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00),
    (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35);

-- 3. Verify the inserted data
SELECT * FROM products;

-- 1. Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL
);

-- 2. Insert the parsed data rows
INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES 
    (1, 10248, 11, 12),
    (2, 10248, 42, 10),
    (3, 10248, 72, 5),
    (4, 10249, 14, 9),
    (5, 10249, 51, 40);

-- 3. Verify the inserted data
SELECT * FROM OrderDetails;

-- 1. Create the OrderDetails table
CREATE TABLE Suppliers (
	SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255), 
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

-- 2. Insert the parsed data rows
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country)
VALUES 
    (1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK'),
    (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'P.O. Box 78934', 'New Orleans', '70117', 'USA'),
    (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA'),
    (4, 'Tokyo Traders', 'Yoshi Nagase', '9-8 Sekimai Musashino-shi', 'Tokyo', '100', 'Japan');

-- 3. Verify the inserted data
SELECT * FROM Suppliers;


-- ==========================================================================
/* Mnemonics

1. WRITING ORDER (How you type it)
Mnemonic: "Slip Forward When Ground Has Oily Liquid"
```
SELECT   column_name             -- Slip
FROM     table_name              -- Forward
WHERE    condition               -- When
GROUP BY column_name             -- Ground
HAVING   aggregate_condition     -- Has
ORDER BY column_name             -- Oily
LIMIT    count;                  -- Liquid
```

2. LOGICAL EXECUTION ORDER (How the database processes it)
Mnemonic: "Fresh Water Gives Healthy Skin Often"
```
FROM     table_name              -- 1. Fresh   (Find the data source)
WHERE    condition               -- 2. Water   (Filter individual rows)
GROUP BY column_name             -- 3. Gives   (Group rows into buckets)
HAVING   aggregate_condition     -- 4. Healthy (Filter grouped buckets)
SELECT   column_name             -- 5. Skin    (Pick output columns)
ORDER BY column_name;            -- 6. Often   (Sort final results)
```
*/
-- ==========================================================================

-- MySQL SQL

SHOW TABLES;

-- SELECT 
SELECT CustomerName, City, Country FROM Customers;

SELECT ProductName 
FROM ConsumerComplaints LIMIT 100;

-- SELECT SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name;

SELECT DateReceived, ProductName, Issue, Company, StateName 
FROM ConsumerComplaints LIMIT 100;

--  SELECT ALL Columns
SELECT * FROM ConsumerComplaints LIMIT 100;
SELECT * FROM ConsumerComplaints;

SELECT * FROM Customers LIMIT 3;
SELECT * FROM Customers;

-- SELECT DISTINCT
SELECT DISTINCT Country FROM Customers;
SELECT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;

SELECT DISTINCT ProductName FROM ConsumerComplaints;


-- SELECT DISTINCT SYNTAX
-- SELECT DISTINCT column1, column2, ...
-- FROM table_name;

-- WHERE
SELECT * FROM Customers
WHERE Country = 'Mexico';
SELECT * FROM Customers
WHERE CustomerID = 1;
SELECT * FROM Customers
WHERE CustomerID > 80;

SELECT * FROM ConsumerComplaints WHERE StateName = 'VA';

-- WHERE SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

-- Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.

-- ORDER BY
SELECT * FROM Products
ORDER BY Price;

SELECT * FROM ConsumerComplaints ORDER BY Company;
SELECT * FROM ConsumerComplaints ORDER BY ProductName;

-- ORDER BY SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- ORDER BY column1, column2, ... ASC|DESC;

-- ORDER BY DESC
SELECT * FROM Products
ORDER BY Price DESC;

SELECT * FROM ConsumerComplaints ORDER BY Company DESC;

-- ORDER BY ASC (default)
SELECT * FROM ConsumerComplaints ORDER BY Company;
SELECT * FROM ConsumerComplaints ORDER BY Company ASC;

-- ORDER BY Several Columns
SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM ConsumerComplaints ORDER BY Company, StateName;
SELECT * FROM ConsumerComplaints ORDER BY StateName, Company;

-- Combine ASC and DESC
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

SELECT * FROM ConsumerComplaints 
ORDER BY company ASC, ProductName DESC;

-- AND 
SELECT * FROM Customers
WHERE Country = 'UK' AND City = 'London';

SELECT * FROM ConsumerComplaints 
WHERE company = 'Bank of America' AND StateName = 'CA';

-- Note: The AND operator displays a record if all the conditions are TRUE.

-- AND SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition1 AND condition2 AND condition3 ...;

-- The AND operator displays a record if all the conditions are TRUE.
-- The OR operator displays a record if any of the conditions are TRUE.

-- Combining AND and OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM ConsumerComplaints 
WHERE company = 'Bank of America' AND (StateName = 'CA' OR StateName = 'NY');

-- OR
SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'Stuttgart';
SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

SELECT * FROM ConsumerComplaints 
WHERE company = 'Bank of America' OR company = 'Discover';
SELECT * FROM ConsumerComplaints 
WHERE StateName = 'NY' OR StateName = 'NJ';

-- Note: The OR operator displays a record if any of the conditions are TRUE.

-- OR SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition1 OR condition2 OR condition3 ...;

-- Combining AND and OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM ConsumerComplaints 
WHERE company = 'Bank of America' AND (StateName = 'CA' OR StateName = 'NY');

-- NOT
SELECT * FROM Customers
WHERE NOT Country = 'Germany';

SELECT * FROM ConsumerComplaints 
WHERE NOT StateName = 'PA'; 

-- NOT SYNTAX
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE NOT condition;

-- The NOT operator is also used in combination with other operators to exclude data, such as:
-- NOT LIKE
-- NOT BETWEEN
-- NOT IN
-- IS NOT NULL
-- NOT EXISTS

-- Combining AND, OR and NOT
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');
SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'A%';
SELECT * FROM Customers
WHERE CustomerID NOT BETWEEN 10 AND 60;
SELECT * FROM Customers
WHERE City NOT IN ('Paris', 'London');
SELECT * FROM Customers
WHERE NOT CustomerID > 50;

SELECT * FROM ConsumerComplaints 
WHERE company = 'Bank of America' AND (StateName = 'CA' OR StateName = 'NY');

SELECT * FROM ConsumerComplaints 
WHERE NOT company = 'Bank of America' AND NOT company = 'Discover';

SELECT * FROM ConsumerComplaints
WHERE company NOT LIKE 'A%';

SELECT * FROM ConsumerComplaints
WHERE company LIKE 'A%';

-- A percent sign % - represents zero, one, or multiple characters
-- A underscore sign _ - represents a single character

SELECT * FROM ConsumerComplaints 
WHERE ComplaintId NOT BETWEEN 400000 AND 500000;

SELECT * FROM ConsumerComplaints
WHERE DateReceived NOT BETWEEN '2013-01-01' AND '2014-12-31';

SELECT * FROM ConsumerComplaints
WHERE StateName NOT IN ('MO', 'FL', 'MI', 'VA', 'PC');

SELECT * FROM ConsumerComplaints
WHERE NOT ComplaintId < 1000000;

SELECT * FROM ConsumerComplaints
WHERE NOT ComplaintId > 1000000;


-- INSERT INTO Statement

-- INSERT INTO Customers
-- VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- Insert Data Only in Specific Columns
-- INSERT INTO Customers (CustomerName, City, Country)
-- VALUES ('Cardinal', 'Stavanger', 'Norway');

-- Insert Multiple Rows
-- INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES
-- ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
-- ('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
-- ('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

-- NULL Value
-- IS NULL & IS NOT NULL

SELECT * FROM ConsumerComplaints
WHERE SubIssue IS NULL;

SELECT * FROM ConsumerComplaints 
WHERE SubIssue IS NOT NULL;

SELECT * FROM Customers
WHERE ContactName IS NULL;

SELECT * FROM Customers
WHERE ContactName IS NOT NULL;

-- UPDATE Statement
-- UPDATE Customers
-- SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
-- WHERE CustomerID = 1;

-- UPDATE Multiple Records
-- UPDATE Customers
-- SET PostalCode = 00000
-- WHERE Country = 'Mexico';

-- Update Warning!
-- UPDATE Customers
-- SET PostalCode = 00000;


-- DELETE  Statement
-- It is possible to delete all records in a table, without deleting the table. 
-- This means that the table structure, attributes, and indexes will be intact.

-- DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';
-- SELECT * FROM Customers; 

-- INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES 
-- (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany');

-- Delete All Records
-- DELETE FROM Customers;

-- Delete a Table
-- To delete the table completely, use the DROP TABLE statement:
-- DROP TABLE Customers;


-- LIMIT Clause
SELECT * FROM Customers LIMIT 3;
SELECT * FROM ConsumerComplaints LIMIT 10;

-- LIMIT with a OFFSET clause
-- In SQL, the OFFSET clause skips a specified number of rows before returning the remaining records from a query. 
-- It is primarily paired with LIMIT or FETCH to implement data pagination, allowing applications to load large datasets in smaller, manageable pages.
SELECT * FROM ConsumerComplaints LIMIT 10 OFFSET 3;

-- LIMIT with a WHERE clause
SELECT * FROM ConsumerComplaints WHERE StateName = 'NY' LIMIT 10;

-- LIMIT with an ORDER BY CLAUSE
SELECT * FROM ConsumerComplaints ORDER BY ProductName LIMIT 10;

-- Aggregate Functions
-- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
-- Aggregate functions are often used with the GROUP BY clause of the SELECT statement. 
-- The GROUP BY clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.

-- The most commonly used SQL aggregate functions are:

-- MIN() - returns the smallest value of a column
-- MAX() - returns the largest value of a column
-- COUNT() - returns the number of rows in a set
-- SUM() - returns the sum of a numerical column
-- AVG() - returns the average value of a numerical column

-- Aggregate functions ignore null values (except for COUNT(*)).

-- MIN() Function
-- The MIN() function returns the smallest value of the selected column.
-- The MIN() function works with numeric, string, and date data types. 
SELECT MIN(Price) AS HighestPrice
FROM Products;

-- MIN() with Date Column
SELECT MIN(DateReceived) AS EarliestDateReceived
FROM ConsumerComplaints;

-- MAX() Function
-- The MAX() function returns the largest value of the selected column.
-- The MAX() function works with numeric, string, and date data types. 

SELECT MAX(Price) AS LowestPrice
FROM Products;

-- MAX() with Date Column
SELECT MAX(DateReceived) AS LatestDate
FROM ConsumerComplaints;


-- COUNT() Function
-- The COUNT() function returns the number of rows that matches a specified criterion.

-- The behavior of COUNT() depends on the argument used within the parentheses:

-- COUNT(*) - Counts the total number of rows in a table (including NULL values).
-- COUNT(columnname) - Counts all non-null values in the column.
-- COUNT(DISTINCT columnname) - Counts only the unique, non-null values in the column.

-- COUNT(*)
SELECT COUNT(*) FROM ConsumerComplaints;
SELECT COUNT(*) FROM Country;
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Products;

-- COUNT(column_name)
SELECT COUNT(ProductId) FROM Products;

-- COUNT(DISTINCT column_name)
SELECT COUNT(DISTINCT Price) FROM Products;
SELECT COUNT(DISTINCT Price) FROM Products WHERE Price > 20;

-- SUM() Function
-- The SUM() function is used to calculate the total sum of values within a numeric column.
-- The SUM() function ignores NULL values in the column.

SELECT SUM(quantity) AS TotalQuantity
FROM OrderDetails;

SELECT SUM(quantity) FROM OrderDetails
WHERE ProductId = 11;


-- AVG() Function
-- The AVG() function returns the average value of a numeric column.
-- The AVG() function ignores NULL values in the column.

SELECT AVG(quantity) AS AverageQuantity
FROM OrderDetails;

SELECT AVG(Price)
FROM Products
WHERE CategoryID = 1;

SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);

-- LIKE Operator
-- The LIKE operator is used in a WHERE clause to search for a specified pattern within a column's text data.

-- There are two wildcards often used in conjunction with the LIKE operator:

-- A percent sign % - represents zero, one, or multiple characters
-- A underscore sign _ - represents a single character
-- The percent sign and the underscore can also be used in combinations!

-- LIKE Operator	Description
-- WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
-- WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
-- WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
-- WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
-- WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
-- WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
-- WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

SELECT DISTINCT Company FROM ConsumerComplaints
WHERE Company LIKE 'A%';


-- Wildcard Characters
-- A wildcard character is used to substitute one or more characters in a string.

-- Wildcard characters are used with the LIKE operator. The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- MySQL Wildcard Characters
-- Symbol	Description	Example
-- %	Represents zero, one, or multiple characters	bl% finds bl, black, blue, and blob
-- _	Represents a single character	h_t finds hot, hat, and hit
-- The wildcards can also be used in combinations!

-- Here are some examples showing different LIKE operators with '%' and '_' wildcards:

-- LIKE Operator	Description
-- WHERE CustomerName LIKE 'a%'	Finds any values that starts with "a"
-- WHERE CustomerName LIKE '%a'	Finds any values that ends with "a"
-- WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
-- WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
-- WHERE CustomerName LIKE 'a_%_%'	Finds any values that starts with "a" and are at least 3 characters in length
-- WHERE ContactName LIKE 'a%o'	Finds any values that starts with "a" and ends with "o"

-- Using the % Wildcard
SELECT * FROM Customers
WHERE City LIKE 'ber%';

SELECT * FROM Customers
WHERE City LIKE '%es%';

-- Using the _ Wildcard
SELECT * FROM Customers
WHERE City LIKE '_ondon';

SELECT * FROM Customers
WHERE City LIKE 'L_n_on';

-- IN Operator
-- The IN operator is used in the WHERE clause to check if a specified column's value matches any value within a provided list.

-- The IN operator functions as a shorthand for multiple OR conditions, making queries shorter and more readable.

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM OrderDetails);

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM OrderDetails);


-- BETWEEN Operator
-- The BETWEEN operator is used in the WHERE clause to select values within a specified range.
-- The range is inclusive - the beginning and end values of the range are included in the results.
-- The values can be numbers, text, or dates.

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryId IN (1, 2, 3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

-- Aliases
-- An alias is created with the AS keyword, and is often used to make a column name more readable.
-- An alias only exists for the duration of that query.

-- Aliases are useful when:
-- There are more than one table involved in a query
-- Functions are used in the query
-- Column names are long or not very readable
-- Two or more columns are combined together

-- Alias
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

-- Alias with Spaces
SELECT CustomerName AS Customer, ContactName AS "Contact Person"
FROM Customers;

-- Concatenate Columns
-- The following SQL creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):

SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS Address
FROM Customers;

-- Alias for Tables
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;


-- JOIN Clause
-- The JOIN clause is used to combine rows from two or more tables, based on a related column between them.

-- Here are the different types of JOINs in MySQL:

-- INNER JOIN: Returns only rows that have matching values in both tables
-- LEFT JOIN: Returns all rows from the left table, and only the matched rows from the right table
-- RIGHT JOIN: Returns all rows from the right table, and only the matched rows from the left table
-- CROSS JOIN: Returns the Cartesian product of two or more tables


-- UNION Operator
-- The UNION operator is used to combine the result-set of two or more SELECT statements.

-- The UNION operator automatically removes duplicate rows from the result set.

-- Requirements for UNION: 

-- Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order


-- UNION ALL Operator
-- The UNION ALL operator is used to combine the result-set of two or more SELECT statements.

-- The UNION ALL operator includes all rows from each statement, including any duplicates.

-- Requirements for UNION ALL: 

-- Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order


-- GROUP BY Statement
-- The GROUP BY statement is used to group rows that have the same values into summary rows, like "Find the number of customers in each country".

-- The GROUP BY statement is almost always used in conjunction with aggregate functions, like COUNT(), MAX(), MIN(), SUM(), AVG(), to perform calculations on each group.

SELECT Country, COUNT(CustomerID) AS "Number of Customers"
FROM Customers
GROUP BY Country;

SELECT Country, COUNT(CustomerID) AS "Number of Customers"
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

SELECT StateName, COUNT(ComplaintId) AS 'Number Of Complaints'
FROM ConsumerComplaints 
GROUP BY StateName;

SELECT StateName, COUNT(ComplaintId) AS 'Number Of Complaints'
FROM ConsumerComplaints 
GROUP BY StateName
ORDER BY COUNT(ComplaintId) DESC;

-- HAVING Clause
-- The HAVING clause is used to filter the results of a GROUP BY query based on aggregate functions.

-- Unlike the WHERE clause, which filters individual rows before grouping, the HAVING clause filters groups after the aggregation has been performed.

SELECT Country, COUNT(CustomerID) AS "Number of Customers"
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) < 5;

SELECT Country, COUNT(CustomerID) AS "Number of Customers"
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) < 5
ORDER BY COUNT(CustomerID) DESC;

SELECT StateName, COUNT(ComplaintId) AS 'Number Of Complaints'
FROM ConsumerComplaints 
GROUP BY StateName
HAVING COUNT(ComplaintId) > 2500;

SELECT StateName, COUNT(ComplaintId) AS 'Number Of Complaints'
FROM ConsumerComplaints 
GROUP BY StateName
HAVING COUNT(ComplaintId) > 2500
ORDER BY COUNT(ComplaintId) DESC;


-- EXISTS Operator
-- The EXISTS operator is used in a WHERE clause to check whether a subquery returns any rows.

-- The EXISTS operator evaluates to TRUE if the subquery returns at least one row, and FALSE otherwise..

SELECT SupplierName FROM Suppliers
WHERE EXISTS (
  SELECT ProductName
  FROM Products
  WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20
);

SELECT SupplierName FROM Suppliers
WHERE EXISTS (
  SELECT ProductName
  FROM Products
  WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22
);


-- ANY Operator
-- The ANY operator is used to compare a value to every value returned by a subquery.

-- The ANY operator evaluates to TRUE if at least one value in the subquery result-set meet the condition.
-- Note: The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).

SELECT ProductName FROM Products
WHERE ProductID = ANY (
  SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10
);

SELECT ProductName FROM Products
WHERE ProductID = ANY (
  SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 99
);

SELECT ProductName FROM Products
WHERE ProductID = ANY (
  SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000
);


-- ALL Operator
-- The ALL operator is used to compare a value to every value returned by a subquery.

-- The ALL operator evaluates to TRUE if every value in the subquery result-set meet the condition.

-- The ALL operator is typically used with WHERE and HAVING statements.
-- Note: The operator must be a standard comparison operator (=, <>, !=, >, >=, <, or <=).
SELECT ProductName FROM Products
WHERE ProductID = ALL (
  SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10
);

-- INSERT INTO SELECT Statement
-- The INSERT INTO SELECT statement is used to copy data from an existing table and insert it into another existing table.

-- The INSERT INTO SELECT statement requires that the data types in source and target tables matches.
-- Note: The existing records in the target table are unaffected.

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

INSERT INTO Customers
SELECT * FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

-- CASE Statement
-- The CASE statement is used to define different results based on specified conditions in an SQL statement.

-- The CASE statement goes through the conditions and stops at the first match (like an if-then-else statement). 
-- So, once a condition is true, it will stop processing and return the result. 
-- If no conditions are true, it returns the value in the ELSE clause. 
-- If there is no ELSE clause and no conditions are true, it returns NULL.

SELECT ProductName, Price,
CASE
  WHEN Price < 20 THEN 'Low Cost'
  WHEN Price BETWEEN 20 AND 50 THEN 'Medium Cost'
  ELSE 'High Cost'
END AS PriceCategory
FROM Products;

-- COALESCE() and IFNULL() Functions
-- Operations involving NULL values can sometimes lead to unexpected results.

-- MySQL has two built-in functions to handle NULL values:

-- COALESCE()
-- IFNULL()
-- A NULL value represents an unknown or missing data in a database field. It is not a value itself, but a placeholder to indicate the absence of data.

SELECT ProductName, Price * (InStock + InOrder)
FROM Products;
-- Note: In the SQL above, if any of the "InOrder" values are NULL, the result will be NULL!

-- COALESCE() Function
-- The COALESCE() function is the preferred standard for handling potential NULL values.
-- The COALESCE() function returns the first non-NULL value in a list of values.

SELECT ProductName, Price * (InStock + COALESCE(InOrder, 0))
FROM Products;

-- IFNULL() Function
-- The IFNULL() function function replaces NULL with a specified value.
SELECT ProductName, Price * (InStock + IFNULL(InOrder, 0))
FROM Products;

-- Stored Procedure
-- A stored procedure is a precompiled SQL code that can be saved and reused.

-- If you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

-- A stored procedure can also have parameters, so it can act based on the parameter value(s) that is passed.

-- Key Benefits of Stored Procedures
-- Stored procedures are widely used in database management, and have the following benefits:

-- Code Reusability - The same procedure can be called from various applications
-- Improved Performance - Stored procedures are precompiled and runs faster
-- Database Security - You can set users permission to run a specific procedure (limits direct access to tables)
-- Easy Maintenance - When updating a procedure, it automatically updates all its use

-- Stored Procedure Syntax
-- DELIMITER //

-- CREATE PROCEDURE procedure_name
--   @param1 datatype,
--   @param2 datatype
-- BEGIN
--   -- SQL_statements to be executed
--   SELECT column1, column2
--   FROM table_name
--   WHERE columnN = @paramN;
-- END //

-- DELIMITER;

-- Execute a Stored Procedure
-- To run a stored procedure, use the CALL statement:
CALL procedure_name('value1', 'value2');

-- Drop a Stored Procedure
-- To delete a stored procedure, use the DROP PROCEDURE statement:
DROP PROCEDURE procedure_name;

-- Tip: To ensure that DROP PROCEDURE does not return an error, if the procedure is missing, add the IF EXISTS clause:
DROP PROCEDURE IF EXISTS procedure_name;

-- Stored Procedure Example
-- DELIMITER //

-- CREATE PROCEDURE GetCustomersByCity
--   @City VARCHAR(50)
-- BEGIN
--   SELECT * FROM Customers
--   WHERE City = @City;
-- END //

-- DELIMITER;
CALL GetCustomersByCity('London');


-- Stored Procedure With Multiple Parameters
-- DELIMITER //

-- CREATE PROCEDURE GetCustomersByCity
--   @City VARCHAR(50),
--   @PostalCode VARCHAR(10)
-- BEGIN
--   SELECT * FROM Customers
--   WHERE City = @City AND PostalCode = @PostalCode;
-- END //

-- DELIMITER;
CALL GetCustomersByCity('London', 'WA1 1DP');


-- Comments
-- Comments are used to explain SQL code, or to temporarily prevent execution of SQL code (for debugging).
-- Comments are ignored by the database engine.
-- MySQL supports single-line comments --, and multi-line comments /* */.

-- Note: MySQL requires a space after the second dash in a single-line comment!

-- Single-line Comments
-- Single-line comments start with -- and continue to the end of line.
-- Any text after -- and to the end of the line will be ignored.

-- Selects all German customers
SELECT * FROM Customers
WHERE Country = 'Germany';

SELECT * FROM Customers; -- WHERE City='Berlin';

-- SELECT * FROM Customers;
SELECT * FROM Products;

-- Multi-line Comments
-- Multi-line comments start with /* and end with */.
-- Any text between /* and */ will be ignored.

/* Selects all German customers
from Berlin */
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';


/*SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Categories;*/
SELECT * FROM Suppliers;

SELECT CustomerName, /*City,*/ Country FROM Customers;

SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')
AND Country='USA'
ORDER BY CustomerName;


-- MySQL Operators
-- MySQL operators are keywords and symbols used to perform operations with data values.

-- MySQL operators are used in SQL statements like SELECT, WHERE, LIKE, etc.

-- MySQL operators is categorized into the following types:

-- Arithmetic operators
-- Comparison operators
-- Compound operators
-- Bitwise operators
-- Logical operators


-- MySQL Arithmetic Operators
-- Operator	Description	Example
-- +	Addition	
-- -	Subtraction	
-- *	Multiplication	
-- /	Division	
-- %	Modulus	

-- MySQL Comparison Operators
-- Operator	Description	Example
-- =	Equal to	
-- >	Greater than	
-- <	Less than	
-- >=	Greater than or equal to	
-- <=	Less than or equal to	
-- <>	Not equal to	

-- MySQL Compound Operators
-- Operator	Description
-- +=	Add equals
-- -=	Subtract equals
-- *=	Multiply equals
-- /=	Divide equals
-- %=	Modulo equals
-- &=	Bitwise AND equals
-- ^-=	Bitwise exclusive equals
-- |*=	Bitwise OR equals

-- MySQL Bitwise Operators
-- Operator	Description
-- &	Bitwise AND
-- |	Bitwise OR
-- ^	Bitwise exclusive OR

-- MySQL Logical Operators
-- Operator	Description	Example
-- ALL	TRUE if all of the subquery values meet the condition	
-- AND	TRUE if all the conditions separated by AND is TRUE	
-- ANY	TRUE if any of the subquery values meet the condition	
-- BETWEEN	TRUE if the operand is within the range of comparisons	
-- EXISTS	TRUE if the subquery returns one or more records	
-- IN	TRUE if the operand is equal to one of a list of expressions	
-- LIKE	TRUE if the operand matches a pattern	
-- NOT	Displays a record if the condition(s) is NOT TRUE	
-- OR	TRUE if any of the conditions separated by OR is TRUE	
-- SOME	TRUE if any of the subquery values meet the condition

SHOW DATABASES;
SHOW TABLES;
SELECT * FROM ConsumerComplaints LIMIT 100;
SELECT * FROM Country;
SELECT * FROM Customers;
SELECT * FROM products;
SELECT * FROM OrderDetails;

-- ==========================================================================

-- MySQL Database

-- CREATE DATABASE Statement
-- The CREATE DATABASE statement is used to create a new SQL database.

-- Tip: You need administrative privileges to create a new database.


CREATE DATABASE testDB;
SHOW DATABASES;

-- DROP DATABASE Statement
-- The DROP DATABASE statement is used to permanently delete an existing SQL database.

-- Note: Be careful before dropping a database! Dropping a database deletes the database and all its content (tables, views, stored procedures, and data)!

-- Tip: You need administrative privileges to drop a database.

DROP DATABASE testDB;
SHOW DATABASES;

-- CREATE TABLE Statement
-- The CREATE TABLE statement is used to create a new table in a database.

CREATE DATABASE testDB;
USE testDB;
SHOW DATABASES;

-- 1. Create the Persons table
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    LastName VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    DateOfBirth DATE
);

-- 2. Insert the parsed data rows
INSERT INTO Persons (PersonID, LastName, FirstName, Address, City, DateOfBirth)
VALUES 
    (1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes', NULL),
    (2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes', NULL),
    (3, 'Pettersen', 'Kari', 'Storgt 20', 'Stavanger', NULL);

-- 3. Verify the inserted data
SELECT * FROM Persons;
SHOW TABLES;

SELECT * FROM Persons;
-- PersonID - This column is of type integer (int). This is also the PRIMARY KEY field, that uniquely identifies each row.
-- LastName - This column is a variable-length character string with a maximum length of 255 characters (varchar(255)). NOT NULL specifies that this column cannot be empty.
-- FirstName, Address, City - These columns are also variable-length character strings with a maximum length of 255 characters (varchar(255)). These columns allow NULL values by default.


-- Create New Table From Existing Table
-- The CREATE TABLE statement can also be used to create a new table that copies some/all data from an existing table.

-- If you create a new table from an existing table, the new table will be filled with the values from the existing table.



-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

-- Insert the sample data
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

-- 3. Verify the inserted data
SELECT * FROM Customers;


CREATE TABLE GermanCustomers AS
SELECT * FROM Customers
WHERE Country = 'Germany';

SHOW TABLES;
SELECT * FROM GermanCustomers;

-- DROP TABLE Statement
-- The DROP TABLE statement is used to permanently delete an existing table in a database.

-- Note: Be careful before dropping a table! Dropping a table deletes the entire table and all its content!

DROP TABLE GermanCustomers;
DROP TABLE IF EXISTS GermanCustomers;

-- TRUNCATE TABLE
-- The TRUNCATE TABLE statement is used to delete all the records in a table, but it keeps the table structure, columns and constraints.

TRUNCATE TABLE GermanCustomers;
SHOW TABLES;
SELECT * FROM GermanCustomers;

-- ALTER TABLE Statement
-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- Common ALTER TABLE operations are:

-- Add column - Adds a new column to a table
-- Drop column - Deletes a column in a table
-- Rename column - Renames a column
-- Modify column - Changes the data type, size, or constraints of a column
-- Add constraint - Adds a new constraint
-- Rename table - Renames a table

ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE Customers
DROP COLUMN Email;

ALTER TABLE table_name
RENAME COLUMN old_name to new_name;

ALTER TABLE Customers
MODIFY Email varchar(100) NOT NULL;

ALTER TABLE Members
ADD CONSTRAINT CHK_Age CHECK (Age >= 18);

ALTER TABLE Customers
RENAME TO Clients;

-- ALTER TABLE Example
ALTER TABLE Persons
ADD DateOfBirth date;

ALTER TABLE Persons
MODIFY COLUMN DateOfBirth year;

ALTER TABLE Persons
DROP COLUMN DateOfBirth;

SHOW TABLES;
SELECT * FROM Persons;

-- Create Constraints
-- Constraints are rules for data in a table.
-- Constraints are used to prevent insertion of invalid data in a table, and ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

-- Constraints can be specified in two ways:

-- When a table is created (through the CREATE TABLE statement)
-- After a table is created (through the ALTER TABLE statement)
-- MySQL Constraints
-- The following constraints are commonly used in MySQL:

-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are unique
-- PRIMARY KEY - Uniquely identifies each row in a table (a combination of a NOT NULL and UNIQUE)
-- FOREIGN KEY - Establishes a link between data in two tables, and prevents action that will destroy the link between them
-- CHECK - Ensures that the values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column if no value is specified
-- CREATE INDEX - Creates indexes on columns to retrieve data from the database faster

-- NOT NULL Constraint
-- The NOT NULL constraint enforces a column to NOT accept NULL values. This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.
-- By default, a column can hold NULL values.

-- NOT NULL on CREATE TABLE
-- To define a NOT NULL constraint when creating a table, add NOT NULL after the data type of the column name.
-- The following SQL creates a "Persons" table, and ensures that the "ID", "LastName", and "FirstName" columns cannot accept NULL values:

CREATE TABLE DemoTable (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-- NOT NULL on ALTER TABLE
-- To define a NOT NULL constraint on an existing table, use ALTER TABLE and add NOT NULL after the data type of the column name.
ALTER TABLE DemoTable
MODIFY Age int NOT NULL;


-- Remove a NOT NULL Constraint
-- To remove a NOT NULL constraint from a column (to let the column accept NULL values again), use the following syntax:
ALTER TABLE DemoTable
MODIFY Age int NULL;

DROP TABLE DemoTable;


-- UNIQUE Constraint
-- The UNIQUE constraint ensures that all values in a column are unique.
-- Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns. However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

-- UNIQUE Constraint on CREATE TABLE
CREATE TABLE DemoTable (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);
SELECT * FROM DemoTable;
DROP TABLE DemoTable;

-- Naming a Unique Constraint
-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:
CREATE TABLE DemoTable (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);
SELECT * FROM DemoTable;
DROP TABLE DemoTable;

-- UNIQUE Constraint on ALTER TABLE
-- To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL syntax:
ALTER TABLE DemoTable
ADD UNIQUE (ID);

-- Naming a Unique Constraint
-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:
ALTER TABLE DemoTable
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

-- Drop a UNIQUE Constraint
-- To drop a UNIQUE constraint, use the following SQL:
ALTER TABLE DemoTable
DROP INDEX UC_Person;


-- PRIMARY KEY Constraint
-- The PRIMARY KEY constraint uniquely identifies each record in a database table.
-- A PRIMARY KEY constraint ensures unique values, and cannot contain NULL values (it is a combination of both a UNIQUE constraint and a NOT NULL constraint).
-- A table can have only ONE PRIMARY KEY constraint. The primary key can either be a single column, or a combination of columns.
-- Tip: The primary key is the target for FOREIGN KEY constraints in other tables (which enforces referential integrity between data in two tables).

-- PRIMARY KEY on CREATE TABLE
-- The following SQL creates a PRIMARY KEY on the "ID" column upon creation of the "Persons" table:

CREATE TABLE DemoTable (
    ID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
SELECT * FROM DemoTable;
DROP TABLE DemoTable;


-- PRIMARY KEY on Multiple Columns
-- To define an un-named PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
CREATE TABLE DemoTable (
    ID int,
    LastName varchar(255),
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID, LastName)
);
SELECT * FROM DemoTable;
DROP TABLE DemoTable;

-- Note: In the example above, the PRIMARY KEY value is made up of two columns (ID + LastName).
-- To define a named PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
CREATE TABLE DemoTable (
    ID int,
    LastName varchar(255),
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);
-- Note: In the example above, the PRIMARY KEY is named "PK_Person", and the value is made up of two columns (ID + LastName).


-- PRIMARY KEY on ALTER TABLE
-- To create a PRIMARY KEY constraint on the "ID" column when the table already has been created, use the following SQL:
ALTER TABLE DemoTable
ADD PRIMARY KEY (ID);

-- PRIMARY KEY on Multiple Columns
-- To define a named PRIMARY KEY constraint on multiple columns, use the following SQL syntax:
ALTER TABLE DemoTable
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

-- Note: When using ALTER TABLE to add a primary key, the primary key column(s) must have been declared with NOT NULL upon creation of the table.

-- Drop a PRIMARY KEY Constraint
-- To drop a PRIMARY KEY constraint, use the following SQL:
ALTER TABLE DemoTable
DROP PRIMARY KEY;


-- FOREIGN KEY Constraint
-- The FOREIGN KEY constraint establishes a link between two tables, and prevents action that will destroy the link between them.
-- A FOREIGN KEY is a column in a table that refers to the PRIMARY KEY in another table.
-- The table with the foreign key column is called the child table, and the table with the primary key column is called the referenced or parent table.
-- The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column (in the child table), because the value has to exist in the parent table.
-- The FOREIGN KEY constraint also prevents you from deleting a record in the parent table, if related rows still exist in the child table. 


-- The "PersonID" column in the "Persons" table is the PRIMARY KEY in the "Persons" table.
-- The "PersonID" column in the "Orders" table is the FOREIGN KEY in the "Orders" table.

-- FOREIGN KEY on CREATE TABLE
-- The following SQL creates a FOREIGN KEY constraint on the "PersonID" column upon creation of the "Orders" table:

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int,
    CONSTRAINT fk_Person
    FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

-- FOREIGN KEY on ALTER TABLE
-- To create a FOREIGN KEY constraint on the "PersonID" column after the "Orders" table is created, use the following SQL:
ALTER TABLE Orders
ADD CONSTRAINT fk_Person
FOREIGN KEY (PersonID)
REFERENCES Persons(PersonID);


-- Drop a FOREIGN KEY Constraint
-- To drop a FOREIGN KEY constraint, use the following SQL:
ALTER TABLE Orders
DROP FOREIGN KEY fk_Person;

-- CHECK Constraint
-- The CHECK constraint is used to ensure that the values in a column satisfies a specific condition.
-- The CHECK constraint evaluates the data to TRUE or FALSE. If the data evaluates to TRUE, the operation is ok. If the data evaluates to FALSE, the entire INSERT or UPDATE operation is aborted, and an error is raised.
-- CHECK Constraint on CREATE TABLE
-- The following SQL creates a CHECK constraint on the "Age" column upon creation of the "Persons" table.

-- Here, the CHECK constraint ensures that the "Age" column must have a value of 18, or above:
CREATE TABLE Persons (
    ID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age >= 18)
);

-- Naming a CHECK Constraint
-- To name a CHECK constraint, or to define a CHECK constraint on multiple columns, use the following SQL syntax:
CREATE TABLE Persons (
    ID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT chk_PersonAge CHECK (Age >= 18 AND City = 'Sandnes')
);

-- CHECK Constraint on ALTER TABLE
-- To create a CHECK constraint on the "Age" column when the table is already created, use the following SQL:
ALTER TABLE Persons
ADD CHECK (Age >= 18);

-- Naming a CHECK Constraint
-- To name a CHECK constraint, and to define a CHECK constraint on multiple columns, use the following SQL syntax:
ALTER TABLE Persons
ADD CONSTRAINT chk_PersonAge CHECK (Age >= 18 AND City = 'Sandnes');

-- Drop a CHECK Constraint
-- To drop a CHECK constraint, use the following SQL:
ALTER TABLE Persons
DROP CHECK chk_PersonAge;


-- DEFAULT Constraint
-- The DEFAULT constraint is used to automatically insert a default value for a column, if no value is specified.
-- The default value will be added to all new records (if no other value is specified).

-- DEFAULT Constraint on CREATE TABLE
-- The following SQL sets a DEFAULT value for the "City" column upon creation of the "Persons" table:
CREATE TABLE Persons (
    ID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);
-- The DEFAULT constraint can also be used to insert system values, by using functions like CURRENT_DATE() to insert the current date:

CREATE TABLE Orders (
    ID int PRIMARY KEY,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

-- DEFAULT Constraint on ALTER TABLE
-- To define a DEFAULT constraint on the "City" column when the table is already created, use the following SQL:
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

-- DROP a DEFAULT Constraint
-- To drop a DEFAULT constraint, use the following SQL:
ALTER TABLE Persons
ALTER City DROP DEFAULT;


-- CREATE INDEX Statement
-- The CREATE INDEX statement is used to create indexes on tables in databases, to speed up data retrieval.
-- The users cannot see the indexes, they are just used to speed up searches/queries.

-- Note: Updating tables with indexes are more time-consuming than tables without indexes (because the indexes must also be updated). So, only create indexes on columns that are frequently searched against.

-- Types of Indexes: Non-unique and Unique
-- There are two types of indexes:
-- CREATE INDEX - Creates a non-unique index (duplicate values are allowed)
-- CREATE UNIQUE INDEX - Creates a unique index (duplicate values are not allowed)

-- CREATE INDEX Syntax
-- CREATE INDEX index_name
-- ON table_name (column1, column2, ...);

-- CREATE UNIQUE INDEX Syntax
-- CREATE UNIQUE INDEX index_name
-- ON table_name (column1, column2, ...);

-- CREATE INDEX Example
-- The following SQL creates a non-unique index named "idx_lastname" on the "LastName" column in the "Persons" table:

CREATE INDEX idx_lastname
ON Persons (LastName);

-- If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:
CREATE INDEX idx_lname_fname
ON Persons (LastName, FirstName);

-- DROP INDEX Statement
-- The DROP INDEX statement is used to delete an index in a table.
ALTER TABLE table_name
DROP INDEX index_name;

-- AUTO INCREMENT Field
-- An auto-increment field is a numeric column that automatically generates a unique number, when a new record is inserted into a table.
-- The auto-increment field is typically the PRIMARY KEY field that we want to automatically be assigned a unique number, every time a new record is inserted.

-- MySQL AUTO_INCREMENT Keyword
-- MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.

-- The following SQL defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
    Personid int AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
-- The default starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
-- To let AUTO_INCREMENT start with another value, use the following SQL statement:

ALTER TABLE Persons AUTO_INCREMENT = 100;
-- When we insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column (a unique value will be added automatically):

INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen');
-- The SQL above inserts a new record into the "Persons" table, and the "Personid" column will automatically be assigned the next unique number.

-- Dates
-- The most difficult part when working with dates in databases, is to be sure that the format of the date you are trying to insert/select, matches the format of the date column in the database.

-- MySQL Date Data Types
-- MySQL has the following data types for storing a date or a date/time value in the database:

-- DATE - format YYYY-MM-DD
-- DATETIME - format: YYYY-MM-DD HH:MI:SS
-- TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
-- TIME - format: HH:MI:SS
-- YEAR - format YYYY or YY
-- Note: The date datatype are defined for a column upon creation of a new table in your database.

-- Working with Dates
-- Look at the following table:

-- Orders Table
-- OrderId	ProductName	OrderDate
-- 1	Geitost	2025-11-11
-- 2	Camembert Pierrot	2025-11-09
-- 3	Mozzarella di Giovanni	2025-11-11
-- 4	Mascarpone Fabioli	2025-10-29
-- Now we want to select the records with an OrderDate of "2025-11-11" from the table above.

-- We use the following SELECT statement:

SELECT * FROM Orders WHERE OrderDate='2025-11-11';
-- The result-set will look like this:

-- OrderId	ProductName	OrderDate
-- 1	Geitost	2025-11-11
-- 3	Mozzarella di Giovanni	2025-11-11
-- Note: Two dates can easily be compared if there is no time component involved!

-- Now, assume that the "Orders" table looks like this (notice the added time-component in the "OrderDate" column):

-- OrderId	ProductName	OrderDate
-- 1	Geitost	2025-11-11 13:23:44
-- 2	Camembert Pierrot	2025-11-09 15:45:21
-- 3	Mozzarella di Giovanni	2025-11-11 11:12:01
-- 4	Mascarpone Fabioli	2025-10-29 14:56:59
-- If we use the same SELECT statement as above:

SELECT * FROM Orders WHERE OrderDate='2025-11-11';
-- we will get no result! This is because the query is looking only for dates with no time portion.

-- Tip: To keep your queries simple and easy to maintain, do not use time-components in your dates, unless you have to!

-- CREATE VIEW Statement
-- An SQL view is a virtual table based on the result-set of an SQL statement. An SQL view contains rows and columns, just like a real table. The fields in the view are fields from one or more real tables in the database.

-- You can add SQL statements and functions to a view and present the data as if it were coming from one single table.

-- A view is created with the CREATE VIEW statement.

-- CREATE VIEW Syntax
-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;
-- Note: A view always shows real-time data! The database engine only stores the view's definition (the SELECT statement), not a copy of the data.
--  
-- CREATE VIEW Examples
-- The following SQL creates a view named "brazil_customers_view", that shows all customers from Brazil:

-- Example
CREATE VIEW brazil_customers_view AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';
-- To query the view above, use the following SQL syntax:

-- Example
SELECT * FROM brazil_customers_view;
-- The following SQL creates a view named "products_above_average_price", that selects all products in the "Products" table with a Price higher than the average price:

-- Example
CREATE VIEW products_above_average_price AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
-- To query the view above, use the following SQL syntax:

-- Example
SELECT * FROM products_above_average_price;


-- CREATE OR REPLACE VIEW Statement
-- In MySQL, a view can be updated with the CREATE OR REPLACE VIEW statement.

-- CREATE OR REPLACE VIEW Syntax
-- CREATE OR REPLACE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;
-- The following SQL adds the "City" column to the "brazil_customers_view" view:

-- Example
CREATE OR REPLACE VIEW brazil_customers_view AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';


-- DROP VIEW Statement
-- A view is deleted with the DROP VIEW statement.

-- DROP VIEW Syntax
-- DROP VIEW view_name;
-- The following SQL drops the "brazil_customers_view" view:

-- Example
DROP VIEW brazil_customers_view;


-- SQL Injection
-- SQL injection is a code injection technique that can destroy your database. SQL injections are a common web hacking technique.

-- SQL injections are when attackers insert malicious SQL code into user-input fields, and this way can read, modify, or delete sensitive data in a database.

-- SQL injections usually occur when you ask a user for input, like username/userid, and instead of giving a name/id, the attacker inserts an SQL command that executes something in your database.

-- Look at the following example which creates a SELECT statement by adding a variable (txtUserId) to a select string. The variable is fetched from user input (getRequestString):

-- Example
-- txtUserId = getRequestString("UserId");
-- txtSQL = "SELECT * FROM Users WHERE UserId = " + txtUserId;
-- The rest of this chapter describes the potential dangers of using user input in SQL statements.

-- The next chapter show the most effective methods to prevent SQL injections, by using Prepared Statements.

-- SQL Injection Based on 1=1 is Always True
-- Look at the example above again. The original purpose of the SQL code was to select a user with a given user id.

-- If there is nothing to prevent a user from entering "wrong" input, the user can enter some "smart" input like this:

-- UserId: 
-- 105 OR 1=1

-- Then, the SQL statement will look like this:

SELECT * FROM Users WHERE UserId = 105 OR 1=1;
-- The SQL above is valid and will return ALL rows from the "Users" table, since OR 1=1 is always TRUE.

-- Does the example above look dangerous? What if the "Users" table contains names and passwords?

-- A hacker might get access to all the user names and passwords in a database, by simply inserting 105 OR 1=1 into the input field.


-- SQL Injection Based on OR ""="" is Always True
-- Here is an example of a user login on a web site:

-- Username:
-- John Doe

-- Password:
-- myPass

-- Example
-- uName = getRequestString("username");
-- uPass = getRequestString("userpassword");

-- sql = 'SELECT * FROM Users WHERE Name ="' + uName + '" AND Pass ="' + uPass + '"'
-- Result
SELECT * FROM Users WHERE Name ="John Doe" AND Pass ="myPass";
-- A hacker might get access to user names and passwords in a database by simply inserting " OR ""=" into the user name or password text box:

-- User Name:
-- " or ""="

-- Password:
-- " or ""="

-- The SQL statement will now look like this:

-- Result
SELECT * FROM Users WHERE Name ="" or ""="" AND Pass ="" or ""="";
-- The SQL above is valid and will return ALL rows from the "Users" table, since OR ""="" is always TRUE.

-- SQL Injection From Batched SQL Statements
-- Batched SQL statements is a group of two or more SQL statements, separated by semicolons.

-- The SQL statement below will return all rows from the "Users" table, then delete the "Suppliers" table.

-- Example
SELECT * FROM Users; DROP TABLE Suppliers;
-- Look at the following example:

-- Example
-- txtUserId = getRequestString("UserId");
-- txtSQL = "SELECT * FROM Users WHERE UserId = " + txtUserId;
-- And the following input:

-- User id: 
-- 105; DROP TABLE Suppliers

-- The valid SQL statement would look like this:

-- Result
SELECT * FROM Users WHERE UserId = 105; DROP TABLE Suppliers;



-- Prepared Statements
-- Prepared statements is used to protect a web site from SQL injections.

-- Prepared statements seperates the query structure (the SQL) from the actual data (user input).

-- Prepared statements basically work like this:

-- Prepare: An SQL query template with placeholders is sent to the server. The data values are not sent. Example: INSERT INTO MyGuests VALUES(?, ?, ?). Then, the server parses, compiles, and optimizes the SQL query template, without executing it
-- Execute: At a later time, the application binds the values to the parameters, and the database executes the query. The application may execute the query as many times as it wants with different values
-- Prepared statements have four main advantages:

-- Reduced parsing time - as the preparation on the query is done only once (although the statement is executed multiple times)
-- Minimize bandwidth - Bound parameters minimize bandwidth to the server as you need send only the parameters each time, and not the whole query
-- Security - Prepared statements are very useful against SQL injections, because parameter values, which are transmitted later using a different protocol, need not be correctly escaped. If the original statement template is not derived from external input, SQL injection cannot occur
-- Cleaner code - by seperating data from SQL commands
-- Prepared Statements in MySQL
-- The following example is taken from PHP MySQL Prepared Statements, and uses prepared statements in MySQL:

-- Example - MySQL with Prepared StatementsGet your own SQL Server
-- <?php
-- $servername = "localhost";
-- $username = "username";
-- $password = "password";
-- $dbname = "myDB";

-- // Create connection
-- $conn = new mysqli($servername, $username, $password, $dbname);

-- // Check connection
-- if ($conn->connect_error) {
--   die("Connection failed: " . $conn->connect_error);
-- }

-- // SQL query template
-- $sql = "INSERT INTO MyGuests (firstname, lastname, email) VALUES (?, ?, ?)";

-- // Prepare the SQL query template
-- if($stmt = $conn->prepare($sql)) {
--   // Bind parameters
--   $stmt->bind_param("sss", $firstname, $lastname, $email);

--   // Set parameters and execute
--   $firstname = "John";
--   $lastname = "Doe";
--   $email = "john@example.com";
--   $stmt->execute();

--   $firstname = "Mary";
--   $lastname = "Moe";
--   $email = "mary@example.com";
--   $stmt->execute();

--   $firstname = "Julie";
--   $lastname = "Dooley";
--   $email = "julie@example.com";
--   $stmt->execute();
--   echo "New records created successfully";
-- } else {
--   echo "Error: " . $sql . "<br>" . $conn->error;
-- }

-- $stmt->close();
-- $conn->close();
-- ?>

-- Code Explanation
-- In the SQL, the question marks (?) are placeholders for firstname, lastname, and email values: 

-- "INSERT INTO MyGuests (firstname, lastname, email) VALUES (?, ?, ?)"
-- Now, look at the bind_param() function. This function bind variables to the placeholders in the SQL query. The placeholders (?) will be replaced by the actual values held in the variables at the time of execution. The "sss" argument lists the type of data each parameter is. The s character tells mysql that the parameter is a string. We must define one of these for EACH parameter. By telling mysql what type of data to expect, we minimize the risk of SQL injections:

-- $stmt->bind_param("sss", $firstname, $lastname, $email);
-- The type argument can be one of four types:

-- i - integer (whole number)
-- d - double (floating point number)
-- s - string (text)
-- b - binary (image, PDF, etc.)
-- Note: If we want to insert data from external sources (like user input), it is very important that the data is sanitized and validated.