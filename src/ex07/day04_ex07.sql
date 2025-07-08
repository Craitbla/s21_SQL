WITH cheap_pizzerias AS (SELECT pizzeria_id
                          FROM menu
                                   INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                          WHERE price < 800
                            AND (NOT pizzeria.name = 'Papa Johns')
                          LIMIT 1
)
INSERT INTO
    person_visits(id, person_id, pizzeria_id, visit_date)
values
    (
        (
            SELECT
                    MAX(person_visits.id) + 1
            FROM
                person_visits
        ),
        (
            SELECT
                id
            FROM
                person
            WHERE
                    name = 'Dmitriy'
        ), (SELECT pizzeria_id FROM cheap_pizzerias), '2022-01-08'
    );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
