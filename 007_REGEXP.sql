-- Exercise 7 -  REGEXP - Regular Expression
-- Get the customers whose 
--		first names are ELKA or AMBUR
--		last names end with EY or ON
-- 		last names start with MY or contains SE 
-- 	 	last names contains B followed  by R or U

-- Solution
-- Get the customers whose 
--		first names are ELKA or AMBUR
/*SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR'
*/


-- Get the customers whose 
--		last names end with EY or ON
/*SELECT * 
FROM customers
WHERE last_name REGEXP 'EY$|ON$'
*/

-- Get the customers whose 
-- 		last names start with MY or contains SE 
/*SELECT *
FROM customers 
WHERE last_name REGEXP '^MY|SE'
*/

-- Get the customers whose 
-- 	 	last names contains B followed  by R or U
/*SELECT *
FROM customers 
WHERE last_name REGEXP 'B[RU]'
*/

SELECT *
FROM customers 
WHERE last_name REGEXP 'br|bu'

