-- AND
/*SELECT *
FROM Customers
WHERE birth_date > '1990-01-01' OR points > 1000 AND
	  state = 'VA' */

/*SELECT *
FROM Customers 
WHERE birth_date <= '1990-01-01' AND points <= 1000
*/

/* BODMAS
   ( )
   *  /
   = -
*/

 /* Likewise 
	AND
    OR 
    NOT
 */
 
 -- OR
/*SELECT *
FROM Customers
WHERE birth_date > '1990-01-01' OR 
	  (points > 1000 AND state = 'VA');
*/
      
-- NOT
SELECT *
FROM Customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000)

