-- OUTER JOIN

-- JOIN - INNER JOIN
-- OUTER JOIN - Outer Joins
-- OUTER JOIN - [LEFT JOIN, RIGHT JOIN]

-- INNER JOIN [JOIN]
/*SELECT c.customer_id, c.first_name, o.order_id
FROM customers c 
JOIN orders o
		ON c.customer_id = o.customer_id 
ORDER BY c.customer_id
*/

-- LEFT JOIN
/*SELECT c.customer_id, c.first_name, o.order_id
FROM customers c 
LEFT JOIN orders o
		ON c.customer_id = o.customer_id 
ORDER BY c.customer_id
*/

-- RIGHT JOIN
/*SELECT c.customer_id, c.first_name, o.order_id
FROM customers c 
RIGHT JOIN orders o
		ON c.customer_id = o.customer_id 
ORDER BY c.customer_id
*/

SELECT c.customer_id, c.first_name, o.order_id
FROM  orders o
RIGHT JOIN customers c
		ON c.customer_id = o.customer_id 
ORDER BY c.customer_id