SELECT address, p2.name, COUNT(*) FROM person_order
    INNER JOIN public.person p on p.id = person_order.person_id
    INNER JOIN public.menu m on m.id = person_order.menu_id
INNER JOIN public.pizzeria p2 on p2.id = m.pizzeria_id
GROUP BY address,  p2.name
ORDER BY 1, 2