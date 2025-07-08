--Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

--Session #1
UPDATE pizzeria
SET rating = 1
WHERE id = 1;

--Session #2
UPDATE pizzeria
SET rating = 2
WHERE id = 2;

--Session #1
UPDATE pizzeria
SET rating = 2.2
WHERE id = 2;

--Session #2
UPDATE pizzeria
SET rating = 1.3
WHERE id = 1;

--Session #1
COMMIT;

--Session #2
COMMIT;

--Session #1
SELECT * FROM pizzeria WHERE id  IN (1,2);