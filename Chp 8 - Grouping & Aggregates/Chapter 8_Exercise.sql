USE sakila;

-- Exercise 1
SELECT COUNT(*)
FROM payment;

-- Exercise 2
SELECT customer_id, COUNT(*) as num_payments, SUM(amount) as total_payment
FROM payment
GROUP BY customer_id;

-- Exercise 3
SELECT customer_id, COUNT(*) as num_payments, SUM(amount) as total_payment
FROM payment
GROUP BY customer_id
HAVING COUNT(*)>=5;