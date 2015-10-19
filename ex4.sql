/* Explicit entry */
INSERT INTO person_pet (person_id, pet_id)
  VALUES (0, 0);

/* Implicit entry */
INSERT INTO person_pet VALUES(0, 1);

/* Add a person-pet relation for myself */
INSERT INTO person_pet (person_id, pet_id)
  VALUES (1, 2);