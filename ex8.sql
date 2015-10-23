DELETE FROM pet WHERE id IN (
  /* Sub-select or sub-query to find pets owned by Zed */
  /* This returns a table of pet ids */
  SELECT pet.id
  FROM pet, person_pet, person
  WHERE
  person.id = person_pet.person_id AND
  pet.id = person_pet.pet_id AND
  person.first_name = "Zed"
);

SELECT * FROM pet;
SELECT * FROM person_pet;

/* We delete the extra rows in person_pet for pets
 that are no longer in the pet table */
DELETE FROM person_pet
  WHERE pet_id NOT IN (
    SELECT id FROM pet
  );

SELECT * FROM person_pet;

/* Add some more pets into the pet table*/
INSERT INTO pet(id, name, breed, age, dead)
  VALUES(0, 'Paws', 'Husky', 3, 1);

INSERT INTO pet(id, name, breed, age, dead)
  VALUES(1, 'Jaws', 'Shark', 15, 0);

/* Make the two pets mine */
INSERT INTO person_pet(person_id, pet_id)
  VALUES(1, 0);

INSERT INTO person_pet(person_id, pet_id)
  VALUES(1, 1);

/* Show all the pets I own */
SELECT pet.id, pet.name, pet.dead
  FROM pet, person_pet, person
  WHERE 
  pet.id = person_pet.pet_id AND
  person.id = person_pet.person_id AND
  person.first_name = "Stacey";


DELETE FROM pet WHERE id IN (
  SELECT pet.id
  FROM pet, person_pet, person
  WHERE 
  pet.id = person_pet.pet_id AND
  person.id = person_pet.person_id AND
  person.first_name = "Stacey" AND
  pet.dead = 1
);

SELECT * FROM pet;

DELETE FROM person_pet
  WHERE pet_id NOT IN (
    SELECT id FROM pet
  );

INSERT INTO pet(id, name, breed, age, dead)
  VALUES(0, 'Mr. Whiskers', 'Tabby Cat', 3, 1);

INSERT INTO person(id, first_name, last_name, age)
  VALUES(2, 'Charlie', 'Brown', 10);

INSERT INTO person_pet(person_id, pet_id)
  VALUES(2, 0);

SELECT person.id, person.first_name FROM person;

DELETE FROM person WHERE ID IN (
SELECT person.id
  FROM person, person_pet, pet
  WHERE
  person.id = person_pet.person_id AND
  pet.id = person_pet.pet_id AND
  pet.dead = 1
);

SELECT person.id, person.first_name FROM person;

DELETE FROM person_pet
  WHERE person_id NOT IN (
    SELECT id from person
  );

INSERT INTO pet(id, name, breed, age, dead)
  VALUES(3, 'Mr. Jingles', 'mouse', 100, 1);

INSERT INTO person_pet(person_id, pet_id)
  VALUES(1, 3);
  
SELECT * FROM pet;
SELECT * FROM person_pet;

DELETE FROM person_pet WHERE person_pet.pet_id IN (
  SELECT pet.id
  FROM pet, person_pet
  WHERE 
  pet.id = person_pet.pet_id AND
  pet.dead = 1
);

SELECT * FROM pet;
SELECT * FROM person_pet;
