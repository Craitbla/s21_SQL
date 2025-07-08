SELECT p.name, COUNT(*) as count_of_visits
FROM person_visits INNER JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name
LIMIT 4