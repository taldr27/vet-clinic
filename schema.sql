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

/* Project 4 */

CREATE TABLE vets (
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR,
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    id_vet INTEGER NOT NULL,
    id_species INTEGER NOT NULL,
    PRIMARY KEY (id_vet, id_species),
    FOREIGN KEY (id_vet) REFERENCES vets (id),
    FOREIGN KEY (id_species) REFERENCES species (id)
);

CREATE TABLE visits (
    id_vet INTEGER NOT NULL,
    id_animals INTEGER NOT NULL,
    visit_date DATE,
    FOREIGN KEY (id_vet) REFERENCES vets (id),
    FOREIGN KEY (id_animals) REFERENCES animals (id)
);
