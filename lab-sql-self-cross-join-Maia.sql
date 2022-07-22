-- Get all pairs of actors that worked together.
select a.actor_id as actor1, b.actor_id as actor2 
from sakila.film_actor a
join sakila.film_actor b
where a.actor_id <> b.actor_id
and a.film_id = b.film_id;

-- Get all pairs of customers that have rented the same film more than 3 times.

select a.customer_id as customer1, b.customer_id as customer2, count(a.inventory_id) as counting
from sakila.rental a
join sakila.rental b 	
where a.customer_id <> b.customer_id
and a.inventory_id = b.inventory_id
group by a.customer_id, b.customer_id
having counting > 3;

-- Get all possible pairs of actors and films.
select a.first_name, a.last_name, b.title as title
from sakila.actor a
cross join sakila.film b;