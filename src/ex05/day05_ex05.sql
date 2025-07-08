CREATE UNIQUE INDEX idx_person_order_order_date
    ON person_order (person_id, menu_id)
    WHERE order_date = '2022-01-01';

SELECT * FROM pg_indexes WHERE
        tablename = 'person_order';

SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
                    SELECT person_id
                    FROM person_order
                    WHERE order_date = '2022-01-01'
                );
SET enable_seqscan = ON;


DROP INDEX idx_person_order_order_date;