SELECT * FROM person;
SELECT * FROM pet;
SELECT name, age FROM pet;
SELECT name, age FROM pet WHERE dead = 0;
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