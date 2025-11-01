/*

🔹 What Are Numeric Functions?
Numeric functions are built-in MySQL functions that perform mathematical calculations or return numeric results.
They’re commonly used in financial, statistical, and logical computations.

*/

-- 🧠 Common Numeric Functions in MySQL
/*

| Function                    | Description                                            | Example               | Output     |
| --------------------------- | ------------------------------------------------------ | --------------------- | ---------- |
| `ABS(x)`                    | Returns the **absolute value** of `x`                  | `ABS(-12)`            | `12`       |
| `CEIL(x)` / `CEILING(x)`    | Rounds **up** to the nearest integer                   | `CEIL(4.3)`           | `5`        |
| `FLOOR(x)`                  | Rounds **down** to the nearest integer                 | `FLOOR(4.9)`          | `4`        |
| `ROUND(x, d)`               | Rounds `x` to `d` decimal places                       | `ROUND(12.678, 2)`    | `12.68`    |
| `TRUNCATE(x, d)`            | Truncates `x` to `d` decimal places (no rounding)      | `TRUNCATE(12.678, 2)` | `12.67`    |
| `MOD(x, y)`                 | Returns the **remainder** of `x/y`                     | `MOD(10, 3)`          | `1`        |
| `POWER(x, y)` / `POW(x, y)` | Returns `x` raised to the power `y`                    | `POWER(3, 2)`         | `9`        |
| `SQRT(x)`                   | Returns the **square root** of `x`                     | `SQRT(25)`            | `5`        |
| `SIGN(x)`                   | Returns `-1`, `0`, or `1` depending on the sign of `x` | `SIGN(-5)`            | `-1`       |
| `RAND()`                    | Returns a **random number** between 0 and 1            | `RAND()`              | `0.748...` |
| `GREATEST(x1, x2, ...)`     | Returns the **largest** value                          | `GREATEST(10, 25, 5)` | `25`       |
| `LEAST(x1, x2, ...)`        | Returns the **smallest** value                         | `LEAST(10, 25, 5)`    | `5`        |
| `EXP(x)`                    | Returns e (Euler’s number) raised to `x`               | `EXP(1)`              | `2.718...` |
| `LOG(x)`                    | Natural logarithm (base e)                             | `LOG(2.718)`          | `1`        |
| `LOG10(x)`                  | Logarithm base 10                                      | `LOG10(100)`          | `2`        |
| `PI()`                      | Returns π                                              | `PI()`                | `3.141593` |
| `RADIANS(x)`                | Converts degrees → radians                             | `RADIANS(180)`        | `3.14159`  |
| `DEGREES(x)`                | Converts radians → degrees                             | `DEGREES(3.14159)`    | `180`      |

*/

SELECT
  ABS(-15) AS AbsoluteValue,
  CEIL(4.3) AS CeilValue,
  FLOOR(4.9) AS FloorValue,
  ROUND(12.678, 2) AS Rounded,
  MOD(10, 3) AS Modulus,
  POWER(3, 3) AS Cubes,
  SQRT(49) AS SquareRoot,
  RAND() AS RandomNumber;


--


/*

In MySQL, you can easily convert between radians and degrees using built-in functions.
These are especially useful in trigonometric and geometric calculations.

*/

/*

🔹 1. RADIANS()
Converts degrees to radians.
📘 Formula:
	radians = degrees x (PI/180)

*/

SELECT RADIANS(180);   -- Output: 3.141593  (≈ π)
SELECT RADIANS(90);    -- Output: 1.570796  (≈ π/2)


/*

🔹 2. DEGREES()
Converts radians to degrees.
📘 Formula:
	degrees = radians x (180/PI)

*/

SELECT DEGREES(PI());       -- Output: 180
SELECT DEGREES(1.570796);   -- Output: 90

/*

🔹 3. Practical Combined Example
You can use both together for conversions and validation:

*/

SELECT 
    RADIANS(360) AS radians_value,
    DEGREES(PI()/2) AS degrees_value;

/*

| radians_value | degrees_value |
| ------------- | ------------- |
| 6.283185      | 90.000000     |

*/

/*

🔹 4. Use with Trigonometric Functions
MySQL trigonometric functions (SIN(), COS(), TAN(), etc.) expect input in radians, 
so use RADIANS() if you have degree values.

*/
SELECT SIN(RADIANS(90));   -- Output: 1
SELECT COS(RADIANS(60));   -- Output: 0.5

--

/*

🔹 Trigonometric Functions in MySQL
MySQL supports several built-in trigonometric functions for performing mathematical and geometric calculations 
— like working with angles, distances, or waves.
All trigonometric functions in MySQL take radians as input (not degrees).

*/

-- ⚙️ To convert degrees → radians:
-- RADIANS(degrees)
SELECT RADIANS(180);

-- ⚙️ To convert radians → degrees:
-- DEGREES(radians)
SELECT DEGREES(3.141592653589793);

