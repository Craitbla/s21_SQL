WITH aggregated_balances AS (
    SELECT 
        user_id,
        type,
        currency_id,
        SUM(money) AS volume
    FROM 
        balance
    GROUP BY 
        user_id, type, currency_id
),
latest_currency AS (
    SELECT 
        c.id,
        c.name,
        c.rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY c.updated DESC) AS rn
    FROM 
        currency c
),
currency_info AS (
    SELECT 
        id,
        name,
        rate_to_usd
    FROM 
        latest_currency
    WHERE 
        rn = 1
)

SELECT 
    COALESCE(u.name, '<not defined>') AS name,
    COALESCE(u.lastname, '<not defined>') AS lastname,
    ab.type,
    ab.volume,
    COALESCE(ci.name, '<not defined>') AS currency_name,
    COALESCE(ci.rate_to_usd, 1) AS last_rate_to_usd,
    ab.volume::numeric * COALESCE(ci.rate_to_usd, 1) AS total_volume_in_usd
FROM 
    aggregated_balances ab
FULL JOIN 
    "user" u ON u.id = ab.user_id
FULL JOIN 
    currency_info ci ON ci.id = ab.currency_id
ORDER BY 
    name DESC, lastname, ab.type;

