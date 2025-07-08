WITH sorted_menu AS (
    SELECT pizzeria_id, pizza_name, price
    FROM
        menu
    WHERE price BETWEEN 800 AND 1000
),
     Kate_visits AS (
         SELECT
             pizzeria_id, visit_date
         FROM
             person_visits
         INNER JOIN person ON person_visits.person_id = person.id
         WHERE person.name = 'Kate'
     )

SELECT
    pizza_name, price, pizzeria.name, visit_date
FROM sorted_menu
INNER JOIN Kate_visits USING (pizzeria_id)
INNER JOIN pizzeria ON sorted_menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3