USE scratch;

SELECT NOW();
SHOW VARIABLES LIKE '%time_zone%';
SET time_zone = '+00:00';
SET time_zone = 'SYSTEM'; -- SET time_zone = "SYSTEM";
SELECT UTC_TIMESTAMP();

-- timestamp with DATETIME
DROP TABLE IF EXISTS temp;
CREATE TABLE temp (
	id INT UNSIGNED UNIQUE AUTO_INCREMENT PRIMARY KEY,
    stamp DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(64)
);

INSERT INTO temp (name) VALUES ('this');
INSERT INTO temp (name) VALUES ('that');
INSERT INTO temp (name) VALUES ('other');

SELECT * FROM temp;
SELECT id, CONVERT_TZ(stamp, 'SYSTEM', '+00:00') AS utc_stamp, name FROM temp;

DROP TABLE IF EXISTS temp;
