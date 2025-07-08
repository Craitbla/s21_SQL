SELECT person_order.order_date, concat(person.name, ' (age:', person.age, ')') as person_information
FROM person_order
        NATURAL INNER JOIN (SELECT
            name, age, id as person_id
            FROM person) as person
ORDER BY
    order_date,
    person_information