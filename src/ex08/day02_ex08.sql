WITH nec_menu_ids AS (
    SELECT
        id
    FROM
        menu
    WHERE
            pizza_name IN ('mushroom pizza', 'pepperoni pizza')
),
     nec_per_ids_from_ord AS (
         SELECT
             person_id
         FROM
             person_order
                 INNER JOIN nec_menu_ids ON menu_id = nec_menu_ids.id
     ),
     nec_persons AS (
         SELECT
             name, id
         FROM
             person
         WHERE address IN ('Moscow', 'Samara') AND gender = 'male'
     )
SELECT
    name
FROM
    nec_persons
        INNER JOIN nec_per_ids_from_ord ON nec_per_ids_from_ord.person_id = nec_persons.id
ORDER BY 1 DESC