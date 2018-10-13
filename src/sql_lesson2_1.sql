-- IN

SELECT *
FROM countries
WHERE budget IN (100, 400);

-- Тоже самое
SELECT *
FROM countries
WHERE budget = 100 OR budget = 400;

-- Вложенный запрос
SELECT *
FROM companies_profit
WHERE money_turnover IN (
  SELECT budget FROM countries
);

-- BETWEEN
SELECT *
FROM countries
WHERE budget BETWEEN 50 AND 500;

-- LIMIT (Использовать с ORDER BY)
SELECT *
FROM countries
LIMIT 2 ;

-- NOT
SELECT *
FROM countries
WHERE budget NOT IN (100, 400);

-- LIKE
SELECT *
FROM countries
WHERE name LIKE 'AZ';

SELECT *
FROM countries
WHERE name LIKE '%AZ%';

-- Поиск стран с первым словом из 3х букв
SELECT *
FROM countries
WHERE name LIKE '____%';

--
SELECT *
FROM countries
WHERE name SIMILAR TO '[a-z]%';
--
SELECT *
FROM countries
WHERE name SIMILAR TO '[^a-c]%';
--

-- GROUP BY
SELECT name, SUM(money_turnover)
FROM companies_profit
GROUP BY name;

-- HAVING
SELECT name, SUM(money_turnover)
FROM companies_profit
GROUP BY name
HAVING SUM(money_turnover) > 300;


-- АГРЕГАТНЫЕ ФУНКЦИИ:

-- COUNT
-- Привязка к столбцу(null не учитывается)
SELECT COUNT(name) FROM countries WHERE budget < 150;

-- Привязка к записи в таблице
SELECT COUNT(*) FROM countries WHERE budget < 150;

-- AVG
SELECT AVG(budget) FROM countries;

-- MIN
SELECT MIN(budget) FROM countries;

-- MAX
SELECT MAX(budget) FROM countries;

-- SUM
-- SUM ( [ALL | DISTINCT] expression )

SELECT SUM(budget) FROM countries;

SELECT SUM(DISTINCT budget) FROM countries;

-- NOW
SELECT name, NOW() FROM countries;

-- UPPER
SELECT UPPER(name) FROM countries;

-- LOWER
SELECT LOWER(name) FROM countries;

-- LENGTH
SELECT LENGTH(name) FROM countries;

-- UNION [ALL]
SELECT name FROM companies_profit
  UNION
SELECT name FROM countries;

-- DZ: 7, 8, 13, 15, 18, 19, 20, 21, 22, 26, 27, 28
--   :14, 25,


-- UPDATE
UPDATE countries
SET name = 'UK', budget = 150
WHERE id = 6;
















