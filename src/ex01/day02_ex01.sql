SELECT
    DISTINCT visit_date_1 as missing_date
FROM
    (
        SELECT
            person_visits.visit_date as visit_date_1
        FROM
            person_visits
                LEFT JOIN (
                SELECT
                    *
                FROM
                    person_visits
                WHERE
                        person_id = 1
            ) as pv_1 ON person_visits.visit_date = pv_1.visit_date
        WHERE
            pv_1.visit_date IS NULL
    )
        INNER JOIN (
        SELECT
            person_visits.visit_date as visit_date_2
        FROM
            person_visits
                LEFT JOIN (
                SELECT
                    *
                FROM
                    person_visits
                WHERE
                        person_id = 2
            ) as pv_2 ON person_visits.visit_date = pv_2.visit_date
        WHERE
            pv_2.visit_date IS NULL
    ) ON visit_date_1 = visit_date_2
WHERE
    visit_date_1 BETWEEN '2022-01-01'
        AND '2022-01-10'
ORDER BY
    missing_date;