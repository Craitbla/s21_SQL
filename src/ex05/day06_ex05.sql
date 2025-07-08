COMMENT ON TABLE person_discounts IS 'The table contains the discount for each person in each pizzeria where he ordered';
COMMENT ON COLUMN person_discounts.id IS 'Unique id for this table, primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Id of the person for whom the discount is calculated';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria id for which the discount is calculated';
COMMENT ON COLUMN person_discounts.discount IS 'Calculated discount';