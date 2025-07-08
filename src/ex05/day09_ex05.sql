DROP FUNCTION fnc_persons_female CASCADE;
DROP FUNCTION fnc_persons_male CASCADE;

CREATE FUNCTION fnc_persons(pgender text DEFAULT 'female')
    RETURNS SETOF person AS $$
SELECT * FROM person
WHERE gender IN (pgender);
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
