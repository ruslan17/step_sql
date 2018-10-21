CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  address_id INTEGER
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  person_id INTEGER
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE orders_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER,
  item_id INTEGER
);

CREATE TABLE address (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- ------------
CREATE TABLE persons (
  id INT,
  mother_id INT REFERENCES persons(id),
  father_id INT REFERENCES persons(id)
);
-- ------------

-- ANY
SELECT *
FROM persons
WHERE id  = ANY (select id from address);

-- ALL
SELECT *
FROM persons
WHERE id > ALL (select id from address);

-- ----------------------------


CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  department_id INT
);

CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);


-- INNER JOIN.
SELECT e.name, d.name
FROM employees e
  INNER JOIN departments d ON e.department_id = d.id;

SELECT e.name, d.name
FROM employees e, departments d
WHERE e.department_id = d.id;

-- OUTER JOIN
-- left
SELECT e.name, d.name
FROM employees e
  LEFT OUTER JOIN departments d
    ON e.department_id = d.id;

-- right
SELECT e.name, d.name
FROM employees e
  RIGHT OUTER JOIN departments d
    ON e.department_id = d.id;

-- FULL JOIN (LEFT + RIGHT)
SELECT e.name, d.name
FROM employees e
  FULL JOIN departments d
    ON e.department_id = d.id;

-- CROSS JOIN.(Декартово произведение)
SELECT e.name, d.name
FROM employees e
  CROSS JOIN departments d;

SELECT e.name, d.name
FROM employees e, departments d;

-- INDEX
-- CREATE INDEX id_p ON persons(id);

