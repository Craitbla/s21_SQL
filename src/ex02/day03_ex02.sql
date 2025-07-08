WITH not_ordered AS (
    SELECT
        pizza_name, price, pizzeria_id
    FROM person_order
             RIGHT JOIN menu ON menu_id = menu.id
    WHERE menu_id IS NULL
    ORDER BY 1
     )

SELECT
    pizza_name, price, pizzeria.name
FROM not_ordered
         INNER JOIN pizzeria ON not_ordered.pizzeria_id = pizzeria.id
ORDER BY 1, 2

