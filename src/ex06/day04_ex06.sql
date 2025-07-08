CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH per_vis_pizz_ids AS (
    SELECT
        pizzeria_id
    FROM
        person_visits
            INNER JOIN (
            SELECT
                *
            FROM
                person
            WHERE
                    name = 'Dmitriy'
        ) as per_Dmitriy ON per_Dmitriy.id = person_visits.person_id
    WHERE
            visit_date = '2022-01-08'
),
     pizza_prises_of_pizzeria AS (
         SELECT
             menu.pizzeria_id,
             price
         FROM
             menu
                 INNER JOIN per_vis_pizz_ids ON per_vis_pizz_ids.pizzeria_id = menu.pizzeria_id
     ),
     D_pizzeria AS (
         SELECT
             DISTINCT pizzeria.name as pizzeria_name
         FROM
             pizza_prises_of_pizzeria
                 INNER JOIN pizzeria ON pizza_prises_of_pizzeria.pizzeria_id = pizzeria.id
         WHERE
                 price < 800
     )
SELECT *
FROM D_pizzeria
;

SELECT *
FROM mv_dmitriy_visits_and_eats

