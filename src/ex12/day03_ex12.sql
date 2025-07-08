INSERT INTO
  person_order(id, person_id, menu_id, order_date)

SELECT
        gen_t.gen_t + (SELECT
                         MAX(person_order.id)
                     FROM
                         person_order) as id,
    person.id as person_id,
  (
    SELECT
      id
    FROM
      menu
    WHERE
      pizza_name = 'greek pizza'
  ) as menu_id,
  '2022-02-25' as order_date
FROM person INNER JOIN generate_series (
        1,
        (
            SELECT
                COUNT(*)
            FROM
                person
        )
    ) as gen_t ON person.id = gen_t.gen_t