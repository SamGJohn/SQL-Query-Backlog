/* Stanford SQL Movie-Rating Query Excercise */

/* Q1 */
SELECT title 
FROM Movie 
WHERE director = 'Steven Spielberg'

/* Q2 */
SELECT distinct year 
FROM Movie 
JOIN Rating USING(mID) 
WHERE stars > 3 
ORDER BY year

/* Q3 */
SELECT title 
FROM Movie 
LEFT JOIN Rating Using(mID) 
WHERE stars is null

/* Q4 */
SELECT name 
FROM Reviewer 
JOIN Rating Using(rID) 
WHERE ratingDate is null;

/* Q5 */
SELECT name, title, stars, ratingDate 
FROM Movie
JOIN Rating Using(mID)
JOIN Reviewer Using(rID)
ORDER BY name, title, stars

/* Q6 */
/*don't know*/

/* Q7 */
SELECT title, max(stars) as ma
FROM Movie 
JOIN Rating Using(mID)
JOIN Reviewer Using(rID)
GROUP BY title
ORDER BY title

/* Q8 */
SELECT title, ma-mn as spread FROM (SELECT name, title, min(stars) as mn, max(stars) as ma
FROM Movie 
JOIN Rating Using(mID)
JOIN Reviewer Using(rID)
GROUP BY title) t1
ORDER BY spread DESC

/* Q9 */
SELECT avg2-avg1 FROM (SELECT (SELECT avg(av) FROM(SELECT title, year, avg(stars) as av FROM (SELECT *
FROM Movie 
JOIN Rating Using(mID)
JOIN Reviewer Using(rID)
WHERE year > 1980)t1
GROUP BY title)t4) as avg1, (SELECT avg(av) FROM (SELECT title, year, avg(stars) as av FROM (SELECT *
FROM Movie 
JOIN Rating Using(mID)
JOIN Reviewer Using(rID)
WHERE year <= 1980)t2
GROUP BY title)t3) as avg2)t5