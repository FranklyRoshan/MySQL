-- Exercise 9 - ORDER BY 
/*SELECT *
FROM order_items
WHERE order_id = '2'
ORDER BY quantity * unit_price 
*/

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = '2'
ORDER BY total_price DESC