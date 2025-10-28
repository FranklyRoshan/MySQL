/*

| Feature             | **SQL**                                                                                           | **MySQL**                                                                                |
| ------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| **Definition**      | SQL (*Structured Query Language*) is a **standard language** used to manage relational databases. | MySQL is a **Database Management System (DBMS)** that **implements SQL** to manage data. |
| **Type**            | Language / Standard                                                                               | Software / Application                                                                   |
| **Function**        | Provides **commands** like `SELECT`, `INSERT`, `UPDATE`, `DELETE`.                                | Executes those SQL commands to interact with **MySQL databases**.                        |
| **Developer**       | Maintained by **ANSI/ISO** (as a standard).                                                       | Developed by **Oracle Corporation** (originally MySQL AB).                               |
| **Example Systems** | SQL standard is used by MySQL, Oracle, PostgreSQL, SQL Server, SQLite, etc.                       | MySQL is one of those implementations.                                                   |
| **Focus**           | *Defines how databases should be queried.*                                                        | *Implements the SQL standard with MySQL-specific features.*                              |


*/


-- SQL is the language, and MySQL is software that understands and runs SQL.
/*

| **Concept**                 | **Standard SQL (ANSI SQL)**                                                       | **MySQL Implementation**                                            | **Example**                                                                       |  
| --------------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------- | 
| 🧩 **String Concatenation** | SELECT 'Hello' || ' ' || 'World' AS greeting;                                     |  SELECT CONCAT('Hello', ' ', 'World') AS greeting;                  | • SQL: SELECT 'Hello' || ' ' || 'World' AS greeting;                              |  
																																															MySQL: SELECT CONCAT('Hello', ' ', 'World') AS greeting;                        |                                                                   
| 🔤 **Quote Marks**          | `'text'` → String literal<br>`"identifier"` → Column/table name (in some systems) | `'text'` → String literal<br>`` `identifier` `` → Column/table name | • SQL: `SELECT "Name" FROM Students;• MySQL: `SELECT \`Name` FROM Students;` |   
| ➗ **Integer Division**     | Not defined in ANSI SQL (depends on DB)                                           | Uses `DIV` operator                                                 | • SQL Server: `SELECT 10 / 3;` → 3.333 • MySQL: `SELECT 10 DIV 3;` → 3         |
| 🔢 **Modulus (Remainder)**  | Uses `MOD(x, y)` or `%`                                                           | Supports both `MOD(x, y)` and `%`                                   | • SQL: `SELECT MOD(10, 3);` → • MySQL: `SELECT 10 % 3;` → 1                  |       
| 💬 **Comments**             | `--` for single line and /* ... */ ` for multi-line                               | `--` or `#` for single line<br>`/* ... */` for multi-line           | • SQL: `-- Comment`<br>• MySQL: `# Comment`                                       |
| ⚙️ **Executable Comments**  | Not available in standard SQL                                                     | Supported using `/*! ... */`                                        | • MySQL: `/*!40101 SET @var = 1; */` → runs only on MySQL v4.1.1+                 | 

*/