WITH ordered_f AS (
    SELECT
        pizzeria.name
    FROM
        person_visits
            INNER JOIN person ON person.id = person_visits.person_id
            INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE
            person.gender = 'female'
),
     ordered_m AS (
         SELECT
             pizzeria.name
         FROM
             person_visits
                 INNER JOIN person ON person.id = person_visits.person_id
                 INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
         WHERE
                 person.gender = 'male'
     ) (
    SELECT
        *
    FROM
        ordered_m
    EXCEPT
        ALL
    SELECT
        *
    FROM
        ordered_f
)
UNION ALL
(
    SELECT
        *
    FROM
        ordered_f
    EXCEPT
        ALL
    SELECT
        *
    FROM
        ordered_m
)
ORDER BY
    1

