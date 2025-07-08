SELECT person.name, COUNT(*) as count_of_visits
FROM person_visits INNER JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
HAVING COUNT(*) > 3
ORDER BY count_of_visits DESC, person.name