CREATE TABLE companies_profit (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100),
  year INT,
  money_turnover DECIMAL
);

CREATE TABLE countries (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100),
  budget DECIMAL
);