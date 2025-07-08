WITH p_o_count AS (
    SELECT pizzeria.name, COUNT(*) as count, 'order' as action_type
    FROM person_order INNER JOIN menu on menu.id = person_order.menu_id
                      INNER  JOIN pizzeria on pizzeria.id = menu.pizzeria_id

    GROUP BY pizzeria.name
    ORDER BY count DESC
),
p_v_count AS (
    SELECT pizzeria.name, COUNT(*) as count, 'visit' as action_type
    FROM person_visits
             INNER JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY count DESC
)
SELECT name, COALESCE(p_v_count.count, 0) + COALESCE(p_o_count.count, 0) as total_count
FROM p_o_count FULL JOIN p_v_count USING(name)
ORDER BY 2 DESC, 1 ASC
