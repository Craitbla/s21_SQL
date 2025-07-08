SELECT
    menu.id as menu_id
FROM person_order
         RIGHT JOIN menu ON menu_id = menu.id
WHERE menu_id IS NULL
ORDER BY 1