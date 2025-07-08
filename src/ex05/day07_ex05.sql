SELECT DISTINCT  person.name
FROM person_visits INNER JOIN person ON person_visits.person_id = person.id
ORDER BY 1
