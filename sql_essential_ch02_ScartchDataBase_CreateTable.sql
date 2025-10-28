USE scratch;

CREATE TABLE test (
	id INT,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
);

DESCRIBE test;
SHOW TABLE STATUS WHERE name = 'test';
DROP TABLE IF EXISTS test;

