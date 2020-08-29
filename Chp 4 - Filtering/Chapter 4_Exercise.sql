USE sakila;

-- Filtering rows for the first 2 questions

CREATE VIEW sakila.new_table AS 
SELECT payment_id, customer_id, amount, payment_date FROM payment
WHERE payment_id BETWEEN 101 AND 120;

-- Exercise 1

SELECT * FROM new_table
WHERE customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23');

-- Exercise 2

SELECT * FROM new_table 
WHERE customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19');

DROP VIEW new_table;

-- Exercise 3

SELECT * FROM payment 
WHERE amount IN (1.98,7.98,9.98);

-- Exercise 4 

SELECT * FROM customer 
WHERE last_name LIKE '_A%W%';


