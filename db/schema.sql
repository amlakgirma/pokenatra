DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  poke_type VARCHAR,
  cp INT NOT NULL,
  img_url VARCHAR
);
CREATE TABLE trainers(
  name VARCHAR,
  lever VARCHAR,
  img_url VARCHAR
);
