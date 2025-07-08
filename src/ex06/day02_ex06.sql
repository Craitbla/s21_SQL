WITH per_id_D_and_A AS (
    SELECT
        *
    FROM
        person
    WHERE
            name IN ('Denis', 'Anna')
),
     menu_id_from_po_D_and_A AS (
         SELECT
             menu_id
         FROM
             person_order
                 INNER JOIN per_id_D_and_A ON per_id_D_and_A.id = person_order.person_id
     ),
     menu_for_D_and_A AS (
         SELECT
             pizza_name,
             pizzeria_id
         FROM
             menu
                 INNER JOIN menu_id_from_po_D_and_A ON menu_id_from_po_D_and_A.menu_id = menu.id
     )
SELECT
    pizza_name,
    pizzeria.name
FROM
    menu_for_D_and_A
        INNER JOIN pizzeria ON menu_for_D_and_A.pizzeria_id = pizzeria.id
ORDER BY
    1,
    2