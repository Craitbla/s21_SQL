SELECT
    COALESCE(person.name, '-') AS person_name, visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
            --person.name, visit_date, pizzeria.name
FROM
    (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01'
                                           AND '2022-01-03') as pv
        FULL JOIN person
                  ON person.id = pv.person_id
        FULL JOIN pizzeria
                  ON pv.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3

