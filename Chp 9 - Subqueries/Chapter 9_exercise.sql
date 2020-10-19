USE sakila;

-- Filter all film titles falling under action category

-- Non-correlated query
SELECT f.title 
FROM film as f
WHERE f.film_id IN 
(SELECT fc.film_id
FROM film_category AS fc
INNER JOIN category AS c
ON fc.category_id = c.category_id
WHERE c.name = 'Action');


-- Exercise 3
SELECT act_film_cnt.actor_id, CONCAT(a.first_name," ",a.last_name) AS actor_name, act_film_cnt.num_films, act_groups.levels
FROM 
(SELECT 'Hollywood Star' levels, 30 min_roles, 99999 max_roles
UNION ALL 
SELECT 'Prolific actor' levels, 20 min_roles, 29 max_roles
UNION ALL 
SELECT 'Newcomer' levels, 1 min_roles, 19 max_roles) AS act_groups
INNER JOIN 
(SELECT fa.actor_id, COUNT(fa.actor_id) AS num_films
FROM film_actor AS fa
GROUP BY fa.actor_id) AS act_film_cnt
ON act_film_cnt.num_films BETWEEN act_groups.min_roles AND act_groups.max_roles
INNER JOIN actor AS a 
ON act_film_cnt.actor_id = a.actor_id
ORDER BY act_film_cnt.num_films DESC;
