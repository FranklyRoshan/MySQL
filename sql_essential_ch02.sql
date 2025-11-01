/*	

	MySQL Data Types
    
    Fundamental Data Types
		Numeric
		String
		Date and Time
		Specialty
	
    
    Numeric
		
        Integer - 47, 100000000047
        Fixed Point Types - 3.47, 100000000.047 (Precious, accurate)
        Floating Point Types - 3.47, 100.47e12 (Not Accurate)
	
    String
        Fixed length strings - '90120', 'MAA2', 'SWA1 2AA'
        Variable length strings - 'Subterranean Homesick Blues', 'Leopard-Skin Pill-Box Hat'
        Binary Strings - BINARY(8), VARBINARY(8)
        Large Object Text - 
			BLOB (Binary Large Object Text)
            TINYBLOB BLOB MEDIUMBLOB LONGBLOB
            TINYTEXT TEXT MEDIUMTEXT LONGTEXT
            
	Date and Time
		DATE DATETIME TIMESTAMP
        
        
DATETIME vs TIMESTAMP in MySQL
    
DATETIME
Range: 1000-01-01 00:00:00 to 9999-12-31 23:59:59
Time Zone: Stores values literally — no time zone conversion. 
The value remains unchanged regardless of session time zone.
Storage: 8 bytes
Use when you need to store fixed, historical, or future dates beyond 2038.

TIMESTAMP
Range: 1970-01-01 00:00:01 UTC to 2038-01-19 03:14:07 UTC
Time Zone: Automatically converted from session time zone to UTC for storage, 
and back to session time zone when retrieved.
Storage: 4 bytes
Ideal for tracking record changes (e.g., created_at, updated_at) in applications across time zones.
⚠️ Limitation Note: The Year 2038 problem affects TIMESTAMP, as it is based on Unix time 
(seconds since 1970). After January 19, 2038, it overflows. Use DATETIME for dates beyond this.		


Enumerations

ENUM - Single value from the list
SET - several values from the list


🧱 5. Table, Row, and Database Limits
| Category                        | Limit                                          |
| ------------------------------- | ---------------------------------------------- |
| **Maximum columns per table**   | 4096                                           |
| **Maximum row size**            | 65,535 bytes (including overhead)              |
| **Maximum database size**       | Practically unlimited (depends on OS and disk) |
| **Maximum tables per database** | Limited by storage engine (InnoDB: ~4 billion) |
| **Maximum indexes per table**   | 64 (InnoDB)                                    |
| **Maximum key length (index)**  | 767 bytes (InnoDB default)                     |


📘 Tip: Keep tables under 50–100 columns for good performance. Normalize data when possible.


🧩 1. Numeric Data Types
| Data Type         | Storage Size         | Range (Signed)                  | Range (Unsigned)     |
| ----------------- | -------------------- | ------------------------------- | -------------------- |
| **TINYINT**       | 1 byte               | -128 to 127                     | 0 to 255             |
| **SMALLINT**      | 2 bytes              | -32,768 to 32,767               | 0 to 65,535          |
| **MEDIUMINT**     | 3 bytes              | -8,388,608 to 8,388,607         | 0 to 16,777,215      |
| **INT / INTEGER** | 4 bytes              | -2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295   |
| **BIGINT**        | 8 bytes              | -2⁶³ to 2⁶³−1                   | 0 to 2⁶⁴−1           |
| **FLOAT**         | 4 bytes              | Approx. ±3.4 × 10³⁸             | Approx. ±3.4 × 10³⁸  |
| **DOUBLE**        | 8 bytes              | Approx. ±1.7 × 10³⁰⁸            | Approx. ±1.7 × 10³⁰⁸ |
| **DECIMAL(M, D)** | Varies (≈ M+2 bytes) | Depends on precision            | Depends on precision |

| Type              | Description                                        | Example                         |
| ----------------- | -------------------------------------------------- | ------------------------------- |
| **INT**           | Integer values (no decimals)                       | `100`, `-42`                    |
| **TINYINT**       | Very small integer (-128 to 127)                   | `1`                             |
| **SMALLINT**      | Small integer (-32,768 to 32,767)                  | `2000`                          |
| **MEDIUMINT**     | Medium integer                                     | `500000`                        |
| **BIGINT**        | Large integer values                               | `1234567890`                    |
| **DECIMAL(p, s)** | Fixed-point number (exact decimal)                 | `DECIMAL(10,2)` → `99999999.99` |
| **FLOAT**         | Approximate floating-point number (less precision) | `12.34`                         |
| **DOUBLE**        | Larger approximate floating-point number           | `12345.6789`                    |


📘 Tip:
Use DECIMAL for money or prices (exact precision).
Use FLOAT or DOUBLE for scientific/approximate values.

🗓️ 2. Date and Time Data Types
| Type          | Description                             | Example                 |
| ------------- | --------------------------------------- | ----------------------- |
| **DATE**      | Only date (YYYY-MM-DD)                  | `'2025-10-25'`          |
| **TIME**      | Only time (HH:MM:SS)                    | `'14:30:00'`            |
| **DATETIME**  | Date and time                           | `'2025-10-25 14:30:00'` |
| **TIMESTAMP** | Auto-tracks record creation/update time | `'2025-10-25 09:45:00'` |
| **YEAR**      | Year in 4 digits                        | `'2025'`                |

| Data Type     | Storage Size | Range                                      |
| ------------- | ------------ | ------------------------------------------ |
| **DATE**      | 3 bytes      | 1000-01-01 to 9999-12-31                   |
| **DATETIME**  | 8 bytes      | 1000-01-01 00:00:00 to 9999-12-31 23:59:59 |
| **TIMESTAMP** | 4 bytes      | 1970-01-01 to 2038-01-19                   |
| **TIME**      | 3 bytes      | -838:59:59 to 838:59:59                    |
| **YEAR**      | 1 byte       | 1901 to 2155                               |


📘 Tip:
TIMESTAMP updates automatically when a record is changed — useful for audit logs.

🗃️ 3. String Data Types

| Type                  | Description                            | Example                        |
| --------------------- | -------------------------------------- | ------------------------------ |
| **CHAR(n)**           | Fixed-length string (always `n` chars) | `'YES'` (stored as `'YES   '`) |
| **VARCHAR(n)**        | Variable-length string                 | `'Chennai'`                    |
| **TEXT**              | Large text (up to 65,535 chars)        | Article, bio, etc.             |
| **MEDIUMTEXT**        | Medium text (up to 16 million chars)   | Large docs                     |
| **LONGTEXT**          | Very large text (up to 4GB)            | Book-sized content             |
| **ENUM('x','y',...)** | Fixed set of possible values           | `'Male'`, `'Female'`           |
| **SET('x','y',...)**  | Multiple options from predefined list  | `'Reading,Traveling'`          |


| Data Type      | Maximum Length           | Storage Size                            |
| -------------- | ------------------------ | --------------------------------------- |
| **CHAR(n)**    | 0–255 characters         | Fixed: `n × character size`             |
| **VARCHAR(n)** | 0–65,535 bytes           | Varies (depends on row size & encoding) |
| **TINYTEXT**   | 255 characters           | Up to 255 bytes                         |
| **TEXT**       | 65,535 characters        | Up to 64 KB                             |
| **MEDIUMTEXT** | 16,777,215 characters    | Up to 16 MB                             |
| **LONGTEXT**   | 4,294,967,295 characters | Up to 4 GB                              |
| **ENUM**       | Up to 65,535 elements    | 1 or 2 bytes per value                  |
| **SET**        | Up to 64 elements        | 1–8 bytes depending on count            |


📘 Tip:
Use VARCHAR for names, cities, etc.
Use TEXT for long descriptions or messages.

🧠 4. Boolean Data Type
| Type               | Description                                       | Example                   |
| ------------------ | ------------------------------------------------- | ------------------------- |
| **BOOLEAN / BOOL** | True or False (internally stored as `TINYINT(1)`) | `1` (True) or `0` (False) |


💾 5. Binary Data Types (for files, images, etc.)
| Type           | Description                                           |
| -------------- | ----------------------------------------------------- |
| **BLOB**       | Binary Large Object — stores binary data (up to 64KB) |
| **MEDIUMBLOB** | Up to 16MB                                            |
| **LONGBLOB**   | Up to 4GB                                             |

| Data Type      | Maximum Length      | Storage Size    |
| -------------- | ------------------- | --------------- |
| **TINYBLOB**   | 255 bytes           | Up to 255 bytes |
| **BLOB**       | 65,535 bytes        | Up to 64 KB     |
| **MEDIUMBLOB** | 16,777,215 bytes    | Up to 16 MB     |
| **LONGBLOB**   | 4,294,967,295 bytes | Up to 4 GB      |

📘 Tip:
Use BLOB only when storing images or files in the database. Otherwise, store just the file path.

*/

