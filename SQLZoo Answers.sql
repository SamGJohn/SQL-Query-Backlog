/* SELECT FROM WORLD */

SELECT gdp/population FROM world

SELECT name FROM world
WHERE population>250000000

SELECT name, gdp/population FROM world
WHERE population >= 200000000;

SELECT name, population/1000000 FROM world
WHERE continent LIKE "South America"

SELECT name, population FROM world
WHERE name = "France" 
OR name = "Germany"
OR name = "Italy"

SELECT name FROM world 
WHERE name LIKE "%United%"

select name, population, area 
from world 
where population > 250000000 
or area > 3000000

SELECT name, population, area 
FROM world 
where area > 3000000 
xor population > 250000000

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) FROM world where continent = "South America" 

SELECT name, ROUND(gdp/population, -3) FROM world where gdp > 1000000000000

SELECT name,
CASE WHEN continent = 'Asia'
OR continent = 'Australia' THEN 'Oceania'
WHEN continent = 'Australasia' THEN 'Oceania'
ELSE continent END
FROM world
WHERE name like 'N%'

SELECT name, 
CASE WHEN continent='Europe' 
OR continent = 'Asia' 
THEN 'Eurasia'
WHEN continent='North America'
OR continent ='South America'
OR continent = 'Caribbean'
THEN 'America'
ELSE continent END
FROM world 
WHERE name LIKE "A%"
OR name LIKE "B%"

/* Wrong */
SELECT name, continent, 
CASE WHEN continent = 'Oceania' THEN 'Australasia'
WHEN continent = 'Eurasia' OR continent = 'Turkey' THEN 'Europe/Asia'
WHEN name LIKE 'B%' AND continent = 'Caribbean' THEN 'North America'
WHEN continent = 'Caribbean' THEN 'South America'
ELSE continent END
  FROM world
WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')
ORDER BY name

/*SELECT from nobel*/
SELECT *
  FROM nobel
 WHERE yr = 1950

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

 SELECT yr, subject
FROM nobel 
WHERE winner = 'Albert Einstein'

SELECT winner, yr
FROM nobel
WHERE subject = 'Peace'
and yr >= 2000
ORDER BY yr DESC

SELECT * 
FROM nobel 
WHERE subject = "Literature"
and yr >= 1980
and yr <=1989

SELECT * FROM nobel
 WHERE winner = 'Theodore Roosevelt'
or winner = 'Woodrow Wilson'
or winner = 'Jimmy Carter'

SELECT winner 
FROM nobel
WHERE winner like 'John%'

SELECT * 
FROM nobel
WHERE subject = 'Physics'
and yr = 1980
or subject = 'Chemistry'
and yr = 1984

SELECT * 
FROM nobel
WHERE yr = 1980
and subject != 'Chemistry'
and subject != 'Medicine'

SELECT * 
FROM nobel
WHERE subject = 'Medicine'
and yr < 1910
or subject = 'Literature'
and yr >2003

SELECT *
FROM nobel
WHERE winner like 'Peter Gr%'

SELECT *
FROM nobel
WHERE winner = "Eugene O'Niell"

SELECT winner, yr, subject 
FROM nobel 
WHERE winner like "Sir%"
ORDER BY yr DESC, winner

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

 /* SELECT in SELECT */
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world
ORDER BY gdp/population DESC

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(100*(population/(SELECT population FROM world WHERE name = 'Germany')),0),'%') AS percgerm
FROM world
WHERE continent = 'Europe'
ORDER BY percgerm 

SELECT name 
FROM world 
WHERE population > ALL 
(SELECT population FROM world WHERE continent = 'Europe' and population > 0)

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

 /* Sum and Count */
SELECT SUM(population)
FROM world

SELECT AVG(population) 
FROM bbc 
WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT SUM(gdp) FROM world 
WHERE continent = 'Africa'

SELECT COUNT(name) FROM world WHERE area >= 1000000

SELECT SUM(population) FROM world WHERE name = 'France'
Or name = 'Germany'
Or name = 'Spain'

SELECT continent, COUNT(name) 
FROM world 
GROUP BY Continent

SELECT continent, count(name) as num
FROM world 
WHERE population >= 1000000000
GROUP BY continent
ORDER BY num DESC

SELECT continent 
FROM (SELECT continent, sum(population) as num 
	FROM world GROUP BY continent) a WHERE a.num > 100000000

/* JOINS */

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

SELECT team1, team2, player 
FROM game 
JOIN goal 
ON (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON (teamid=id)
 WHERE gtime<=10

SELECT mdate, teamname 
FROM game
JOIN eteam
ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos'

SELECT player
FROM goal
JOIN game
ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT teamid, mdate
  FROM goal JOIN game ON (matchid=id)
 WHERE mdate = '9 June 2012'

SELECT teamname, count(teamid) as goals
FROM eteam 
JOIN goal ON (id=teamid)
GROUP BY teamname
ORDER BY goals

SELECT stadium, count(teamid) as a 
FROM game
JOIN goal
ON (id=matchid)
GROUP BY stadium
ORDER BY a DESC

SELECT matchid, mdate, COUNT(*) as goals
FROM game JOIN goal ON (matchid = id) 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

SELECT a.matchid, a.mdate, count(*) as goals FROM (SELECT matchid, mdate
FROM goal 
JOIN game
ON matchid=id
WHERE teamid ='GER') a
GROUP BY a.matchid
ORDER BY goals DESC

SELECT a.mdate, a.team1, a.score1, a.team2, a.score2 FROM (SELECT mdate, matchid, team1, 
CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1, 
team2,
CASE WHEN teamid=team2 THEN 2 ELSE 0 END score2 
  FROM game JOIN goal ON matchid = id) a
GROUP BY a.mdate, a.matchid, a.team1, a.team2

/* More Join */

SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

SELECT yr FROM movie WHERE title = 'Citizen Kane'

SELECT id, title, yr 
FROM movie
WHERE title like '%Star Trek%'
ORDER BY yr 

SELECT title FROM movie
WHERE id=11955 or id = 11768 or id = 21191

select id from actor where name = 'Glenn Close'

SELECT id from movie where title = 'Casablanca'

select name from casting join actor on actorid=id where movieid=11768 group by actorid, name

SELECT name 
FROM movie
JOIN casting on movie.id=movieid
JOIN actor on actor.id=actorid
WHERE title ='Alien'

SELECT movieid, title, actorid, name
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id

SELECT title, name
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Harrison Ford'
AND ord != 1

SELECT title, name
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE yr = 1962
AND ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

SELECT a.name FROM(SELECT count(movieid) as star, name 
	FROM casting JOIN actor ON actorid = id 
	WHERE ord = 1 GROUP BY name 
	ORDER BY actorid DESC)a WHERE star >=30

/* Using Null */
SELECT teacher.name, dept.name 
FROM teacher LEFT OUTER JOIN dept ON (teacher.dept > dept.id)

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

SELECT teacher.name, COALESCE(dept.name, 'None') 
FROM teacher 
LEFT JOIN dept ON teacher.dept = dept.id

SELECT count(name), count(mobile) FROM teacher

SELECT dept.name, COUNT(teacher.name) 
FROM teacher 
RIGHT JOIN dept ON teacher.dept = dept.id 
GROUP BY dept.name

SELECT name,
CASE WHEN dept = 1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' ELSE 'Art' 
END
FROM teacher;

SELECT name, 
CASE WHEN dept=1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' 
END
FROM teacher

/* Self Join */