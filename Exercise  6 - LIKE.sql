-- Exercise  6 - LIKE
-- Get the customers whose 
-- 		addresses contain TRAIL or AVENUE
--		phone number end with 9

-- Solution 
-- 		addresses contain TRAIL or AVENUE
/*SELECT * 
FROM customers
WHERE address LIKE '%trail%' OR 
	  address LIKE '%avenue%'
*/

--		phone number end with 9
SELECT *
FROM customers
WHERE phone LIKE '%9';

/*SELECT *
FROM customers
WHERE phone NOT LIKE '%9';
*/