CREATE INDEX idx_person_name
    ON person (UPPER(name));

SELECT * FROM pg_indexes WHERE
        tablename = 'person';

SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT * FROM person WHERE UPPER(name) = 'ANNA';
SET enable_seqscan = ON;

DROP INDEX idx_person_name;