-- ORDER BY Clause
/*SELECT *
FROM customers
ORDER BY first_name

-- Sort by descending order [DESC]
-- ORDER BY first_name DESC

-- sort by ascending order [ASC]
-- ORDER BY first_name ASC
*/

/*SELECT *
FROM customers
ORDER BY state, first_name

-- ORDER BY state DESC, first_name  DESC
*/

/*SELECT first_name, last_name
FROM customers
ORDER BY birth_date
*/

/*SELECT first_name, last_name, 10 AS points
FROM customers 
ORDER BY points, first_name
*/

/*SELECT first_name, last_name, 10 AS points
FROM customers 
ORDER BY 1, 2
*/

SELECT birth_date, first_name, last_name, 10 AS points
FROM customers 
ORDER BY first_name

-- NOTE - In default the database has been already sort [order by] the column that selected as a 'Primary key [PK]'
