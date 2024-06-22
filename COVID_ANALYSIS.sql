
SELECT * FROM Corona_Virus_Dataset;
-- Q1. Write a code to check NULL values
SELECT *
FROM Corona_Virus_Dataset
WHERE Country_Region IS NULL
   OR Confirmed IS NULL
   OR Deaths IS NULL
   OR Recovered IS NULL;

   -- Q2. If NULL values are present, update them with zeros for all columns. 
UPDATE Corona_Virus_Dataset
SET 
    province = CASE WHEN province IS NULL THEN '0' ELSE province END,
    country_region = CASE WHEN country_region IS NULL THEN '0' ELSE country_region END,
    latitude = CASE WHEN latitude IS NULL THEN '0' ELSE latitude END,
    longitude = CASE WHEN longitude IS NULL THEN '0' ELSE longitude END,
    date = CASE WHEN date IS NULL THEN '0' ELSE date END,
    confirmed = CASE WHEN confirmed IS NULL THEN 0 ELSE confirmed END,
    deaths = CASE WHEN deaths IS NULL THEN 0 ELSE deaths END,
    recovered = CASE WHEN recovered IS NULL THEN 0 ELSE recovered END;
	
   
   -- Q3. check total number of rows
   SELECT COUNT(*) AS Total_number_ofrows
FROM Corona_Virus_Dataset;
--Total number of rows is 49150

-- Q4. Check what is start_date and end_date
SELECT 
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM Corona_Virus_Dataset;

---start_date 22-01-2020 and end_date 13-06-2-21


-- Q5. Number of month present in dataset
SELECT DATEDIFF(MONTH, MIN(datE), MAX(date)) + 1 AS NumberOfMonths
FROM Corona_Virus_Dataset;
---The Number of Months are 18months

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    YEAR(date) AS Year,
    DATENAME (MONTH,(date))as Month,
    AVG(Confirmed) AS Avg_Confirmed,
    AVG(Deaths) AS Avg_Deaths,
    AVG(Recovered) AS Avg_Recovered
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(date), 
    DATENAME (MONTH,(date))
	ORDER BY
	YEAR(Date),
	DATENAME (MONTH,(Date)) ASC;
	-- Q7. Find most frequent value for confirmed, deaths, recovered each month.
	SELECT * FROM Corona_Virus_Dataset;
WITH FrequentData AS (
    SELECT
        YEAR(Date) AS Year,
        DATENAME(MONTH, Date) AS Month_Name,
        MONTH(Date) AS Month_Number,
        Confirmed,
        Deaths,
        Recovered,
        RANK() OVER (
            PARTITION BY YEAR(Date), MONTH(Date)
            ORDER BY COUNT(*) DESC
        ) AS rank 
    FROM Corona_Virus_Dataset
    GROUP BY 
        YEAR(Date), 
        DATENAME(MONTH, Date), 
        MONTH(Date), 
        Confirmed, 
        Deaths, 
        Recovered
)
SELECT 
    Year,
    Month_Name,
    Confirmed,
    Recovered,
    Deaths
FROM FrequentData
WHERE rank = 1
ORDER BY Year, Month_Number;

	
	
	-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS Year,
    MIN(Confirmed) AS Max_Confirmed,
    MIN(Deaths) AS Max_Deaths,
    MIN(Recovered) AS Max_Recovered
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(Date),P
ORDER BY 
    Year;




		



-- Q9. Find maximum values of confirmed, deaths, recovered per year

	SELECT 
    YEAR(Date) AS Year,
    Max(Confirmed) AS Max_Confirmed,
    Max(Deaths) AS Max_Deaths,
    Max(Recovered) AS Max_Recovered,
	Province
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(Date),Province
ORDER BY 
    Year,Province;
	
--- 10 The total number of case of confirmed, deaths, recovered each month
SELECT 
    YEAR(date) AS Year,
   DATENAME(MONTH,(date))as Month,
   MONTH(date) AS Month_Number,
    Sum(Confirmed) AS Avg_Confirmed,
    Sum(Deaths) AS Avg_Deaths,
    Sum(Recovered) AS Avg_Recovered
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(date), 
    DATENAME(MONTH,(date)),
	MONTH(date)
ORDER BY
YEAR(Date),
MONTH(date);


----- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month_Number,
	DATENAME(MONTH,(Date)) AS Month_Name,
    SUM(Confirmed) AS Total_Confirmed,
    AVG(Confirmed) AS Avg_Confirmed,
   ROUND (VAR(Confirmed),2) AS Variance_Confirmed,
    Round(STDEV(Confirmed),2) AS StdDev_Confirmed
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(Date), 
    MONTH(Date),
	DATENAME(MONTH,(Date))
ORDER BY 
    Year, 
    Month_Number;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

	-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Confirmed) AS Total_Confirmed,
    Sum(Recovered) AS Total_Recovered,
    VAR(Recovered) AS Variance_Recovered,
    STDEV(Recovered) AS Recovered
FROM 
    Corona_Virus_Dataset
GROUP BY 
    YEAR(Date), 
    MONTH(Date)
ORDER BY 
    Year, 
    Month;

	-- Q14. Find Country having highest number of the Confirmed case

	SELECT * FROM Corona_Virus_Dataset;
	
	SELECT TOP 5
    Country_Region AS Country,
    SUM(Confirmed ) AS Total_Confirmed
FROM 
    Corona_Virus_Dataset
GROUP BY 
    Country_Region
ORDER BY 
    Total_Confirmed DESC;

-- Q15. Find Country having lowest number of the death case
SELECT TOP 5
    Country_Region AS Country,
    SUM(Deaths) AS Death_rate
FROM 
    Corona_Virus_Dataset
GROUP BY 
    Country_Region
ORDER BY 
    Death_rate ASC;

-- Q16. Find top 5 countries having highest recovered case
SELECT TOP 5
Country_Region AS Country,
SUM(Recovered) AS Recovered_cases
FROM Corona_Virus_Dataset
GROUP BY 
      Country_Region
ORDER BY 
      Recovered_cases DESC;

-- . Find Country having HIGHEST number of the death case
SELECT TOP 5
    Country_Region AS Country,
    SUM(Deaths) AS Death_rate
FROM 
    Corona_Virus_Dataset
GROUP BY 
    Country_Region
ORDER BY 
    Death_rate DESC;








