-- Chapter 2

CREATE DATABASE person_db;
USE person_db;

CREATE TABLE person 
	(
    person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    eye_color ENUM('BR','BL','GR'),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
    );

-- auto increment can also be specified while creating the table in the earlier block of code
ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
    
CREATE TABLE favorite_food
	(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id,food),
    CONSTRAINT fk_favorite_food FOREIGN KEY (person_id) REFERENCES person(person_id)
    );

DESCRIBE person;

INSERT INTO person 
	(person_id, fname, lname, eye_color, birth_date)
    VALUES (null, 'William', 'Turner','BR', '1972-05-27')
    ;

-- selecting all columns and rows from the person table
SELECT * FROM person;

-- selecting first four columns for person_id = 1
SELECT person_id, fname, lname, birth_date FROM person
WHERE person_id = 1;

-- let us now add William's top 3 favorite food items in our food table 
INSERT INTO favorite_food (person_id,food)
VALUES (1, 'pizza');

INSERT INTO favorite_food (person_id,food)
VALUES (1, 'cookies');

INSERT INTO favorite_food (person_id,food)
VALUES (1, 'nachos');

-- using an order by clause in select we will now retrieve the foods in alphabetical order
SELECT food FROM favorite_food
WHERE person_id = 1
ORDER BY food;

-- similarly let us add one more person in the first table 
INSERT INTO person 
	(person_id, fname, lname, eye_color, birth_date,
    street, city, state, country, postal_code)
    VALUES (null, 'Susan','Smith','BL','1975-11-02',
    '23 Maple St.', 'Arlington', 'VA', 'USA', 
    '20220');
    
SELECT * FROM person;

-- adding missing values for William Smith using an update statement
UPDATE person
SET street = '1225 Tremont St.',
	city = 'Boston',
	state = 'MA',
	country = 'USA',
	postal_code = '02138'
WHERE person_id = 1; -- if we leave off the where clause in an update statement then all our rows in the table will be modified

SELECT * FROM person;	

-- example of delete statement 

DELETE FROM person 
WHERE person_id = 2; -- here also if where clause is not mentioned, it will end up deleting all the rows

SELECT * FROM person;

DROP DATABASE person_db;


