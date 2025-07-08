create table person_audit
( created timestamp with time zone DEFAULT now() not null,
  type_event char(1) default 'I' not null,
  CONSTRAINT ch_type_event CHECK (type_event IN ('I','U','D')),
  row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
