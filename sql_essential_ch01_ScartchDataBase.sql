USE scratch;

-- Finding databases, tables and columns
SHOW DATABASES;
SHOW TABLES;
DROP TABLE scratch;
DESCRIBE customer;
SHOW TABLE STATUS;
SHOW CREATE TABLE customer;

-- INSERT (Inserting data)
SELECT * FROM customer;
INSERT INTO customer (name, address, city, state, zip) VALUES ('Fred Flintstone', '123 cobblestone way', 'Bedrock', 'CA', '91234');
INSERT INTO customer (name, city, state) VALUES ('Jimi Hendrix', 'Renton', 'WA');

-- UPDATE (Updating data)
SELECT * FROM customer WHERE name LIKE 'Jimi%';
UPDATE customer SET address = '123 Music Avenue', zip = '98056' WHERE name LIKE 'Jimi%'; 
UPDATE customer SET address = NULL, city = NULL WHERE name LIKE 'Jimi%'; 

-- DELETE (Deleting data)
SELECT * FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';
DELETE FROM customer WHERE name LIKE 'Jimi%' OR name LIKE 'Fred%';


DROP TABLE customer;
