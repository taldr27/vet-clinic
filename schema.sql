/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR
);

CREATE TABLE owners (
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    full_name VARCHAR,
    age INTEGER
);

CREATE TABLE species (
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT species_id 
FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT owner_id 
FOREIGN KEY (owner_id) REFERENCES owners (id);