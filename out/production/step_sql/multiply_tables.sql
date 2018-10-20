CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  address_id INTEGER
);

-- CREATE TABLE persons (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(100),
--   address_id INTEGER REFERENCES address(id)
-- );

CREATE TABLE address (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

INSERT INTO address
    values (DEFAULT , 'Las Vegas');

INSERT INTO persons
values
  (DEFAULT, 'John', 1),
  (DEFAULT, 'Dan', 2);

SELECT p.name
from persons p, address a
where p.address_id = a.id
AND a.id = 1;

-- SELECT p.name
-- from persons p, address a
-- where a.id = 1;