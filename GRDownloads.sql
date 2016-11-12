SELECT Year(date)  AS year, 
       Month(date) AS month, 
       Count(*)    AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY year DESC, 
          month DESC;

SELECT Year(date)  AS year, 
       Month(date) AS month, 
       format, 
       Count(*)    AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY format, 
          year DESC, 
          month DESC;

SELECT Year(date)  AS year, 
       Month(date) AS month, 
       Count(*)    AS unique_downloads 
FROM   Users 
WHERE  date IS NOT NULL 
GROUP  BY year DESC, 
          month DESC;

SELECT Year(date) AS year, 
       Count(*)   AS up_to_now 
FROM   CompleteDownloads 
WHERE  Year(date) = Year(Curdate()); 

SELECT Max(date) AS Last_Date_of_Analysis 
FROM   Downloads 

SELECT date, Count(*)  AS browser_downloads 
FROM   CompleteDownloads 
WHERE  method_type=""browser"" AND YEAR(date)>YEAR(CURDATE())-2
GROUP BY date DESC;

SELECT Year(date)  AS year, 
       Month(date) AS month, 
       method_type, 
       Count(*)    AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY method_type, 
          year DESC, 
          month DESC; 

SELECT Year(date)  AS year, 
       Month(date) AS month, 
       method, 
       Count(*)    AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY method, 
          year DESC, 
          month DESC; 

SELECT date, 
       method_type, 
       Count(*) AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY method_type, 
          date DESC;

SELECT date, 
       Count(*) AS complete_downloads 
FROM   CompleteDownloads 
GROUP  BY date DESC; 

SELECT Count(*) AS unique_downloads 
FROM Users
WHERE date IS NOT NULL
GROUP BY date DESC; 

SELECT Year(date) AS year, 
       Month(date) AS month, 
       Count(*)  AS browser_downloads 
FROM   CompleteDownloads 
WHERE  method_type=""browser""
GROUP BY
          Year(date) DESC, 
          Month(date) DESC;

SELECT Year(date) AS year, 
	   Month(date) AS month, 
	   version, 
       Count(*) AS complete_downloads
FROM   CompleteDownloads 
GROUP  BY year, 
          month, 
          version
ORDER BY year DESC, 
        month DESC, 
        complete_downloads DESC; 

SELECT Year(date)  AS year, 
       Month(date) AS month, 
       version, 
       Count(*)    AS unique_downloads 
FROM   Users 
WHERE  date IS NOT NULL 
GROUP  BY year, 
          month, 
          version 
ORDER  BY year DESC, 
          month DESC, 
          unique_downloads DESC; 

SELECT version, 
       Count(version) AS complete_downloads 
FROM   CompleteDownloads 
GROUP BY version
ORDER BY complete_downloads DESC; 

