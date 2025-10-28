-- Exercise 4 - WHERE 
-- Return produts with  
-- quantity in stock  equal to  49, 38, 72

-- Solution
SELECT *
FROM Products 
WHERE quantity_in_stock IN (49, 38, 72)