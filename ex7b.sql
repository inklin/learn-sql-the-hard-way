DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  age INTEGER
);

CREATE TABLE pet (
  id INTEGER PRIMARY KEY,
  name TEXT,
  breed TEXT,
  age INTEGER,
  dead INTEGER
);

CREATE TABLE person_pet (
  person_id INTEGER,
  pet_id INTEGER
);

INSERT INTO person(id, first_name, last_name, age)
  VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet(id, name, breed, age, dead)
  VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);

INSERT INTO person(id, first_name, last_name, age)
  VALUES (1, "Stacey", "Lin", 29);

INSERT INTO pet(id, name, breed, age, dead)
  VALUES (2, "Drogon", "Dragon", 5, 0);

INSERT INTO person_pet (person_id, pet_id)
  VALUES (0, 0);

INSERT INTO person_pet VALUES(0, 1);

INSERT INTO person_pet (person_id, pet_id)
  VALUES (1, 2);

/* Select all colums from person, pet */
SELECT * FROM person;
SELECT * FROM pet;
/* Select name and age columns from pet */
SELECT name, age FROM pet;
/* Select name and age columns for pets that are not dead */
SELECT name, age FROM pet WHERE dead = 0;
/* Select all the columns for the rows in person where
the first_name is not Zed */
SELECT * FROM person WHERE first_name != "Zed";

/* Find all pets older than 10 years in age */
SELECT * FROM pet WHERE age > 10;
/* Find all people younger than myself */
SELECT * FROM person WHERE age < 29;
/* Write a query that uses more than one test */
SELECT * FROM pet WHERE age < 1000 AND breed != "Dragon";
/* Write a query that searches 3 columns */
SELECT * FROM person WHERE first_name = "Stacey" 
  OR (first_name = "Zed" AND age = 29);

/* Select the pet columns */
SELECT pet.id, pet.name, pet.age, pet.dead
  /* select from all three tables */
  FROM pet, person_pet, person
  WHERE
  /* Connect the pet table with the person_pet table */
  pet.id = person_pet.pet_id AND
  /* connect the person pet table with the person table */
  person_pet.person_id = person.id AND
  /* where that person's name is Zed */
  person.first_name = "Zed";

/* Select all the pets owned by person with id 1 */
SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet, person_pet, person
  WHERE
  pet.id = person_pet.pet_id AND
  person_pet.person_id = person.id AND
  person.id = 1;

/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;
/* delete the dead pets */
DELETE FROM pet WHERE dead = 1;
/* make sure the robot is gone */
SELECT * FROM pet;
/* let's resurrect the robot */
INSERT INTO pet(id, name, breed, age, dead)
  VALUES(1, "Gigantor", "Robot", 1, 0);
/* the robot LIVES! */
SELECT * FROM pet;

/* Check to see there are pets over or a thousand years old */
SELECT name, age FROM pet WHERE age >= 1000;
DELETE FROM pet WHERE age >= 1000;
/* check to see what pets are left */
SELECT * FROM pet;
INSERT INTO pet(id, name, breed, age, dead)
  VALUES(0, "Fluffy", "Unicorn", 1500, 0);
/* look to see the unicorn is back and older */
SELECT * FROM pet;
