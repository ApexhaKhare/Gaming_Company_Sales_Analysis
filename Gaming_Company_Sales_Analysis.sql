/* Creating a database 

CREATE video_games_sales ;

/* using a database
use video_games_sales ;

--- viewing records from tables

select *  from gamesales;



/* Top 5 genre that have maximum sales over the years */

SELECT genre, 
       round(sum(global_sales),2) as TOTAL_SALES
FROM gamesales
group By genre
ORDER BY TOTAL_SALES desc
limit 5 ;



/* Top 5 Platform that have maximum sales over the years */ 

SELECT Platform, 
       round(sum(global_sales),2) as TOTAL_SALES
FROM gamesales
group By Platform
ORDER BY TOTAL_SALES desc
limit 5 ;



/* Number of games released for given genre to know the trend */ 
SELECT genre,
       count(*) as NUM_OF_GAMES_RELEASED
FROM gamesales
GROUP BY Genre
ORDER BY NUM_OF_GAMES_RELEASED desc ;


/* Which platform has maximum games released on it ? */

SELECT Platform ,
       Count(*) as NUM_OF_GAMES_RELEASED
FROM gamesales
GROUP BY Platform 
ORDER BY NUM_OF_GAMES_RELEASED desc ;



/* Another approach using window function */ 

SELECT Platform ,
       Count(*) as NUM_OF_GAMES_RELEASED,
DENSE_RANK() OVER (ORDER BY Count(*) desc ) As Ranking 
FROM gamesales
GROUP BY Platform ;




SELECT Platform,
       NUM_OF_GAMES_RELEASED
FROM 
(SELECT Platform ,
       Count(*) as NUM_OF_GAMES_RELEASED,
DENSE_RANK() OVER (ORDER BY Count(*) desc ) As Ranking 
FROM gamesales
GROUP BY Platform
) as Platform_Rank
WHERE Ranking <=10 ;




/* Top 10 publishers whose sales are highest as per region */ 

SELECT Publisher,
       round(SUM(NA_Sales),2) as NA_total_Sales,
       round(SUM(EU_Sales),2) as EU_total_Sales,
       round(SUM(JP_Sales),2) as JP_total_Sales,
       round(SUM(Other_Sales),2) as Other_total_Sales
FROM gamesales
GROUP BY Publisher
ORDER BY NA_total_Sales DESC , 
         EU_total_Sales DESC , 
         JP_total_Sales DESC ,
         Other_total_Sales DESC
LIMIT 10 ;



/* Which gaming Platform had the maximum sales on which genre ? */

SELECT Platform ,
       Genre,
       ROUND(Max(NA_Sales),2) as NA_Max_Sales
FROM gamesales ;


SELECT Platform ,
       Genre,
       ROUND(Max(EU_Sales),2) as Europe_Max_Sales
FROM gamesales ;

SELECT Platform ,
       Genre,
       ROUND(Max(JP_Sales),2) as Japan_Max_Sales
FROM gamesales ;

SELECT Platform ,
       Genre,
       ROUND(Max(Global_Sales),2) as GlobalMax_Sales
FROM gamesales ;