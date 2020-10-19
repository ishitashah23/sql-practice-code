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

-- CTE example

WITH actors_s AS
(SELECT actor_id, first_name, last_name 
FROM actor 
WHERE last_name LIKE 'S%'),

actors_s_pg AS
(SELECT s.actor_id, s.first_name, s.last_name, f.film_id, f.title
FROM actors_s AS s 
	INNER JOIN film_actor AS fa
    ON s.actor_id = fa.actor_id
    INNER JOIN film AS f
    ON f.film_id = fa.film_id
WHERE f.rating = 'PG'),

actors_s_pg_revenue AS 
(SELECT spg.first_name, spg.last_name, p.amount 
FROM actors_s_pg AS spg
	INNER JOIN inventory AS i
    ON i.film_id = spg.film_id
    INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
    INNER JOIN payment AS p 
    ON r.rental_id = p.rental_id)
    
SELECT spg_rev.first_name, spg_rev.last_name, sum(spg_rev.amount) AS tot_revenue
FROM actors_s_pg_revenue AS spg_rev
GROUP BY spg_rev.first_name, spg_rev.last_name
ORDER BY 3 DESC;
