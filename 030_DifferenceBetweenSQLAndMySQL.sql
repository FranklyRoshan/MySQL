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


