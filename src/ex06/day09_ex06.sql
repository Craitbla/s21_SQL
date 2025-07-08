CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08'
) RETURNS SETOF varchar AS $$ BEGIN RETURN QUERY
SELECT
    pizzeria.name as pizzeria_name
FROM
    (
        SELECT
            menu.pizzeria_id,
            price
        FROM
            menu
                INNER JOIN (
                SELECT
                    pizzeria_id
                FROM
                    person_visits
                        INNER JOIN (
                        SELECT
                            *
                        FROM
                            person
                        WHERE
                                name = pperson
                    ) as per_Dmitriy ON per_Dmitriy.id = person_visits.person_id
                WHERE
                        visit_date = pdate
            ) as per_vis_pizz_ids ON per_vis_pizz_ids.pizzeria_id = menu.pizzeria_id
    ) as pizza_prises_of_pizzeria
        INNER JOIN pizzeria ON pizza_prises_of_pizzeria.pizzeria_id = pizzeria.id
WHERE
        price < pprice;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

DROP FUNCTION fnc_person_visits_and_eats_on_date CASCADE;