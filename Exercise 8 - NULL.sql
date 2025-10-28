-- Exercise 8 NULL 
-- Get the  orders that are not shipped

-- Solution
SELECT *
FROM orders
WHERE shipper_id IS NULL