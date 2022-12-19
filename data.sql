/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, 11);

/* Update animals PR2 */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 08, 2020', 0, false, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, true, 5.7);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 02, 1993', 3, false, 12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, true, 45);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 07, 2005', 7, true, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, true, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, true, 22);

/* Insert into owners */

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert into species */

INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

/* Insert species */

UPDATE animals SET species_id=2 where name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS null;

/* Insert owners */

UPDATE animals SET owner_id=1  where name= 'Agumon';
UPDATE animals SET owner_id=2  where name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id=3  where name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id=4  where name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id=5  where name='Angemon' OR name='Boarmon';

/* Project 4 */

/* Data to vets table */

INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'April 23, 2000');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'January 17, 2019');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 04, 1981');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'June 08, 2008');

/* Data to specializations table */

INSERT INTO specializations(id_vet, id_species) VALUES (1, 1);
INSERT INTO specializations(id_vet, id_species) VALUES (3, 1);
INSERT INTO specializations(id_vet, id_species) VALUES (3, 2);
INSERT INTO specializations(id_vet, id_species) VALUES (4, 2);

/* Data to visits table */

INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (1, 1, 'May 24, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (3, 1, 'July 22, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (4, 2, 'February 02, 2021');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 3, 'January 05, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 3, 'March 08, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 3, 'May 14, 2020');

INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (3, 4, 'May 04, 2021');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (4, 5, 'February 24, 2021');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 6, 'December 21, 2019');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (1, 6, 'August 10, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 6, 'April 07, 2021');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (3, 7, 'September 29, 2019');

INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (4, 8, 'October 03, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (4, 8, 'November 04, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 9, 'January 24, 2019');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 9, 'May 15, 2019');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 9, 'February 27, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (2, 9, 'August 03, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (3, 10, 'May 24, 2020');
INSERT INTO visits(id_vet, id_animals, visit_date) VALUES (1, 10, 'January 11, 2021');


-- Performance audit project
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';