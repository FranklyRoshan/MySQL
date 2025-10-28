/*

🔹 What are Value Functions in MySQL?
Value functions are built-in functions that return a single value (a result) after performing a specific operation.
These can be numeric, string, date/time, or system-related functions.
They’re often used in SELECT, WHERE, and ORDER BY clauses.

*/

-- 🧠 Main Categories of Value Functions
/*

| Category                         | Examples                                                     | Description                                 |
| -------------------------------- | ------------------------------------------------------------ | ------------------------------------------- |
| **Numeric Functions**            | `ABS()`, `ROUND()`, `CEIL()`, `FLOOR()`, `POWER()`, `MOD()`  | Perform mathematical calculations           |
| **String Functions**             | `LENGTH()`, `CONCAT()`, `SUBSTRING()`, `TRIM()`, `REPLACE()` | Manipulate text or character data           |
| **Date & Time Functions**        | `NOW()`, `CURDATE()`, `YEAR()`, `MONTH()`, `DATEDIFF()`      | Work with date and time values              |
| **System Information Functions** | `USER()`, `DATABASE()`, `VERSION()`, `UUID()`                | Return system or session info               |
| **Control Flow Functions**       | `IF()`, `CASE`, `NULLIF()`, `COALESCE()`                     | Return different values based on conditions |

*/

-- 🔹 Examples
-- 1️⃣ Numeric Value Function
SELECT ABS(-20), ROUND(12.678, 2), POWER(3, 2);

-- 2️⃣ String Value Function
SELECT CONCAT('Frank', ' ', 'Roshan'), LENGTH('MySQL');

-- 3️⃣ Date Value Function
SELECT CURDATE(), YEAR(NOW()), MONTHNAME(NOW());

-- 4️⃣ Control Flow Function
SELECT IF(85 >= 50, 'Pass', 'Fail'); 

-- 5️⃣ System Function
SELECT DATABASE(), USER(), VERSION();