--

USE scratch;

CREATE TABLE test (
	id INT,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
);

DESCRIBE test;
SHOW TABLE STATUS WHERE name = 'test';
DROP TABLE IF EXISTS test;

-- 

USE scratch;

SELECT NOW();
SHOW VARIABLES LIKE '%time_zone%';
SET time_zone = '+00:00';
SET time_zone = 'SYSTEM'; -- SET time_zone = "SYSTEM";
SELECT UTC_TIMESTAMP();

-- timestamp with DATETIME
DROP TABLE IF EXISTS temp;
CREATE TABLE temp (
	id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    stamp DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(64)
);

INSERT INTO temp (name) VALUES ('this');
INSERT INTO temp (name) VALUES ('that');
INSERT INTO temp (name) VALUES ('other');

SELECT * FROM temp;
SELECT id, CONVERT_TZ(stamp, 'SYSTEM', '+00:00') AS utc_stamp, name FROM temp;

DROP TABLE IF EXISTS temp;

--

USE scratch;

SELECT NOW();
SHOW VARIABLES LIKE '%time_zone%';
SET time_zone = '+00:00';
SET time_zone = 'SYSTEM'; -- SET time_zone = "SYSTEM";
SELECT UTC_TIMESTAMP();

-- timestamp with DATETIME
DROP TABLE IF EXISTS temp;
CREATE TABLE temp (
	id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    stamp DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(64)
);

