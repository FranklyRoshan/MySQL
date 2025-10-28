/*

🔹 Basic Math Functions in MySQL

These functions handle simple arithmetic and mathematical operations.
They’re commonly used in calculations, reports, and data analysis.

*/

-- 🧩 1️⃣ ABS(x)
-- Returns the absolute value of x (removes the sign). 
SELECT ABS(10);
SELECT ABS(0);
SELECT ABS(-10);

-- 🧩 2️⃣ CEIL(x) or CEILING(x)
-- Rounds a number upward to the nearest integer.
SELECT CEIL(8.2),
	   CEIL(3.14)
;
-- 🧩 3️⃣ FLOOR(x)
-- Rounds a number downward to the nearest integer.
SELECT FLOOR(8.9),
       FLOOR(3.14)
;
-- 🧩 4️⃣ ROUND(x, d)
-- Rounds a number to d decimal places.
-- If d is omitted → rounds to nearest whole number.
SELECT ROUND(12.678, 2),
	ROUND(3.14, 0)
;
-- 🧩 5️⃣ TRUNCATE(x, d)
-- Truncates (cuts off) a number after d decimal places without rounding.
SELECT TRUNCATE(12.678, 2),
	   TRUNCATE(3.14159265, 2)
;
-- 🧩 6️⃣ MOD(x, y)
-- Returns the remainder of division x / y.
SELECT MOD(10, 3);

-- 🧩 7️⃣ POWER(x, y) or POW(x, y)
-- Returns x raised to the power of y.
SELECT POWER(3, 3);

-- 🧩 8️⃣ SQRT(x)
-- Returns the square root of x.
SELECT SQRT(64);


-- 🧩 9️⃣ SIGN(x)
-- Returns the sign of x:
-- 1 if positive

-- 0 if zero
-- -1 if negative
SELECT SIGN(-15), SIGN(0), SIGN(25);

-- 🧩 🔟 RAND()
-- Generates a random number between 0 and 1.
SELECT RAND();
-- RAND() → returns a random number between 0 (inclusive) and 1 (exclusive).

-- 👉 To get a random number in a range:
SELECT FLOOR(1 + (RAND() * 10)); -- 1 to 10
/*

| Expression                 | Possible Outputs | Range                       | Typical Use                      |
| -------------------------- | ---------------- | --------------------------- | -------------------------------- |
| `FLOOR(RAND() * 10)`       | 0–9              | 10 values (starting from 0) | Indexing, 0-based randoms        | 
| `FLOOR(1 + (RAND() * 10))` | 1–10             | 10 values (starting from 1) | Dice rolls, IDs, 1-based randoms |

*/


-- 💡 Summary Table
/*

| Function        | Description            | Example              | Output |
| --------------- | ---------------------- | -------------------- | ------ |
| `ABS(x)`        | Absolute value         | `ABS(-12)`           | 12     |
| `CEIL(x)`       | Round up               | `CEIL(4.2)`          | 5      |
| `FLOOR(x)`      | Round down             | `FLOOR(4.9)`         | 4      |
| `ROUND(x,d)`    | Round to `d` decimals  | `ROUND(12.678,2)`    | 12.68  |
| `TRUNCATE(x,d)` | Cut after `d` decimals | `TRUNCATE(12.678,2)` | 12.67  |
| `MOD(x,y)`      | Remainder              | `MOD(10,3)`          | 1      |
| `POWER(x,y)`    | x to the power y       | `POWER(2,3)`         | 8      |
| `SQRT(x)`       | Square root            | `SQRT(25)`           | 5      |
| `SIGN(x)`       | Sign of number         | `SIGN(-5)`           | -1     |
| `RAND()`        | Random between 0–1     | `RAND()`             | 0.73   |

*/