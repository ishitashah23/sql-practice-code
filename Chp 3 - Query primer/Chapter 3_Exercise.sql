USE sakila;

-- Exercise 3.1 
DESC actor;

SELECT actor_id, first_name, last_name 
FROM actor
ORDER BY last_name, first_name;

-- Exercise 3.2
SELECT actor_id, first_name, last_name 
FROM actor
WHERE (last_name = 'WILLIAMS') OR (last_name = 'DAVIS')
ORDER BY last_name, first_name;

-- Exercise 3.3 
DESC rental;

SELECT DISTINCT customer_id
FROM rental 
WHERE date(rental_date) = '2005-07-05'
ORDER BY customer_id;

-- Exercise 3.4
SELECT c.email, r.return_date 
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY DAYOFMONTH(r.return_date) DESC, TIME(r.return_date) DESC;
