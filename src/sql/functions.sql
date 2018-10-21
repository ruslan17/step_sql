--   транзакции,
--   процедуры,
--   триггеры,
--   вьюшки

-- Процедуры(Функции)

CREATE FUNCTION insert_user(
  name    VARCHAR(100),
  surname VARCHAR(100),
  gender  BOOLEAN)
  RETURNS VOID AS
$BODY$
BEGIN
  INSERT INTO users (name, surname, gender)
  values (name, surname, gender);
END;
$BODY$
LANGUAGE 'plpgsql';

CREATE FUNCTION insert_user_2(
  name    VARCHAR(100),
  surname VARCHAR(100),
  gender  BOOLEAN)
  RETURNS VOID AS
$$
BEGIN
  IF (surname = 'Stark')
  THEN
    INSERT INTO users (name, surname, gender)
    values ('John Stark', surname, gender);
  ELSEIF (surname = 'Snow')
    THEN
      INSERT INTO users (name, surname, gender)
      values ('John Snow', surname, gender);
  END IF;
END;
$$
LANGUAGE plpgsql;

SELECT *
FROM insert_user('John', 'Snow', true);

SELECT *
FROM insert_user_2(null, 'Snow', true);

SELECT *
FROM insert_user_2(null, 'Stark', true);

-- Триггеры

CREATE FUNCTION user_stamp()
  RETURNS TRIGGER AS
$user_stamp$
BEGIN
  IF new.name IS null
  THEN
    RAISE EXCEPTION 'Name can not be null';
  END IF;
  RETURN new;
END;
$user_stamp$
LANGUAGE plpgsql;

CREATE TRIGGER user_stamp_trigger
  BEFORE INSERT OR UPDATE
  ON users
  FOR EACH ROW EXECUTE PROCEDURE user_stamp();

SELECT *
FROM insert_user('John', 'Snow', TRUE);

-- Транзакции
-- BEGIN;
-- UPDATE users SET name = 'Dan4' WHERE id = 101;
-- UPDATE users SET name = null WHERE id = 102;
-- UPDATE users SET name = 'Dan4' WHERE id = 103;
-- COMMIT;

BEGIN;
UPDATE users SET name = 'Dan55' WHERE id = 101;
SAVEPOINT my_save;
UPDATE users SET name = 'Dan55' WHERE id = 102;
ROLLBACK TO my_save;
UPDATE users SET name = 'Dan55' WHERE id = 103;
COMMIT;

CREATE table test(
  id SERIAL PRIMARY KEY,
  name TEXT
)

