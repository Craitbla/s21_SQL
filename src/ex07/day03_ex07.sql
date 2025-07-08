INSERT INTO menu SELECT MAX(menu.id) + 1, 2, 'greek pizza', 800 FROM menu;
