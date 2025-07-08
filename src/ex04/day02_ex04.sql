SELECT pizza_name, pizzeria.name as pizzeria_name, price
FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name in ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2