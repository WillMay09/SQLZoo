

SELECT name, continent, population FROM world;

SELECT name FROM world
WHERE population >= 200000000;


--Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, GDP/population AS per_capita_GDP
FROM world
WHERE population >= 200000000

--Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 AS population_in_millions
FROM world
WHERE continent = 'South America';

--Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany','Italy');

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;


-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;


--Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name,ROUND(population/1000000, 2) AS population_in_millions, ROUND(GDP/1000000000, 2) AS GDP_in_billions
FROM world
WHERE continent = 'South America';


--Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

--Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(GDP/population, -3) AS per_capita_GDP
FROM world
WHERE GDP >= 1000000000000;


SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital);

--Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;




