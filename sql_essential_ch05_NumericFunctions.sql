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
