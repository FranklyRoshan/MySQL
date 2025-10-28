-- Logical Operators
-- Used to combine multiple conditions.

/*

| Operator | Description                      | Example                              |
| -------- | -------------------------------- | ------------------------------------ |
| `AND`    | True if both conditions are true | `age > 18 AND city = 'Chennai'`      |
| `OR`     | True if any condition is true    | `city = 'Chennai' OR city = 'Delhi'` |
| `NOT`    | Reverses condition               | `NOT (age < 18)`                     |

*/

SELECT (10 > 5 AND 8 < 12);
SELECT (10 = 5 OR 8 < 12);
SELECT NOT (10 = 5);
SELECT (10 > 5 XOR 8 < 6);

DROP TABLE temp;

/*

| **Operator** | **Meaning**                                        | **Example**                   | **Result** |
| ------------ | -------------------------------------------------- | ----------------------------- | ---------- |
| `AND`        | True if **both** conditions are true               | `SELECT (10 > 5 AND 8 < 12);` | ✅ `1`      |
| `OR`         | True if **any one** condition is true              | `SELECT (10 = 5 OR 8 < 12);`  | ✅ `1`      |
| `NOT`        | Reverses the condition                             | `SELECT NOT (10 = 5);`        | ✅ `1`      |
| `XOR`        | True if **only one** of the two conditions is true | `SELECT (10 > 5 XOR 8 < 6);`  | ✅ `1`      |
| `XOR`        | True if **only one** of the two conditions is true | `SELECT (10 > 5 XOR 8 < 6);`  | ✅ `1`      |

*/

-- 

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Aarav', 20, 'Chennai'),
(2, 'Divya', 22, 'Mumbai'),
(3, 'Rahul', 18, 'Delhi'),
(4, 'Sneha', 21, 'Chennai'),
(5, 'Vikram', 25, 'Bangalore');

-- AND
SELECT * FROM students WHERE city = 'Chennai' AND age > 20;
-- OR
SELECT * FROM students WHERE city = 'Chennai' OR city = 'Mumbai';
-- NOT
SELECT * FROM students WHERE NOT city = 'Delhi';
-- XOR
SELECT * FROM students WHERE (city = 'Chennai') XOR (age < 20);
-- Combinations of logical operators
SELECT * FROM students WHERE (city = 'Chennai' OR city = 'Mumbai') AND age BETWEEN 20 AND 22;

DROP TABLE students;

--

USE world;

SELECT NAME AS 'Country', ROUND(Population/ 1000000) AS popMM
	FROM Country
    WHERE Population > 50000000 AND Continent IN ('Asia', 'Europe')
    ORDER BY popMM DESC;
    
DROP TABLE world;

USE album;

SELECT * FROM album;
SELECT * FROM track;

-- JOIN (Joining Queries across the tables)
SELECT a.artist AS Artist, a.title AS Album, t.track_number AS 'Track Num', t.title AS Track, t.duration AS Seconds
	FROM album AS a
    JOIN track AS t ON a.id = t.album_id
    WHERE t.duration > 120 AND t.track_number > 3
    ORDER BY a.artist, a.title, t.track_number;

DROP TABLE album;