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