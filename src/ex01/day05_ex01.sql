SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT pizza_name, pizzeria.name
                FROM menu INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
SET enable_seqscan = ON;