-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".
SELECT name FROM world
  WHERE name LIKE 'Y%';
--
-- Find the countries that end with y
  SELECT name FROM world
  WHERE name LIKE '%Y';


-- Luxembourg has an x - so does one other country. List them both.
SELECT name FROM world
  WHERE name LIKE '%x%';

--Iceland, Switzerland end with land - but are there others?

--Find the countries that end with land
SELECT name FROM world
WHERE name LIKE '%land';

 SELECT name FROM world
  WHERE name LIKE 'C%ia';

 SELECT name FROM world
WHERE name LIKE '%oo%';

SELECT name FROM world
WHERE name LIKE '%a%a%a%';


-- India and Angola have an n as the second character. You can use the underscore as a single character wildcard.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

--Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%';

-- Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____';


 SELECT name 
  FROM world
 WHERE name = capital;