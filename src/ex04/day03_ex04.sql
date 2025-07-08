WITH ordered_f AS (
    SELECT
        pizzeria.name
    FROM
        person_order
            INNER JOIN person ON person.id = person_order.person_id
            INNER JOIN menu ON person_order.menu_id = menu.id
            INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE
            person.gender = 'female'
),
     ordered_m AS (
         SELECT
             pizzeria.name
         FROM
             person_order
                 INNER JOIN person ON person.id = person_order.person_id
                 INNER JOIN menu ON person_order.menu_id = menu.id
                 INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         WHERE
                 person.gender = 'male'
     ) (
    SELECT
        *
    FROM
        ordered_m
    EXCEPT
    SELECT
        *
    FROM
        ordered_f
)
UNION
(
    SELECT
        *
    FROM
        ordered_f
    EXCEPT
    SELECT
        *
    FROM
        ordered_m
)
ORDER BY
    1