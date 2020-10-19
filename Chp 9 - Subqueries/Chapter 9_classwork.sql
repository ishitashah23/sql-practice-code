USE sakila;

-- Non correlated subquery examples
SELECT first_name, last_name 
FROM customer
WHERE customer_id = (SELECT MAX(customer_id) FROM customer);

SELECT city_id, city 
FROM city 
WHERE country_id <> (SELECT country_id FROM country WHERE country = 'India');

SELECT city_id, city 
FROM city 
WHERE country_id IN (SELECT country_id FROM country WHERE country IN ('Canada','Mexico'))
ORDER BY city;

SELECT fa.actor_id, fa.film_id 
FROM film_actor AS fa
WHERE fa.actor_id IN
(SELECT actor_id
FROM actor WHERE last_name = 'Monroe')
AND fa.film_id IN
(SELECT film_id FROM film 
WHERE rating = 'PG');

-- Correlated subqueries
-- correlated query counts the number of rentals and containing query returns name of customers with exact 20 rentals
SELECT c.first_name, c.last_name
FROM customer c
WHERE 20 = 
(SELECT count(*) FROM rental AS r
WHERE r.customer_id = c.customer_id);


SELECT c.first_name, c.last_name
FROM customer c 
WHERE
(SELECT sum(p.amount) FROM payment p 
WHERE p.customer_id = c.customer_id)
BETWEEN 180 AND 240;