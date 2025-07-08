CREATE FUNCTION fnc_fibonacci(pstop bigint DEFAULT 10)
    RETURNS SETOF bigint AS $$
DECLARE
    el1 int := 0;
    el2 int := 1;
    sum bigint := 0;
    counter bigint := pstop;
    subsequence bigint[] = ARRAY[el1, el2];
BEGIN
    WHILE (counter > sum)
        LOOP
            sum = el1 +el2;
            el1 = el2;
            el2 = sum;
            subsequence := subsequence || sum;
        END LOOP;
    subsequence := subsequence[1:(array_length(subsequence, 1)-1)];
    RETURN QUERY SELECT * FROM unnest(subsequence);
END
$$ LANGUAGE 'plpgsql';

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

--DROP FUNCTION fnc_fibonacci CASCADE;
