SELECT
    object_name
FROM
    (
        SELECT
            name as object_name,
            1 as col_for_sort
        FROM
            person
        UNION ALL
        SELECT
            pizza_name as object_name,
            2 as col_for_sort
        FROM
            menu
        ORDER BY
            col_for_sort
    ) sorted
ORDER BY object_name