-- REGEXP [Regular Expressions]

/*SELECT *
FROM customers
WHERE last_name LIKE '%field%'
*/

/*SELECT * 
FROM customers
WHERE last_name REGEXP 'field'
*/


/*SELECT *
FROM customers
-- WHERE last_name LIKE '%field%'
WHERE last_name REGEXP 'field'
*/


-- Dollar sign [$] - End of string 
/*SELECT * 
FROM customers
WHERE last_name REGEXP 'field$'
*/

-- Caret symbol [^] -  Matching beginning of string
/*SELECT * 
FROM customers
WHERE last_name REGEXP '^Rose'
*/

-- Pipe symbol [|] - Alternation; matches any of the patterns
/*
SELECT * 
FROM customers
WHERE last_name REGEXP 'field|mac|Rose'
*/

/*
SELECT * 
FROM customers
WHERE last_name REGEXP '^field|mac|Rose'
*/

/*
SELECT * 
FROM customers
WHERE last_name REGEXP 'field$|mac|Rose'
*/

-- [] - any character listed between the square brackets and after another character
-- '[gim]e' - means like 'ge' AND 'ie' AND 'me'
/*
SELECT * 
FROM customers
WHERE last_name REGEXP '[gim]e'
*/

-- [] - any character listed between the square brackets and before another character
-- 'e[abl]' - means like 'ea' AND 'eb' AND 'el'
/*
SELECT * 
FROM customers
WHERE last_name REGEXP 'e[abl]'
*/

-- [^abc] - Any character not listed between the square brackets
/*
SELECT * 
FROM customers
WHERE last_name REGEXP 'e[^abl]'
*/

SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e'

-- ^ beginning
--  end $
-- | logical or multiple pattern 
-- [abcd]
-- [a-h]

 