INSERT INTO temp (name) VALUES ('this');
INSERT INTO temp (name) VALUES ('that');
INSERT INTO temp (name) VALUES ('other');

SELECT * FROM temp;
SELECT id, CONVERT_TZ(stamp, 'SYSTEM', '+00:00') AS utc_stamp, name FROM temp;

DROP TABLE IF EXISTS temp;

-- 

USE scratch;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
	id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    a ENUM('Pablo', 'Henri', 'Jackson')
);

INSERT INTO test (a) VALUES ('Pablo');
INSERT INTO test (a) VALUES ('Henri');
INSERT INTO test (a) VALUES ('Jackson');
INSERT INTO test (a) VALUES ( 1 );
INSERT INTO test (a) VALUES ( 2 );
INSERT INTO test (a) VALUES ( 3 );

SELECT * FROM test;
DROP TABLE IF EXISTS test;

--

CREATE TABLE test (
	id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    a SET('Pablo', 'Henri', 'Jackson')
);

INSERT INTO test (a) VALUES ('Pablo');
INSERT INTO test (a) VALUES ('Henri');
INSERT INTO test (a) VALUES ('Jackson');
INSERT INTO test (a) VALUES ( 1 );
INSERT INTO test (a) VALUES ( 2 );
INSERT INTO test (a) VALUES ( 3 );
INSERT INTO test (a) VALUES ( 4 );
INSERT INTO test (a) VALUES ( 5 );
INSERT INTO test (a) VALUES ( 6 );
INSERT INTO test (a) VALUES ( 7 );

SELECT COUNT(*) FROM test;
SELECT * FROM test;
DROP TABLE IF EXISTS test;

-- 

