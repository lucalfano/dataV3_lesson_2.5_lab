use sakila;
-- lab 2.5
-- 1 Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor where (first_name = 'Scarlett');

-- 2 How many films (movies) are available for rent and how many films have been rented?
select * from sakila.rental;
select count(film_id) from sakila.film;
select count(rental_id) from sakila.rental;

-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as 'max_duration', min(length) as 'min_duration' from sakila.film;

-- 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(ROUND(AVG(length)*60,0)) from Sakila.film;

-- 5 How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)?
select * from sakila.rental;
select min(rental_date), max(rental_date) from sakila.rental;
select max(rental_date) from sakila.rental;
select datediff(max(rental_date), min(rental_date)) from sakila.rental;
select datediff(max(last_update), min(rental_date)) from sakila.rental;
-- time between earliest rental and most recent update, 275 days 

-- 7 Show rental info with additional columns month and weekday. Get 20 results.
select *, date_format(convert(left(rental_date,10),date),'%M') as 'month', date_format(convert(left(rental_date,10),date),'%D') as 'day' from sakila.rental
limit 20; -- 

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
case
WHEN DAYOFWEEK(rental_date) in (1,2,3,4,5) then 'weekday'
WHEN DAYOFWEEK(rental_date) in (6,7) then 'weekend'
END AS day_type FROM rental;

-- 9 Get release years.
select release_year from sakila.film;

-- 10 Get all films with ARMAGEDDON in the title.
select title
from sakila.film
where title like '%ARMAGEDDON%';

-- 11 Get all films which title ends with APOLLO.
select title
from sakila.film
where title like '%APOLLO%';

-- 12 Get 10 the longest films.
select length from sakila.film
order by length desc
limit 10; -- longest is 185 mins

-- 13 How many films include Behind the Scenes content?
select distinct(special_features) from sakila.film;
SELECT COUNT(DISTINCT IF(special_features LIKE '%Behind the Scenes%', film_id, NULL)) AS 'Behind_the_Scenes' FROM sakila.film;
-- 538 films with behind the scenes 