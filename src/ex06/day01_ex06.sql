SELECT
    action_date,
    person.name
FROM
    (
        SELECT
            visit_date as action_date,
            person_id
        FROM
            person_visits
        INTERSECT
        SELECT
            order_date,
            person_id
        FROM
            person_order
    ) as orig
        JOIN person ON orig.person_id = person.id
ORDER BY
    action_date,
    person.name DESC