create table base
( point1 CHAR(1),
  point2 CHAR(1),
  cost INT
);

insert into base values ('a', 'b', 10);
insert into base values ('a', 'c', 15);
insert into base values ('a', 'd', 20);
insert into base values ('b', 'a', 10);
insert into base values ('b', 'c', 35);
insert into base values ('b', 'd', 25);
insert into base values ('c', 'a', 15);
insert into base values ('c', 'b', 35);
insert into base values ('c', 'd', 30);
insert into base values ('d', 'a', 20);
insert into base values ('d', 'b', 25);
insert into base values ('d', 'c', 30);

WITH RECURSIVE path (point1, point2, cost, total_cost) AS(
    SELECT
        point1,
        point2,
        cost,
        cost as total_cost,
        ARRAY [b1.point1, b1.point2] :: varchar [] as way
    FROM
        base b1
    WHERE
            point1 = 'a'
    UNION
    SELECT
        b2.point1,
        b2.point2,
        b2.cost,
        p.total_cost + b2.cost,
        way || ARRAY [b2.point2] :: varchar []
    FROM
        base b2
            JOIN path as p ON p.point2 = b2.point1
            AND b2.point2 <> ALL (way)
)
SELECT
        total_cost + base.cost as total_cost,
        way || ARRAY ['a'] :: varchar [] as tour
FROM
    path
        INNER JOIN base ON base.point1 = way [4]
WHERE
        base.point2 = 'a'
ORDER BY 1, 2;