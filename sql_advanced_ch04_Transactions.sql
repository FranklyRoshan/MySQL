-- Transactions
/*
💡 What Is a Transaction in MySQL?

A transaction is a group of one or more SQL statements that are executed as a single logical unit of work.
Either all the statements succeed (commit) or none of them take effect (rollback).
*/

-- 🧱 Basic Syntax
START TRANSACTION;

-- your SQL statements here
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

COMMIT;

-- If something goes wrong:
ROLLBACK;

/*

⚙️ Transaction Control Statements
| Command                        | Description                                            |
| ------------------------------ | ------------------------------------------------------ |
| `START TRANSACTION` or `BEGIN` | Starts a new transaction                               |
| `COMMIT`                       | Saves all changes made in the transaction              |
| `ROLLBACK`                     | Cancels all changes since the last `START TRANSACTION` |
| `SAVEPOINT`                    | Sets a point inside a transaction you can roll back to |
| `ROLLBACK TO SAVEPOINT`        | Rolls back to a specific savepoint                     |
| `RELEASE SAVEPOINT`            | Deletes a savepoint                                    |
| `SET AUTOCOMMIT`               | Enables or disables auto-commit mode                   |

*/

-- 🧮 Example — Bank Transfer
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE acc_no = 101;  -- debit
UPDATE accounts SET balance = balance + 500 WHERE acc_no = 102;  -- credit

COMMIT;

-- ✅ If both queries succeed → changes are saved.
-- ❌ If one fails → you can ROLLBACK to undo everything.

-- 🧰 Using SAVEPOINT
START TRANSACTION;

INSERT INTO employees VALUES (1, 'Alice');
SAVEPOINT sp1;

INSERT INTO employees VALUES (2, 'Bob');
ROLLBACK TO sp1;  -- Undo Bob, keep Alice

COMMIT;

-- 🔁 Auto-Commit Mode
-- By default, MySQL runs in auto-commit mode, meaning every statement is committed immediately.
-- To disable:
SET AUTOCOMMIT = 0;

-- To re-enable:
SET AUTOCOMMIT = 1;

-- Data Integrity

/*
🎯 Purpose: Data Integrity

Transactions ensure data integrity — meaning 
your data remains accurate, consistent, and reliable, even in cases of:
Power failures
System crashes
Errors in queries

🔒 ACID Properties of Transactions
Transactions guarantee data integrity using these four properties:

| Property            | Meaning                                         |
| ------------------- | ----------------------------------------------- |
| **A - Atomicity**   | All or nothing execution                        |
| **C - Consistency** | Keeps database valid before & after transaction |
| **I - Isolation**   | Each transaction runs independently             |
| **D - Durability**  | Once committed, changes are permanent           |

| Property            | Meaning                                                               | Example                                                                                    |
| ------------------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **A – Atomicity**   | All steps in a transaction succeed or none do.                        | If money is transferred between accounts, both debit and credit must succeed — or neither. |
| **C – Consistency** | Database must remain in a valid state before and after a transaction. | Balances must follow business rules (e.g., no negative balance).                           |
| **I – Isolation**   | Transactions must not interfere with each other.                      | Two users updating the same record won't cause conflicts.                                  |
| **D – Durability**  | Once committed, data changes are permanent.                           | Even after a crash, committed data remains safe.                                           |

*/
-- ⚡ Supported Storage Engine
-- 👉 Only the InnoDB engine supports transactions.
-- Other engines like MyISAM do not.
-- You can check your table’s engine:

SHOW TABLE STATUS LIKE 'accounts';

-- 🧩 Mini Example
CREATE TABLE accounts (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  balance DECIMAL(10,2)
) ENGINE = InnoDB;

INSERT INTO accounts VALUES (1, 'Frank', 1000), (2, 'John', 500);

START TRANSACTION;
UPDATE accounts SET balance = balance - 200 WHERE id = 1;
UPDATE accounts SET balance = balance + 200 WHERE id = 2;
COMMIT;


-- 🧠 Example: Transaction Ensuring Data Integrity
START TRANSACTION;

UPDATE accounts SET balance = balance - 1000 WHERE account_no = 'A123';
UPDATE accounts SET balance = balance + 1000 WHERE

COMMIT;

