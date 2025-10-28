-- Exercise 10 - LIMIT Clause 
-- Get the top three loyal customers

-- Solution
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3