CREATE DATABASE step_db;
CREATE USER step_user WITH PASSWORD 'admin';
GRANT ALL PRIVILEGES ON DATABASE step_db TO step_user;

-- В консоли текущей базы:
-- GRANT SELECT, UPDATE , INSERT , DELETE
-- ON ALL TABLES IN SCHEMA public
-- TO step_user;
--
-- GRANT ALL PRIVILEGES
-- ON ALL TABLES IN SCHEMA public
-- TO step_user;


------------------------------------

INSERT INTO users(name, surname, gender)
VALUES (?, ?, ?);

---------------------------

CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  person_id INTEGER REFERENCES persons(id) ON DELETE CASCADE
  --   person_id INTEGER REFERENCES persons(id) ON DELETE SET DEFAULT
  --   person_id INTEGER REFERENCES persons(id) ON DELETE SET RESTRICT
  --   person_id INTEGER REFERENCES persons(id) ON DELETE SET NULL
);

