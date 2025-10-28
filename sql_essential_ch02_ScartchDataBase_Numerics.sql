USE scratch;

DESCRIBE numerics;
SELECT * FROM numerics;

-- decimal
SELECT da + db FROM numerics;
SELECT da + db = 0.3 FROM numerics;

-- float
SELECT fa + fb FROM numerics;
SELECT fa + fb = 0.3 FROM numerics;

-- Boolean 
-- 1 - true
-- 0 - false

DROP TABLE numerics;

/*

Integer
	INT is INTEGER
    
e.g. NUMERIC(9,2)
    1234567.89

Decimal 
	DECIMAL(P,S)
    p - precision
    s - scale
    
e.g. DECIMAL(9,2)
	1234567.89

Default value of scale is zero
	DECIMAL(10,0)
	1234567890    

*/