DROP TABLE assigning; 
DROP TABLE animals;
DROP TABLE studies;

CREATE TABLE animals
(
  id SERIAL8 primary key,
  age INT4 not null,
  species VARCHAR(255) not null,
  date_arrived DATE not null,
  study_availability VARCHAR(255) not null
  
);

CREATE TABLE studies
(
  id SERIAL8 primary key,
  sd VARCHAR(255) not null,
  purpose VARCHAR(255) not null
);

CREATE TABLE assigning
( 
  id SERIAL8 primary key,
  animal_id INT8 references animals(id) ON DELETE CASCADE,
  study_id INT8 references studies(id) ON DELETE CASCADE
);