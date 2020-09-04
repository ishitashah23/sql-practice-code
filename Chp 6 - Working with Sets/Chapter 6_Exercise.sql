USE sakila;

-- Exercise 1 
/* 
1. {L,M,N,O,P,Q,R,S,T}
2. {L,M,N,O,P, P,Q,R,S,T} 
3. {P}
4. {L,M,N,O} 
*/

-- Exercise 2
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'L%'
UNION 
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'L%';

-- Exercise 3
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'L%'
UNION 
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'L%'
ORDER BY last_name; -- if column names are different here then the first table's column header should be used in order by clause





