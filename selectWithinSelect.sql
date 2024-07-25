--List each country name where the population is larger than that of 'Russia'
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');


--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
Where continent = 'Europe' AND GDP/population >
(SELECT GDP/population FROM world WHERE name = 'United Kingdom');


--List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name = 'Argentina' OR name = 'Australia'
)
ORDER BY name;

-- Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (SELECT population 
FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany');