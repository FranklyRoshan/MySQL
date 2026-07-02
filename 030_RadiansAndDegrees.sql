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

