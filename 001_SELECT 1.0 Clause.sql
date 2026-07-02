-- Block comment (Transact-SQL) slash asterisk  /**/

/*SELECT last_name, first_name, points, points + 10 
FROM customers; */

-- Arithematic operators - +, -, *, /, %

/*SELECT 
	last_name, 
    first_name, 
    points, 
    points * 10 + 100 
FROM customers;*/

-- BODMAS - Bracket(Pararntheses), Order (Exponents, Powers/indices, roots), Division, Multiplication, Addition, Subtraction.

SELECT 
	last_name, 
    first_name, 
    points, 
    (points + 10) * 100 AS 'discount factor' -- discount_factor or 'discount factor', "discount factor"
FROM customers;