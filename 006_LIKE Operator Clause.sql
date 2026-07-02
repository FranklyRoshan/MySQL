-- LIKE Operator Clause

/* MySQL Wildcard  
Symbol - % [Percent sign]
Description - Represents Zero or more characters
Example - bl% finds bl, black, blue and blob
%at
%es%

Symbol - _ [UnderScore]
Description - Represents a single character 
Example - h_t finds hot, hat and hit 
*/
-- Example 1
/*SELECT *
FROM  customers
WHERE last_name LIKE 'b%'
*/

-- Example 3
/*SELECT  *
FROM customers
WHERE  last_name LIKE '%b%'
*/

-- Example 4
/*SELECT *
FROM customers
WHERE last_name  LIKE '%y'
*/

-- Example 5
/*SELECT *
FROM customers
WHERE last_name LIKE  '_____y'
*/

-- Example 6
SELECT *
FROM customers
WHERE last_name LIKE 'b____y'


