WITH tab1 AS (SELECT address,
                ROUND((MAX(age)-(MIN(age)::numeric/MAX(age))), 2) as formula,
                ROUND(AVG(age), 2) as average
FROM person
GROUP BY address)

SELECT *,    CASE WHEN formula>average then TRUE
            ELSE FALSE END as comparison
FROM tab1
ORDER BY 1
