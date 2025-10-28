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




