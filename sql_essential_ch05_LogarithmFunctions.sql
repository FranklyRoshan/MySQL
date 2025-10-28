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
