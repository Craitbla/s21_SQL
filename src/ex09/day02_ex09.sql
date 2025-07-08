WITH ch_menu_ids AS (
    SELECT
        CASE
            WHEN pizza_name = 'cheese pizza' THEN id
            ELSE 0
            END AS ch_ids
    FROM
        menu
),
     pep_menu_ids AS (
         SELECT
             CASE
                 WHEN pizza_name = 'pepperoni pizza' THEN id
                 ELSE 0
                 END AS pep_ids
         FROM
             menu
     ),
     nec_per_ch AS (
         SELECT
             person_id
         FROM
             person_order
                 INNER JOIN ch_menu_ids ON ch_ids = person_order.menu_id
     ),
     nec_per_pep AS (
         SELECT
             person_id
         FROM
             person_order
                 INNER JOIN pep_menu_ids ON pep_ids = person_order.menu_id
     ),
     nec_persons AS (
         SELECT
             nec_per_ch.person_id
         FROM
             nec_per_ch
                 INNER JOIN nec_per_pep ON nec_per_pep.person_id = nec_per_ch.person_id
     )
SELECT
    name
FROM
    person
        INNER JOIN nec_persons ON nec_persons.person_id = person.id
WHERE
        gender = 'female'
ORDER BY
    1