/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    ID INTEGER,
    NAME VARCHAR,
    DATE_OF_BIRTH DATE,
    ESCAPE_ATTEMPTS INTEGER,
    NEUTERED BOOLEAN,
    WEIGHT_KG DECIMAL
);
