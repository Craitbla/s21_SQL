SELECT visit_date as action_date, person_id
FROM person_visits
INTERSECT
SELECT order_date, person_id
FROM person_order
ORDER BY action_date, person_id DESC