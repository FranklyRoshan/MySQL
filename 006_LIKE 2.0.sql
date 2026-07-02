 -- Exercise 6 - REGEXP
 -- Get the customers whose
 --		addresses contains TRAIL or AVENUE
 -- 	phone numbers end with 9
 
 -- Solution
 --		addresses contains TRAIL or AVENUE
/*SELECT *
FROM customers 
WHERE address LIKE '%trail%'OR 
	   address LIKE '%avenue%'	
*/

-- 	phone numbers end with 9
SELECT * 
FROM customers 
WHERE phone LIKE '%9';

SELECT * 
FROM customers 
WHERE phone NOT LIKE '%9' 
   