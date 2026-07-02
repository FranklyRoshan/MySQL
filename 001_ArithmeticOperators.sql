-- Arithmetic Operators

/*

| Operator | Description         | Example  | Result |
| -------- | ------------------- | -------- | ------ |
| `+`      | Addition            | `10 + 5` | `15`   |
| `-`      | Subtraction         | `10 - 5` | `5`    |
| `*`      | Multiplication      | `10 * 5` | `50`   |
| `/`      | Division            | `10 / 5` | `2`    |
| `%`      | Modulus (remainder) | `10 % 3` | `1`    |

*/

SELECT 10 + 5;
SELECT 10 - 5;
SELECT 10 * 5;
SELECT 10 / 5;
SELECT 10 % 3; -- SELECT MOD(10, 3);

DROP TABLE temp;

/*

| **Operator**   | **Meaning**         | **Example**                              | **Result** |
| -------------- | ------------------- | ---------------------------------------- | ---------- |
| `+`            | Addition            | `SELECT 10 + 5;`                         | ✅ `15`     |
| `-`            | Subtraction         | `SELECT 10 - 5;`                         | ✅ `5`      |
| `*`            | Multiplication      | `SELECT 10 * 5;`                         | ✅ `50`     |
| `/`            | Division            | `SELECT 10 / 5;`                         | ✅ `2`      |
| `%` or `MOD()` | Modulus (remainder) | `SELECT 10 % 3;` or `SELECT MOD(10, 3);` | ✅ `1`      |

*/

--

CREATE TABLE products (
    id INT,
    name VARCHAR(50),
    price DECIMAL(8,2),
    quantity INT
);

INSERT INTO products VALUES
(1, 'Pen', 10.00, 5),
(2, 'Book', 50.00, 2),
(3, 'Bag', 250.00, 1),
(4, 'Pencil', 5.00, 10);

SELECT * FROM products;

SELECT name, price + 5 AS 'Price with Tax' FROM products;
SELECT name, price - 2 AS 'Discounted Price' FROM products;
SELECT name, price * quantity AS 'Total Value' FROM products;
SELECT name, price / 2 AS 'Half Price' FROM products;
SELECT 10 % 3 AS Remainder;
-- or
SELECT MOD(10, 3) AS Remainder;
SELECT name, (price * quantity) + 10 AS 'Total + Handling Fee' FROM products;
 
DROP TABLE products;

--

-- MySQL Operator Precedence (from Highest → Lowest) (PEDMAS, BODMAS)
/*

| **Precedence** | **Operator(s)**                                                              | **Description**                        |            |            |
| -------------- | ---------------------------------------------------------------------------- | -------------------------------------- | ---------- | ---------- |
| 🔹 1           | `BINARY`, `COLLATE`                                                          | Character set and collation operations |            |            |
| 🔹 2           | `!`                                                                          | Logical NOT                            |            |            |
| 🔹 3           | `-` (unary minus), `~`                                                       | Negative, bitwise NOT                  |            |            |
| 🔹 4           | `^`                                                                          | Bitwise XOR                            |            |            |
| 🔹 5           | `*`, `/`, `DIV`, `%`, `MOD`                                                  | Multiplication, division, modulus      |            |            |
| 🔹 6           | `+`, `-`                                                                     | Addition and subtraction               |            |            |
| 🔹 7           | `<<`, `>>`                                                                   | Bitwise shift operators                |            |            |
| 🔹 8           | `&`                                                                          | Bitwise AND                            |            |            |
| 🔹 9           | `                                                                            | `                                      | Bitwise OR |            |
| 🔹 10          | `=` , `<=>`, `>=`, `>`, `<=`, `<`, `<>`, `!=`, `IS`, `LIKE`, `IN`, `BETWEEN` | Comparison operators                   |            |            |
| 🔹 11          | `NOT`                                                                        | Logical NOT (for conditions)           |            |            |
| 🔹 12          | `AND`, `&&`                                                                  | Logical AND                            |            |            |
| 🔹 13          | `XOR`                                                                        | Logical exclusive OR                   |            |            |
| 🔹 14          | `OR`, `                                                                      |                                        | `          | Logical OR |
| 🔹 15          | `= (assignment)`                                                             | Used in SET or UPDATE                  |            |            |
| 🔹 16          | `( )`                                                                        | Parentheses (override all precedence)  |            |            |

*/

-- Key Rule:
-- If an expression contains multiple operators, MySQL executes them in the above order, unless you use parentheses ( ) to change it.

-- ✅ Examples
-- 1️⃣ Without Parentheses
SELECT 10 + 5 * 2;

-- 2️⃣ With Parentheses
SELECT (10 + 5) * 2;

-- 3️⃣ Logical Operators Example
SELECT 10 > 5 AND 8 < 6 OR 4 = 4;

-- 4️⃣ Using Parentheses to Change Logic
SELECT 10 > 5 AND (8 < 6 OR 4 = 4);

-- 5️⃣ Bitwise vs Arithmetic
SELECT 5 + 3 * 2 & 4;

DROP TABLE temp;

/*

🧩 Tip
Always use parentheses to make your logic clear — even if you know the precedence order. 
It improves readability and prevents bugs.

*/