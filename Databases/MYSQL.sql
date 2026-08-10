-- ============================================================================
-- 1. DATABASE INITIALIZATION & PREPROCESSING
-- ============================================================================

CREATE DATABASE IF NOT EXISTS frank;
USE frank;

SHOW DATABASES;

-- Data Preprocessing Log (Reference Queries)
-- SELECT * FROM consumer_compliant_records AS consumer LIMIT 100;
-- DESCRIBE consumer_compliant_records;

-- RENAME TABLE consumer_compliant_records TO ConsumerComplaints;

-- Column Standardization (snake_case -> PascalCase)
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

-- ============================================================================
-- 2. SCHEMA CREATION & SAMPLE DATA SEEDING
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Table 2.1: Customers
-- ----------------------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
    (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
    (2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
    (3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
    (4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
    (5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

SELECT * FROM Customers;

-- ----------------------------------------------------------------------------
-- Table 2.2: Products
-- ----------------------------------------------------------------------------
CREATE TABLE products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierId INT,
    CategoryId INT,
    Unit VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO products (ProductId, ProductName, SupplierId, CategoryId, Unit, Price)
VALUES 
    (1, 'Chais', 1, 1, '10 boxes x 20 bags', 18.00),
    (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00),
    (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00),
    (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00),
    (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35);

SELECT * FROM products;

-- ----------------------------------------------------------------------------
-- Table 2.3: OrderDetails
-- ----------------------------------------------------------------------------
CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL
);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES 
    (1, 10248, 11, 12),
    (2, 10248, 42, 10),
    (3, 10248, 72, 5),
    (4, 10249, 14, 9),
    (5, 10249, 51, 40);

SELECT * FROM OrderDetails;

-- ----------------------------------------------------------------------------
-- Table 2.4: Suppliers
-- ----------------------------------------------------------------------------
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255), 
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country)
VALUES 
    (1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK'),
    (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'P.O. Box 78934', 'New Orleans', '70117', 'USA'),
    (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA'),
    (4, 'Tokyo Traders', 'Yoshi Nagase', '9-8 Sekimai Musashino-shi', 'Tokyo', '100', 'Japan');

SELECT * FROM Suppliers;

-- ============================================================================
-- 3. SQL QUERY CHEAT SHEET & MNEMONICS
-- ============================================================================

/*
1. WRITING ORDER (Syntax Order)
Mnemonic: "Slip Forward When Ground Has Oily Liquid"

   SELECT    column_name            -- Slip
   FROM      table_name             -- Forward
   WHERE     condition              -- When
   GROUP BY  column_name            -- Ground
   HAVING    aggregate_condition    -- Has
   ORDER BY  column_name            -- Oily
   LIMIT     count;                 -- Liquid

2. LOGICAL EXECUTION ORDER (Database Execution Engine)
Mnemonic: "Fresh Water Gives Healthy Skin Often"

   FROM      table_name             -- 1. Fresh   (Locate source table)
   WHERE     condition              -- 2. Water   (Filter row by row)
   GROUP BY  column_name            -- 3. Gives   (Aggregate into groups)
   HAVING    aggregate_condition    -- 4. Healthy (Filter aggregated groups)
   SELECT    column_name            -- 5. Skin    (Project output columns)
   ORDER BY  column_name;           -- 6. Often   (Sort final result set)
*/

-- ============================================================================
-- 4. DQL (DATA QUERY LANGUAGE) EXAMPLES
-- ============================================================================

SHOW TABLES;

-- ----------------------------------------------------------------------------
-- 4.1 Basic SELECT & Column Selection
-- ----------------------------------------------------------------------------
SELECT CustomerName, City, Country FROM Customers;
SELECT DateReceived, ProductName, Issue, Company, StateName FROM ConsumerComplaints LIMIT 100;
SELECT * FROM ConsumerComplaints LIMIT 100;
SELECT * FROM Customers LIMIT 3;

-- ----------------------------------------------------------------------------
-- 4.2 Deduplication: SELECT DISTINCT
-- ----------------------------------------------------------------------------
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
SELECT DISTINCT ProductName FROM ConsumerComplaints;

-- ----------------------------------------------------------------------------
-- 4.3 Filtering Rows: WHERE Clause
-- ----------------------------------------------------------------------------
SELECT * FROM Customers WHERE Country = 'Mexico';
SELECT * FROM Customers WHERE CustomerID = 1;
SELECT * FROM Customers WHERE CustomerID > 80;
SELECT * FROM ConsumerComplaints WHERE StateName = 'VA';

-- ----------------------------------------------------------------------------
-- 4.4 Sorting Results: ORDER BY
-- ----------------------------------------------------------------------------
SELECT * FROM products ORDER BY Price;
SELECT * FROM products ORDER BY Price DESC;
SELECT * FROM ConsumerComplaints ORDER BY Company ASC;
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

-- ----------------------------------------------------------------------------
-- 4.5 Logical Combination: AND, OR, NOT
-- ----------------------------------------------------------------------------
-- AND / OR Combinations
SELECT * FROM Customers WHERE Country = 'UK' AND City = 'London';
SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');
SELECT * FROM ConsumerComplaints WHERE Company = 'Bank of America' OR Company = 'Discover';

-- NOT Exclusions
SELECT * FROM Customers WHERE NOT Country = 'Germany';
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'A%';
SELECT * FROM Customers WHERE CustomerID NOT BETWEEN 10 AND 60;
SELECT * FROM Customers WHERE City NOT IN ('Paris', 'London');

-- ----------------------------------------------------------------------------
-- 4.6 NULL Value Logic
-- ----------------------------------------------------------------------------
SELECT * FROM ConsumerComplaints WHERE SubIssue IS NULL;
SELECT * FROM ConsumerComplaints WHERE SubIssue IS NOT NULL;
SELECT * FROM Customers WHERE ContactName IS NOT NULL;

-- ----------------------------------------------------------------------------
-- 4.7 Pagination: LIMIT & OFFSET
-- ----------------------------------------------------------------------------
SELECT * FROM Customers LIMIT 3;
SELECT * FROM ConsumerComplaints LIMIT 10 OFFSET 3;
SELECT * FROM ConsumerComplaints WHERE StateName = 'NY' LIMIT 10;

-- ----------------------------------------------------------------------------
-- 4.8 Aggregations (MIN, MAX, COUNT, SUM, AVG)
-- ----------------------------------------------------------------------------
SELECT MIN(Price) AS LowestPrice FROM products;
SELECT MAX(DateReceived) AS LatestDate FROM ConsumerComplaints;
SELECT COUNT(*) FROM Customers;
SELECT COUNT(DISTINCT Price) FROM products WHERE Price > 20;
SELECT SUM(Quantity) AS TotalQuantity FROM OrderDetails WHERE ProductId = 11;
SELECT AVG(Price) FROM products WHERE CategoryID = 1;

-- Subquery with Aggregate
SELECT * FROM products WHERE Price > (SELECT AVG(Price) FROM products);

-- ----------------------------------------------------------------------------
-- 4.9 Wildcards & Pattern Matching: LIKE
-- ----------------------------------------------------------------------------
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE City LIKE '_ondon';
SELECT * FROM Customers WHERE City LIKE 'L_n_on';

-- ----------------------------------------------------------------------------
-- 4.10 Set Operations & Range Filters: IN, BETWEEN
-- ----------------------------------------------------------------------------
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM OrderDetails);
SELECT * FROM products WHERE Price BETWEEN 10 AND 20 AND CategoryId IN (1, 2, 3);

-- ----------------------------------------------------------------------------
-- 4.11 Aliasing & String Concatenation
-- ----------------------------------------------------------------------------
SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers;
SELECT CustomerName, CONCAT_WS(', ', Address, PostalCode, City, Country) AS FullAddress FROM Customers;

-- Implicit Table Join Aliases
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName = 'Around the Horn' AND c.CustomerID = o.CustomerID;

-- ----------------------------------------------------------------------------
-- 4.12 Grouping Data: GROUP BY & HAVING
-- ----------------------------------------------------------------------------
SELECT Country, COUNT(CustomerID) AS NumberOfCustomers
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) < 5
ORDER BY NumberOfCustomers DESC;

SELECT StateName, COUNT(ComplaintId) AS NumberOfComplaints
FROM ConsumerComplaints 
GROUP BY StateName
HAVING COUNT(ComplaintId) > 2500
ORDER BY NumberOfComplaints DESC;

-- ----------------------------------------------------------------------------
-- 4.13 Advanced Subquery Operators: EXISTS, ANY, ALL
-- ----------------------------------------------------------------------------
-- EXISTS
SELECT SupplierName FROM Suppliers
WHERE EXISTS (
    SELECT ProductName FROM products
    WHERE products.SupplierID = Suppliers.SupplierID AND Price < 20
);

-- ANY
SELECT ProductName FROM products
WHERE ProductID = ANY (
    SELECT ProductID FROM OrderDetails WHERE Quantity = 10
);

-- ALL
SELECT ProductName FROM products
WHERE ProductID = ALL (
    SELECT ProductID FROM OrderDetails WHERE Quantity = 10
);

-- ----------------------------------------------------------------------------
-- 4.14 Data Movement: INSERT INTO SELECT
-- ----------------------------------------------------------------------------
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country = 'Germany';

-- ----------------------------------------------------------------------------
-- 4.15 Conditional Logic: CASE Statement
-- ----------------------------------------------------------------------------
SELECT ProductName, Price,
CASE
    WHEN Price < 20 THEN 'Low Cost'
    WHEN Price BETWEEN 20 AND 50 THEN 'Medium Cost'
    ELSE 'High Cost'
END AS PriceCategory
FROM products;

-- ----------------------------------------------------------------------------
-- 4.16 Handling NULL Values: COALESCE & IFNULL
-- ----------------------------------------------------------------------------
SELECT ProductName, Price * (InStock + COALESCE(InOrder, 0)) AS TotalInventoryValue FROM products;
SELECT ProductName, Price * (InStock + IFNULL(InOrder, 0)) AS TotalInventoryValue FROM products;

-- ============================================================================
-- 5. STORED PROCEDURES
-- ============================================================================

DELIMITER //

CREATE PROCEDURE GetCustomersByCityAndPostal(
    IN p_City VARCHAR(50),
    IN p_PostalCode VARCHAR(10)
)
BEGIN
    SELECT * FROM Customers
    WHERE City = p_City AND PostalCode = p_PostalCode;
END //

DELIMITER ;

-- Procedure Execution & Cleanup
CALL GetCustomersByCityAndPostal('London', 'WA1 1DP');
DROP PROCEDURE IF EXISTS GetCustomersByCityAndPostal;

-- ============================================================================
-- 6. DDL OPERATIONS & CONSTRAINTS MANAGEMENT
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 6.1 Database Setup & Teardown
-- ----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;

-- ----------------------------------------------------------------------------
-- 6.2 Table Management (CREATE, CTAS, ALTER, TRUNCATE, DROP)
-- ----------------------------------------------------------------------------
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    LastName VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    DateOfBirth DATE
);

-- Create Table As Select (CTAS)
CREATE TABLE GermanCustomers AS
SELECT * FROM frank.Customers WHERE Country = 'Germany';

TRUNCATE TABLE GermanCustomers;
DROP TABLE IF EXISTS GermanCustomers;

-- ALTER TABLE Structural Adjustments
ALTER TABLE Persons ADD Email VARCHAR(255);
ALTER TABLE Persons MODIFY COLUMN Email VARCHAR(100) NOT NULL;
ALTER TABLE Persons DROP COLUMN Email;

-- ----------------------------------------------------------------------------
-- 6.3 Table Constraints Reference
-- ----------------------------------------------------------------------------
CREATE TABLE DemoConstraints (
    ID INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Age INT,
    City VARCHAR(255) DEFAULT 'Sandnes',
    CONSTRAINT UC_Person UNIQUE (ID, LastName),
    CONSTRAINT PK_Person PRIMARY KEY (ID),
    CONSTRAINT CHK_Age CHECK (Age >= 18)
);

-- Adding/Removing Constraints via ALTER TABLE
ALTER TABLE DemoConstraints DROP PRIMARY KEY;
ALTER TABLE DemoConstraints DROP INDEX UC_Person;
ALTER TABLE DemoConstraints DROP CHECK CHK_Age;
ALTER TABLE DemoConstraints ALTER City DROP DEFAULT;

DROP TABLE IF EXISTS DemoConstraints;

-- ----------------------------------------------------------------------------
-- 6.4 Indexes & Auto Increment
-- ----------------------------------------------------------------------------
CREATE INDEX idx_lastname ON Persons (LastName);
CREATE INDEX idx_lname_fname ON Persons (LastName, FirstName);

ALTER TABLE Persons DROP INDEX idx_lastname;

-- AUTO_INCREMENT Configuration
CREATE TABLE AutoIncDemo (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255)
);

ALTER TABLE AutoIncDemo AUTO_INCREMENT = 100;
DROP TABLE IF EXISTS AutoIncDemo;

-- ----------------------------------------------------------------------------
-- 6.5 Views Management
-- ----------------------------------------------------------------------------
USE frank;

CREATE OR REPLACE VIEW brazil_customers_view AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM brazil_customers_view;
DROP VIEW IF EXISTS brazil_customers_view;

-- ============================================================================
-- 7. SECURITY: PREPARED STATEMENTS & SQL INJECTION DEMONSTRATIONS
-- ============================================================================

-- Demonstration: Unsanitized SQL Vulnerabilities (For Education)
-- Vulnerable to Always True (1=1): SELECT * FROM Users WHERE UserId = 105 OR 1=1;
-- Vulnerable to Batched Queries: SELECT * FROM Users WHERE UserId = 105; DROP TABLE Suppliers;

-- Safe Implementation: MySQL Native Prepared Statement Template
PREPARE stmt_get_customer FROM 'SELECT * FROM Customers WHERE City = ? AND Country = ?';

SET @city = 'London';
SET @country = 'UK';

EXECUTE stmt_get_customer USING @city, @country;
DEALLOCATE PREPARE stmt_get_customer;