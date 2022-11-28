-- 1. List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY last_name;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name, city, country
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most
-- transactions?

SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id IN(
    SELECT staff_id
    FROM payment
    GROUP BY staff_id
) 
ORDER BY staff_id DESC
LIMIT 1;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
)
ORDER BY last_name;


-- 8. How many free rentals did our stores give away?
 
 SELECT *
 FROM payment
 WHERE amount = 0;