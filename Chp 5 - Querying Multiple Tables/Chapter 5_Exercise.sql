USE sakila;

-- Exercise 1

SELECT c.first_name, c.last_name, a.address, ct.city 
FROM customer c
	INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
WHERE a.district = 'California';

-- Exercise 2 

SELECT f.film_id, f.title, a.first_name
FROM actor AS a
	INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
    INNER JOIN film AS f
    ON fa.film_id = f.film_id
WHERE a.first_name = 'JOHN'
ORDER BY f.title;

-- Exercise 3

SELECT a1.address, a2.address, a1.city_id
	FROM address a1
    INNER JOIN address a2
    ON a1.city_id = a2.city_id
    WHERE a1.address != a2.address -- this clause eliminates entries where the row is joining itself due to same city_id in a1 & a2
    GROUP BY a1.city_id -- keeps only one entry for each city_id otherwise, a1 & a2 get swapped and are present twice in the result set
    ORDER BY a1.city_id;
    