--  Transaction Performance
/*

⚙️ What Is Transaction Performance?
Transaction performance refers to how efficiently a database handles multiple transactions — 
ensuring speed, scalability, and data safety at the same time.
Transactions can impact performance positively or negatively depending on how they’re used.

🚦 Key Factors Affecting Transaction Performance

| Factor                         | Description                                                     | Performance Impact                                       |
| ------------------------------ | --------------------------------------------------------------- | -------------------------------------------------------- |
| **1. Transaction Size**        | Number of SQL statements inside a single transaction            | Larger transactions = more locks, slower performance     |
| **2. Locking**                 | Transactions lock tables/rows to ensure consistency             | Too many locks can cause **blocking** and **deadlocks**  |
| **3. Isolation Level**         | Controls visibility of uncommitted data                         | Higher isolation (e.g., SERIALIZABLE) = safer but slower |
| **4. Index Usage**             | Helps locate rows faster during updates/deletes                 | Poor indexing = slower transactions                      |
| **5. Disk I/O and Log Writes** | Every transaction change must be logged (for rollback/recovery) | Heavy I/O = slower commit speed                          |
| **6. Concurrency**             | Number of users performing transactions simultaneously          | More concurrency = more contention, slower throughput    |


🚀 Tips to Improve Transaction Performance
| Strategy                                    | Description                                                 |
| ------------------------------------------- | ----------------------------------------------------------- |
| ✅ **Keep transactions short**               | Commit or rollback as soon as possible.                     |
| ✅ **Use proper indexes**                    | To avoid full table scans during updates.                   |
| ✅ **Choose right isolation level**          | Use `READ COMMITTED` instead of `SERIALIZABLE` if possible. |
| ✅ **Batch operations**                      | Group multiple inserts/updates efficiently.                 |
| ✅ **Avoid user input during a transaction** | Do not wait for user input once a transaction has started.  |
| ✅ **Use InnoDB engine**                     | Supports transactions and performs better than MyISAM.      |

*/

-- 🧩 Example
-- Poor performance: long transaction with user delay
START TRANSACTION;
UPDATE accounts SET balance = balance - 500 WHERE id = 1;
-- waiting for user input here ❌
UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;

-- Better performance
START TRANSACTION;
UPDATE accounts SET balance = balance - 500 WHERE id = 1;
UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;

/*

⚖️ Balance Between Integrity and Performance
Higher integrity → lower speed (because of strict locking, isolation, durability).
Lower integrity → higher speed (but increased risk of inconsistent data).
That’s why database engineers often tune isolation levels and transaction size to achieve a balance.

*/

-- ----------------------------------------------------------------------------------------------------------------------
-- 02 Data integrity

USE scratch;

CREATE TABLE widgetInventory (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  description TEXT,
  onhand INTEGER NOT NULL
);

CREATE TABLE widgetSales (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  inv_id INTEGER,
  quan INTEGER,
  price INTEGER
);

INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'rock', 25 );
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'paper', 25 );
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'scissors', 25 );

SELECT * FROM widgetInventory;

START TRANSACTION;
INSERT INTO widgetSales ( inv_id, quan, price ) VALUES ( 1, 5, 500 );
UPDATE widgetInventory SET onhand = ( onhand - 5 ) WHERE id = 1;
COMMIT;

SELECT * FROM widgetInventory;
SELECT * FROM widgetSales;

START TRANSACTION;
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'toy', 25 );
ROLLBACK;
SELECT * FROM widgetInventory;

-- restore database
DROP TABLE IF EXISTS widgetInventory;
DROP TABLE IF EXISTS widgetSales;

-- 03 Performance 

USE scratch;

DROP TABLE IF EXISTS test;
DROP PROCEDURE IF EXISTS insert_loop;

CREATE TABLE test ( id INTEGER AUTO_INCREMENT PRIMARY KEY, data TEXT );

DELIMITER //
CREATE PROCEDURE insert_loop( IN count INT UNSIGNED )
BEGIN
    DECLARE accum INT UNSIGNED DEFAULT 0;
    DECLARE start_time VARCHAR(32);
    DECLARE end_time VARCHAR(32);
    SET start_time = SYSDATE(6);
    WHILE accum < count DO
        SET accum = accum + 1;
        INSERT INTO test ( data ) VALUES ( 'this is a good sized line of text.' );
    END WHILE;
    SET end_time = SYSDATE(6);
    SELECT TIME_FORMAT(start_time, '%T.%f') AS `Start`,
        TIME_FORMAT(end_time, '%T.%f') AS `End`,
        TIME_FORMAT(TIMEDIFF(end_time, start_time), '%s.%f') AS `Elapsed Secs`;
END //
DELIMITER ;

-- START TRANSACTION;
CALL insert_loop(100000);
-- COMMIT;

SELECT * FROM test ORDER BY id DESC LIMIT 10;

DROP TABLE IF EXISTS test;
DROP PROCEDURE IF EXISTS insert_loop;
