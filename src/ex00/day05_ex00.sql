CREATE INDEX idx_menu_pizzeria_id
    ON menu (pizzeria_id);

CREATE INDEX idx_person_order_person_id
    ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id
    ON person_order (menu_id);

CREATE INDEX idx_person_visits_person_id
    ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id
    ON person_visits (pizzeria_id);

SELECT * FROM pg_indexes WHERE
        tablename = 'menu' OR
        tablename = 'person' OR
        tablename = 'person_order' OR
        tablename = 'person_visits' OR
        tablename = 'pizzeria';

DROP INDEX idx_menu_pizzeria_id;
DROP INDEX idx_person_order_person_id;
DROP INDEX idx_person_order_menu_id;
DROP INDEX idx_person_visits_person_id;
DROP INDEX idx_person_visits_pizzeria_id;