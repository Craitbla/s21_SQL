(
SELECT pizzeria.name, COUNT(*) as count, 'order' as action_type
FROM person_order INNER JOIN menu on menu.id = person_order.menu_id
         INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3
)
UNION
(
SELECT pizzeria.name, COUNT(*) as count, 'visit' as action_type
 FROM person_visits
          INNER JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
 GROUP BY pizzeria.name
 ORDER BY count DESC
 LIMIT 3
 )
ORDER BY action_type ASC, count DESC
