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