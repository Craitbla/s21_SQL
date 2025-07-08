WITH
    pizzerias_ids AS (SELECT m1.pizza_name,
                             m1.pizzeria_id as p_id1,
                             m2.pizzeria_id as p_id2,
                             m1.price
                      FROM menu as m1
                               INNER JOIN menu as m2 ON m1.pizza_name = m2.pizza_name
                      WHERE NOT m1.id = m2.id
                        AND m1.price = m2.price
                        AND m1.pizzeria_id > m2.pizzeria_id)

SELECT t1.pizza_name as pizza_name, pizzeria_name_1, pizzeria_name_2, price
    FROM
(SELECT pizza_name, name as pizzeria_name_1
FROM pizzerias_ids
INNER JOIN pizzeria ON pizzeria.id = pizzerias_ids.p_id1) as t1
FULL JOIN
(SELECT pizza_name, name as pizzeria_name_2, price
 FROM pizzerias_ids
          INNER JOIN pizzeria ON pizzeria.id = pizzerias_ids.p_id2) as t2 ON t1.pizza_name = t2.pizza_name
ORDER BY 1

