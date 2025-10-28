
/*SELECT * 
FROM Customers
WHERE state = 'VA' OR state = 'GA' OR state = 'FL';
*/

-- IN 
SELECT *
FROM Customers
WHERE state IN ('VA', 'FL', 'GA');

-- NOT IN 
/*SELECT *
FROM  Customers
WHERE state NOT IN ('VA', 'FL', 'GA');
*/

