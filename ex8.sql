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