-- 🧮 Basic Trigonometric Functions
/*

| Function      | Description                                    | Example               | Output |
| ------------- | ---------------------------------------------- | --------------------- | ------ |
| `SIN(x)`      | Returns sine of angle `x` (in radians)         | `SIN(RADIANS(30))`    | 0.5    |
| `COS(x)`      | Returns cosine of angle `x` (in radians)       | `COS(RADIANS(60))`    | 0.5    |
| `TAN(x)`      | Returns tangent of angle `x` (in radians)      | `TAN(RADIANS(45))`    | 1      |
| `ASIN(x)`     | Returns angle (radians) of given sine value    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS(x)`     | Returns angle (radians) of given cosine value  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN(x)`     | Returns angle (radians) of given tangent value | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y, x)` | Returns angle between x-axis and point (x, y)  | `DEGREES(ATAN2(1,1))` | 45     |

*/

-- 🧮 Basic Trigonometric Functions
/*

| Function      | Description                                    | Example               | Output |
| ------------- | ---------------------------------------------- | --------------------- | ------ |
| `SIN(x)`      | Returns sine of angle `x` (in radians)         | `SIN(RADIANS(30))`    | 0.5    |
| `COS(x)`      | Returns cosine of angle `x` (in radians)       | `COS(RADIANS(60))`    | 0.5    |
| `TAN(x)`      | Returns tangent of angle `x` (in radians)      | `TAN(RADIANS(45))`    | 1      |
| `ASIN(x)`     | Returns angle (radians) of given sine value    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS(x)`     | Returns angle (radians) of given cosine value  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN(x)`     | Returns angle (radians) of given tangent value | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y, x)` | Returns angle between x-axis and point (x, y)  | `DEGREES(ATAN2(1,1))` | 45     |

*/

-- 🧠 Examples
-- 1️⃣ Sine, Cosine, Tangent

SELECT
	SIN(RADIANS(30)) AS Sine,
    COS(RADIANS(60)) AS Cos,
    TAN(RADIANS(45)) AS Tan;
  
-- 2️⃣ Inverse Trigonometric Functions
SELECT
  DEGREES(ASIN(0.5)) AS Angle_Sin,
  DEGREES(ACOS(0.5)) AS Angle_Cos,
  DEGREES(ATAN(1)) AS Angle_Tan;
    
-- 3️⃣ Angle from Coordinates
SELECT DEGREES(ATAN2(1, 1)) AS Angle;

/*

| Function     | Purpose                 | Example               | Output |
| ------------ | ----------------------- | --------------------- | ------ |
| `SIN()`      | Sine of angle           | `SIN(RADIANS(30))`    | 0.5    |
| `COS()`      | Cosine of angle         | `COS(RADIANS(60))`    | 0.5    |
| `TAN()`      | Tangent of angle        | `TAN(RADIANS(45))`    | 1      |
| `ASIN()`     | Inverse sine → angle    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS()`     | Inverse cosine → angle  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN()`     | Inverse tangent → angle | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y,x)` | Angle of point (x,y)    | `DEGREES(ATAN2(1,1))` | 45     |

*/


--

/*

🔹 Trigonometric Functions in MySQL
MySQL supports several built-in trigonometric functions for performing mathematical and geometric calculations 
— like working with angles, distances, or waves.
All trigonometric functions in MySQL take radians as input (not degrees).

*/

-- ⚙️ To convert degrees → radians:
-- RADIANS(degrees)
SELECT RADIANS(180);

-- ⚙️ To convert radians → degrees:
-- DEGREES(radians)
SELECT DEGREES(3.141592653589793);

-- 🧮 Basic Trigonometric Functions
/*

| Function      | Description                                    | Example               | Output |
| ------------- | ---------------------------------------------- | --------------------- | ------ |
| `SIN(x)`      | Returns sine of angle `x` (in radians)         | `SIN(RADIANS(30))`    | 0.5    |
| `COS(x)`      | Returns cosine of angle `x` (in radians)       | `COS(RADIANS(60))`    | 0.5    |
| `TAN(x)`      | Returns tangent of angle `x` (in radians)      | `TAN(RADIANS(45))`    | 1      |
| `ASIN(x)`     | Returns angle (radians) of given sine value    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS(x)`     | Returns angle (radians) of given cosine value  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN(x)`     | Returns angle (radians) of given tangent value | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y, x)` | Returns angle between x-axis and point (x, y)  | `DEGREES(ATAN2(1,1))` | 45     |

*/

-- 🧮 Basic Trigonometric Functions
/*

| Function      | Description                                    | Example               | Output |
| ------------- | ---------------------------------------------- | --------------------- | ------ |
| `SIN(x)`      | Returns sine of angle `x` (in radians)         | `SIN(RADIANS(30))`    | 0.5    |
| `COS(x)`      | Returns cosine of angle `x` (in radians)       | `COS(RADIANS(60))`    | 0.5    |
| `TAN(x)`      | Returns tangent of angle `x` (in radians)      | `TAN(RADIANS(45))`    | 1      |
| `ASIN(x)`     | Returns angle (radians) of given sine value    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS(x)`     | Returns angle (radians) of given cosine value  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN(x)`     | Returns angle (radians) of given tangent value | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y, x)` | Returns angle between x-axis and point (x, y)  | `DEGREES(ATAN2(1,1))` | 45     |

*/

