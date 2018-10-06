public class Main {

    /**
     *
     * psql -U postgres
     *
     *
     * CREATE TABLE users (
     * --   Уникальнольность поля
     * --   id INTEGER UNIQUE NOT NULL,
     * --   id INTEGER PRIMARY KEY DEFAULT nextval('next_id'),
     *   id SERIAL PRIMARY KEY,
     *   name VARCHAR(100),
     *   surname VARCHAR(100),
     * --   gender CHAR(1) DEFAULT 'M'
     *   gender BOOLEAN DEFAULT true
     * --
     * --   UNIQUE (name, surname),
     * --   PRIMARY KEY (name, surname)
     *
     * );
     *
     * CREATE SEQUENCE next_id START 1;
     *
     * DROP TABLE IF EXISTS users;
     *
     */

}