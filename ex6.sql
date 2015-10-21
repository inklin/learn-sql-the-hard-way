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

SELECT pet.id, pet.name, pet.age, pet.dead
  FROM pet, person_pet, person
  WHERE
  pet.id = person_pet.pet_id AND
  person_pet.person_id = person.id AND
  person.id = 1;