-- Exercise 1 - SELECT
-- Return all the products
--   name
--   unit price
--   new price (Unit price * 1.1)

 -- Solution
SELECT name, unit_price, unit_price * 1.1 AS 'new price'
FROM products;