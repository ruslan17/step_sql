CREATE USER step_user WITH PASSWORD 'admin1';

GRANT ALL PRIVILEGES ON DATABASE step_db TO step_user;


-- ----------------------------------------------
CREATE table test(
  id SERIAL PRIMARY KEY,
  name TEXT
);

BEGIN;
UPDATE users SET name = 'Dan55' WHERE id = 101;
SAVEPOINT my_save;
UPDATE users SET name = 'Dan55' WHERE id = 102;
ROLLBACK TO my_save;
UPDATE users SET name = 'Dan55' WHERE id = 103;
COMMIT;