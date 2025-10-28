-- Exercise 3 - AND, OR & NOT
-- Form the order_items table, get the item  
-- 		for order #6
-- 		where the total price is greater than 30

-- Solution
SELECT *
FROM sql_store.order_items
WHERE order_id = 6 AND (quantity*unit_price) > 30;
