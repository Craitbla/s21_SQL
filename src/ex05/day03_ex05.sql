WITH
    A_visits AS (SELECT pizzeria.name as pizzerias_vis
                    FROM person_visits
                             INNER JOIN person ON person_visits.person_id = person.id
                             INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
                    WHERE person.name = 'Andrey'),
    A_ordered AS (
        SELECT
            DISTINCT pizzeria.name as pizzerias_ord
        FROM person_order
                 INNER JOIN person ON person_id = person.id
            INNER JOIN menu ON person_order.menu_id = menu.id
                INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        WHERE person.name  = 'Andrey'
)
SELECT
    pizzerias_vis as pizzeria_name
FROM A_visits
         LEFT JOIN A_ordered ON pizzerias_vis = pizzerias_ord
WHERE pizzerias_ord IS NULL
