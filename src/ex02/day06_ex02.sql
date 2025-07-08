SELECT p.name, m.pizza_name, price, (price-price*0.01*discount), p2.name
FROM person_order
INNER JOIN public.menu m on m.id = person_order.menu_id
INNER JOIN person_discounts USING(pizzeria_id, person_id)
INNER JOIN person p on p.id = person_order.person_id
INNER JOIN public.pizzeria p2 on m.pizzeria_id = p2.id
ORDER BY 1,2