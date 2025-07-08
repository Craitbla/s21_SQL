CREATE UNIQUE INDEX idx_menu_unique
    ON menu (pizzeria_id, pizza_name);

SELECT * FROM pg_indexes WHERE
        tablename = 'menu';

SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
                    SELECT *
                    FROM menu
                    WHERE pizzeria_id = 4
                );
SET enable_seqscan = ON;

DROP INDEX idx_menu_unique;