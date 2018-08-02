DROP TABLE castings;
DROP TABLE stars;
DROP TABLE movies;


CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);


CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);




CREATE TABLE castings(
  id SERIAL PRIMARY KEY,
  fee INT,
  stars_id INT REFERENCES stars(id) ON DELETE CASCADE,
  movies_id INT REFERENCES movies(id) ON DELETE CASCADE
);


-- SELECT * FROM stars;
SELECT * FROM movies;
-- SELECT * FROM castings;
