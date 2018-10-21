-- DDL:
-- CREATE
CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  gender BOOLEAN DEFAULT FALSE ,
  date TIMESTAMP DEFAULT NOW()
);

-- DROP
DROP TABLE persons;
DROP TABLE IF EXISTS persons;

-- ALTER
ALTER TABLE persons
  ADD COLUMN address VARCHAR(30);
ALTER TABLE persons
  DROP COLUMN address;
ALTER TABLE persons
  RENAME COLUMN address TO city;

-- DML:
-- SELECT, INSERT, DELETE, UPDATE

-- INSERT
INSERT INTO persons
values (DEFAULT, 'John', TRUE , '2018-10-07');

INSERT INTO persons(name, gender)
values ('DAN', TRUE);

INSERT INTO persons DEFAULT VALUES;

-- DELETE:
DELETE FROM persons WHERE name = 'DAN';
DELETE FROM persons WHERE name ISNULL;

-- Удаляет все записи
DELETE FROM persons;

-- Тоже самое
TRUNCATE TABLE persons;

-- SELECT:
SELECT id, name, gender, date FROM persons;
SELECT * FROM persons;
SELECT name, gender FROM persons;
-- where
SELECT name, gender FROM persons WHERE id = 1;
-- or
SELECT id, name FROM persons WHERE id = 1 OR id = 2;

SELECT id, name
FROM persons
WHERE id = 1 OR name = 'John';
-- and
SELECT id, name
FROM persons
WHERE name = 'John' AND gender = TRUE;

-- Порядок выполнения: not, and, or
SELECT id, name
FROM persons
WHERE gender = FALSE
AND (name = 'John' OR name = 'Dan');

-- order by
-- order by column_name [ASC | DESC]
SELECT id, name
FROM persons
ORDER BY id DESC;

-- DISTINCT
SELECT DISTINCT name
FROM persons;
