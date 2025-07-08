CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, (price - price*0.1)::int as discount_price
    FROM person_order
        INNER JOIN person ON person.id = person_order.person_id
        INNER JOIN menu ON person_order.menu_id = menu.id
ORDER BY 1, 2;

SELECT *
FROM v_price_with_discount