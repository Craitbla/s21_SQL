CREATE UNIQUE INDEX idx_person_discounts_unique
    ON person_discounts (person_id, pizzeria_id);

SELECT * FROM pg_indexes WHERE
        tablename = 'person_discounts';

SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
                    SELECT discount
                    FROM person_discounts
                    WHERE pizzeria_id = 5
                );
SET enable_seqscan = ON;

--DROP INDEX idx_person_discounts_unique;
