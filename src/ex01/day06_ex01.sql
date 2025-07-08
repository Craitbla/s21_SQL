WITH per_and_pizz_or AS(
    SELECT
        person_id as per_id,
        menu.pizzeria_id as pizzer_id
    FROM
        person_order
            INNER JOIN menu ON person_order.menu_id = menu.id
    ORDER BY
        1
),
     per_and_pizzerias AS(
         SELECT
             per_id as per,
             pizzer_id as pizzer
         FROM
             per_and_pizz_or
         GROUP BY
             per_id,
             pizzer_id
     )
INSERT INTO
    person_discounts(id, person_id, pizzeria_id, discount)
SELECT
            ROW_NUMBER() OVER (
        ORDER BY
            per_and_pizzerias.per
        ),
            per,
            pizzer,
            CASE
                WHEN (
                         SELECT
                             COUNT(per_and_pizz_or.per_id)
                         FROM
                             per_and_pizz_or
                         WHERE
                                 per_id = per
                           AND pizzer_id = pizzer
                     ) = 1 THEN 10.5 --k
                WHEN (
                         SELECT
                             COUNT(per_and_pizz_or.per_id)
                         FROM
                             per_and_pizz_or
                         WHERE
                                 per_id = per
                           AND pizzer_id = pizzer
                     ) = 2 THEN 22
                ELSE 30
                END
FROM
    per_and_pizzerias;