/*

⚙️ ENUM vs SET in MySQL

| Feature                       | **ENUM**                                           | **SET**                                                     |
| ----------------------------- | -------------------------------------------------- | ----------------------------------------------------------- |
| **Definition**                | Stores **one** value from a predefined list        | Stores **multiple** values from a predefined list           |
| **Syntax**                    | `ENUM('Male', 'Female', 'Other')`                  | `SET('Reading', 'Traveling', 'Cooking', 'Music')`           |
| **Allowed Values per Record** | Only **one**                                       | **One or more** (comma-separated)                           |
| **Storage Size**              | 1 or 2 bytes (depends on number of options)        | 1 to 8 bytes (depends on number of options)                 |
| **Use Case**                  | For a **single choice** (like gender, status)      | For **multiple selections** (like hobbies, skills)          |
| **Example Insert**            | `INSERT INTO person VALUES ('Male');`              | `INSERT INTO person VALUES ('Reading,Music');`              |
| **Invalid Value Handling**    | If invalid, stores empty string `''`               | If invalid, ignores the invalid value and stores valid ones |
| **Sorting Order**             | Based on internal numeric index (position in list) | Based on binary value of selected items                     |
| **Retrieval**                 | Returns the selected string value                  | Returns comma-separated string of selected values           |
| **Indexing Performance**      | Slightly faster (simple)                           | Slightly slower (bitwise checks needed)                     |
	
🔍 Quick Summary
| Use **ENUM** when → | Only one option applies (e.g., gender, status)        |
| ------------------- | ----------------------------------------------------- |
| Use **SET** when →  | Multiple options may apply (e.g., hobbies, languages) |

*/

--

USE scratch;

DESCRIBE numerics;
SELECT * FROM numerics;

-- decimal
SELECT da + db FROM numerics;
SELECT da + db = 0.3 FROM numerics;

-- float
SELECT fa + fb FROM numerics;
SELECT fa + fb = 0.3 FROM numerics;

-- Boolean 
-- 1 - true
-- 0 - false

DROP TABLE numerics;

/*

Integer
	INT is INTEGER
    
e.g. NUMERIC(9,2)
    1234567.89

Decimal 
	DECIMAL(P,S)
    p - precision
    s - scale
    
e.g. DECIMAL(9,2)
	1234567.89

Default value of scale is zero
	DECIMAL(10,0)
	1234567890    

*/

--

USE scratch;

DESCRIBE numerics;
SELECT * FROM numerics;

-- decimal
SELECT da + db FROM numerics;
SELECT da + db = 0.3 FROM numerics;

-- float
SELECT fa + fb FROM numerics;
SELECT fa + fb = 0.3 FROM numerics;

-- Boolean 
-- 1 - true
-- 0 - false

DROP TABLE numerics;

/*

Integer
	INT is INTEGER
    
e.g. NUMERIC(9,2)
    1234567.89

Decimal 
	DECIMAL(P,S)
    p - precision
    s - scale
    
e.g. DECIMAL(9,2)
	1234567.89

Default value of scale is zero
	DECIMAL(10,0)
	1234567890    

*/

--

USE scratch;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
	-- id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id SERIAL,
    a VARCHAR(32)
);

INSERT INTO test (a)  VALUES (' Pablo ');
INSERT INTO test (a) VALUES ('Henri');
INSERT INTO test (a) VALUES ('Jackson');

SELECT * FROM test;
DESCRIBE test;
SHOW CREATE TABLE test;
DROP TABLE IF EXISTS test;


-- 

USE scratch;

/*

String Types
	Character String
    Binary String
    Fixed length
    Variable length
    large object
    
*/

/*

Character String

	-- CHAR(length) -- Always uses 5 bytes
    -- VARCHAR(length) -- Uses up to 25 bytes 
    
    CHAR(5)
    VARCHAR(25)
    
*/

/*

Binary String 

	-- BINARY(length)
    -- VARBIINARY(length)
    
*/

/*

Large Object Storage
	BLOB Binary Large Object 
    
    TINYBLOB   TINYTEXT
    BLOB	   TEXT
    MEDIUMBLOB MEDIUMTEXT
    LONGBLOB  LONGTEXT
    
*/



--


USE scratch;

/*

String Types
	Character String
    Binary String
    Fixed length
    Variable length
    large object
    
*/

/*

Character String

	-- CHAR(length) -- Always uses 5 bytes
    -- VARCHAR(length) -- Uses up to 25 bytes 
    
    CHAR(5)
    VARCHAR(25)
    
*/

/*

Binary String 

	-- BINARY(length)
    -- VARBIINARY(length)
    
*/

/*

Large Object Storage
	BLOB Binary Large Object 
    
    TINYBLOB   TINYTEXT
    BLOB	   TEXT
    MEDIUMBLOB MEDIUMTEXT
    LONGBLOB  LONGTEXT
    
*/

--

