--DROP TABLE balance CASCADE;
--DROP TABLE currency CASCADE;
--DROP TABLE "user" CASCADE;

--DROP FUNCTION fnc_close_date CASCADE;

CREATE FUNCTION fnc_close_date(bdate timestamp, bval varchar)
    RETURNS timestamp AS $$
(SELECT updated
 FROM (SELECT updated FROM currency WHERE name = bval)
 WHERE updated < bdate
 ORDER BY updated DESC
 LIMIT 1)
UNION ALL
(SELECT updated
 FROM (SELECT updated FROM currency WHERE name = bval)
 WHERE updated >= bdate
 ORDER BY updated ASC
 LIMIT 1)
LIMIT 1;
$$ LANGUAGE SQL;

SELECT
           COALESCE(u.name, '<not defined>') AS name,
           COALESCE(u.lastname, '<not defined>') AS lastname, c.name,
           user_id, c.name, money, c.updated, b.money*c.rate_to_usd
       FROM balance b
        FULL JOIN
            "user" u ON u.id = b.user_id
JOIN currency c on c.id = b.currency_id
WHERE (c.updated = fnc_close_date(b.updated, c.name))
ORDER BY 1 DESC, 2,3