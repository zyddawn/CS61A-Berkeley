CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
  FROM dogs, sizes
  WHERE min < height AND height <= max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child
  FROM parents, dogs
  WHERE parent = name
  ORDER BY height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT s1.name AS name1, s2.name AS name2, s1.size as size1, s2.size as size2
  FROM size_of_dogs AS s1, size_of_dogs AS s2,
       parents as p1, parents as p2
  WHERE p1.child = s1.name AND p2.child = s2.name AND 
        p1.parent = p2.parent AND s1.name < s2.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT (name1 || " and " || name2 || " are " || size1 || " siblings")
  FROM siblings
  WHERE size1 = size2
  ORDER BY size1;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here


CREATE TABLE stacks AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
