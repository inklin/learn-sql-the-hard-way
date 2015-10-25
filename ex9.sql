UPDATE person SET first_name = "Hilarious Guy"
  WHERE first_name = "Zed";

UPDATE pet SET name = "Fancy Pants"
  WHERE id=0;

SELECT * FROM person;
SELECT * FROM pet;

UPDATE person SET first_name = "Zed"
  WHERE person.id = 0;

UPDATE pet SET dead = 1
  WHERE pet.name = "Drogon";

SELECT * FROM pet;

UPDATE pet SET name = "DECEASED"
  WHERE pet.dead = 1;

SELECT * FROM pet;

UPDATE pet SET name = "Young One" WHERE pet.name IN (
  SELECT pet.name FROM pet
  WHERE pet.age < 10
);

SELECT * FROM pet;