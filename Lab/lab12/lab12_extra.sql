.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT s.date, s.color, s.pet, s.number, f.number
  FROM students as s, fa17students as f
  WHERE s.date = f.date AND
  		s.color = f.color AND s.pet = f.pet;

-- Q6
CREATE TABLE sevens AS
  SELECT s.seven
  FROM students as s, checkboxes as c
  WHERE s.time = c.time AND s.number = 7 AND
  		c.'7' = 'True';



-- Q7
CREATE TABLE fa17favnum AS
  SELECT number, COUNT(*) as count
  FROM fa17students
  GROUP BY number
  ORDER BY count DESC
  LIMIT 1;


CREATE TABLE fa17favpets AS
  SELECT pet, COUNT(*) as count
  FROM fa17students
  GROUP BY pet
  ORDER BY count DESC
  LIMIT 10;


CREATE TABLE sp18favpets AS
  SELECT pet, COUNT(*) as count
  FROM students
  GROUP BY pet
  ORDER BY count DESC
  LIMIT 10;


CREATE TABLE sp18dog AS
  SELECT pet, COUNT(*) as count
  FROM students
  WHERE pet = 'dog';


CREATE TABLE sp18alldogs AS
  SELECT pet, COUNT(*) as count
  FROM students
  WHERE pet LIKE '%dog%';


CREATE TABLE obedienceimages AS
  SELECT seven, denero, COUNT(*) as count
  FROM students
  WHERE seven = '7'
  GROUP BY denero;

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
