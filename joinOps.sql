--Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER'


--From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.

--Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.

SELECT id,stadium,team1,team2
 FROM game
WHERE id = '1012'

--You can combine the two steps into a single query with a JOIN.
SELECT *
  FROM game JOIN goal ON (id=matchid)

--   The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
-- ON (game.id=goal.matchid)

-- The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

-- Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player,teamid,stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'


-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

--The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id) 
 WHERE gtime<=10

--To JOIN game with eteam you could use either
--game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

--Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id
 SELECT mdate, teamname
FROM game JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos'

--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw
--Columns we need = player(goal table),stadium(game) need to join these tables somehow
SELECT player
FROM game JOIN goal ON (id=matchid)
Where stadium = 'National Stadium, Warsaw'
--The example query shows all goals scored in the Germany-Greece quarterfinal.
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' || team2='GER') 
AND teamid!='GER'

--Show teamname and the total number of goals scored.
SELECT DISTINCT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

--Show the stadium and the number of goals scored in each stadium.
 SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
GROUP BY stadium

--For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 GROUP BY matchid


--For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
 SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'
GROUP BY matchid

--List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- LEFT JOIN ensures that all matches from the game table are included in the result, even if there are no corresponding rows in the goal table (i.e., matches where no goals were scored).

SELECT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid
ORDER BY mdate, matchid, team1, team2