-- 🧠 Examples
-- 1️⃣ Sine, Cosine, Tangent

SELECT
	SIN(RADIANS(30)) AS Sine,
    COS(RADIANS(60)) AS Cos,
    TAN(RADIANS(45)) AS Tan;
  
-- 2️⃣ Inverse Trigonometric Functions
SELECT
  DEGREES(ASIN(0.5)) AS Angle_Sin,
  DEGREES(ACOS(0.5)) AS Angle_Cos,
  DEGREES(ATAN(1)) AS Angle_Tan;
    
-- 3️⃣ Angle from Coordinates
SELECT DEGREES(ATAN2(1, 1)) AS Angle;

/*

| Function     | Purpose                 | Example               | Output |
| ------------ | ----------------------- | --------------------- | ------ |
| `SIN()`      | Sine of angle           | `SIN(RADIANS(30))`    | 0.5    |
| `COS()`      | Cosine of angle         | `COS(RADIANS(60))`    | 0.5    |
| `TAN()`      | Tangent of angle        | `TAN(RADIANS(45))`    | 1      |
| `ASIN()`     | Inverse sine → angle    | `DEGREES(ASIN(0.5))`  | 30     |
| `ACOS()`     | Inverse cosine → angle  | `DEGREES(ACOS(0.5))`  | 60     |
| `ATAN()`     | Inverse tangent → angle | `DEGREES(ATAN(1))`    | 45     |
| `ATAN2(y,x)` | Angle of point (x,y)    | `DEGREES(ATAN2(1,1))` | 45     |

*/


--

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


--

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

--

--  🧠 1. Difference Between SQL and MySQL
/*

| Feature             | **SQL**                                                                                              | **MySQL**                                                                             |
| ------------------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Definition**      | SQL stands for *Structured Query Language*. It is a **language** used to query and manage databases. | MySQL is a **Database Management System (DBMS)** that uses SQL as its query language. |
| **Type**            | Language / Standard                                                                                  | Software / Application                                                                |
| **Function**        | Used to **write queries** like `SELECT`, `INSERT`, `UPDATE`, etc.                                    | Used to **store, manage, and retrieve** data using SQL commands.                      |
| **Developer**       | Developed by **ANSI (American National Standards Institute)**                                        | Developed by **MySQL AB**, later acquired by **Oracle Corporation**                   |
| **Usage**           | Defines *how* to talk to any relational database.                                                    | Is *one of the databases* that understands SQL.                                       |
| **Examples of Use** | `SELECT * FROM students;`                                                                            | MySQL runs that SQL query on its database engine.                                     |


*/

-- ✅ In short:
-- SQL is the language, MySQL is the tool that uses the language.

-- 🧩 2. String Concatenation in MySQL
-- In MySQL, you can combine strings using CONCAT() function.
SELECT CONCAT('Hello', ' ', 'Frank') AS Greeting;
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;


--

-- 🔹 1. Natural Logarithm (LN() or LOG())
-- Returns the natural logarithm (base e) of a number.
SELECT LN(2.7183);   -- Output: 1 (approximately)
SELECT LOG(2.7183);  -- Same as LN()
SELECT LN(2.7183), LOG(2.7183);
-- 🧠 Note: e ≈ 2.71828


-- 🔹 2. Base-10 Logarithm (LOG10())
-- Returns the logarithm to base 10.
SELECT LOG10(100);   -- Output: 2
SELECT LOG10(1000);  -- Output: 3
SELECT LOG10(1000000), LOG10(1000);


-- 🔹 3. Logarithm with Custom Base (LOG(base, number))
-- You can specify the base and the number.
SELECT LOG(2, 8);   -- Output: 3 (since 2³ = 8)
SELECT LOG(3, 9);   -- Output: 2 (since 3² = 9)

-- 🔹 4. Exponential Function (EXP())
-- Though not a log function, it’s often used together—it returns e raised to a given power.
SELECT EXP(1);  -- Output: 2.718281828 (≈ e)
SELECT EXP(2);  -- Output: 7.389056099


/*

| Function    | Description          | Example       | Output |
| ----------- | -------------------- | ------------- | ------ |
| `LN(x)`     | Natural log (base e) | `LN(2.7183)`  | 1      |
| `LOG10(x)`  | Log base 10          | `LOG10(1000)` | 3      |
| `LOG(b, x)` | Log base b           | `LOG(2, 8)`   | 3      |
| `EXP(x)`    | e^x                  | `EXP(2)`      | 7.389  |

*/


--
