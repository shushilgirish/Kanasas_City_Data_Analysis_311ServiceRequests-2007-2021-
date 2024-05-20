-- Calculate the total number of service requests per source
SELECT 
    DS.SOURCE,
    COUNT(FC.Category_SK) AS Total_Requests
FROM 
    [Individual_Project_1].[dbo].[FACT_CASE] FC
JOIN 
    [Individual_Project_1].[dbo].[DIM_SOURCE] DS ON FC.source_sk = DS.source_sk
GROUP BY 
    DS.SOURCE
ORDER BY 
    Total_Requests DESC;

    -- Calculate the total number of service requests per department
SELECT 
    DP.DEPARTMENT,
    COUNT(FC.Category_SK) AS Total_Requests
FROM 
    [Individual_Project_1].[dbo].[FACT_CASE] FC
JOIN 
    [Individual_Project_1].[dbo].[DIM_PARCEL] DP ON FC.Parcel_SK = DP.Parcel_SK
GROUP BY 
    DP.DEPARTMENT
ORDER BY 
    Total_Requests DESC;

  
SELECT TOP 10
    FC.Category_SK,
    DC.Category1,
    DC.Type,
    FC.DAYS_TO_CLOSE
FROM 
    [Individual_Project_1].[dbo].[FACT_CASE] FC
JOIN 
    [Individual_Project_1].[dbo].[DIM_CATEGORY] DC ON FC.CATEGORY_SK = DC.CATEGORY_SK
ORDER BY 
    FC.DAYS_TO_CLOSE ASC;

-- Calculate the response time for each case and categorize by Deparment 
SELECT TOP 10
    p.DEPARTMENT,
    CAST(AVG(CAST(fc.DAYS_TO_CLOSE AS DECIMAL(10, 2))) AS DECIMAL(10, 2)) AS average_response_time
FROM 
    FACT_CASE fc 
JOIN 
    DIM_PARCEL p ON fc.Parcel_SK = p.Parcel_SK
GROUP BY 
    p.DEPARTMENT
ORDER BY 
    average_response_time ASC;

 
-- Calculate the response time for each case and categorize by Category1 
 SELECT TOP 10
    cat.CATEGORY1,
    CAST(AVG(CAST(fc.DAYS_TO_CLOSE AS DECIMAL(10, 2))) AS DECIMAL(10, 2)) AS average_response_time
FROM 
    FACT_CASE fc 
JOIN 
    DIM_CATEGORY cat ON fc.Category_SK = cat.Category_SK
GROUP BY 
    cat.CATEGORY1
ORDER BY 
    average_response_time ASC;

-- Calculate the response time for each case by type of requests
SELECT TOP 10
    cat.TYPE,
    CAST(AVG(CAST(fc.DAYS_TO_CLOSE AS DECIMAL(10, 2))) AS DECIMAL(10, 2)) AS average_response_time
FROM 
    FACT_CASE fc 
JOIN 
    DIM_CATEGORY cat ON fc.Category_SK = cat.Category_SK
GROUP BY 
    cat.TYPE
ORDER BY 
    average_response_time ASC;

select top 10 l.[ZIP CODE],count(fc.Category_SK) as Casecount 
from FACT_CASE fc join DIM_LOCATION l on fc.Location_SK=l.Location_SK
 GROUP by l.[ZIP CODE]
 order by Casecount desc


SELECT 
    p.DEPARTMENT,
COUNT(fc.Category_SK) AS Total_Requests
FROM 
   FACT_CASE fc JOIN
   DIM_PARCEL P
   on fc.Parcel_SK=p.Parcel_SK
   GROUP by p.DEPARTMENT
   ORDER by Total_Requests DESC

   -- Calculate the top 10 case with fastest  response time by Category1 and Type 
WITH RankedCases AS (
    SELECT 
        fc.Fact_Case_SK,
        dc.CATEGORY1,
        dc.[TYPE],
        SUM(fc.DAYS_TO_CLOSE) AS sum_response_time,
        RANK() OVER (PARTITION BY dc.CATEGORY1, dc.[TYPE] ORDER BY SUM(fc.DAYS_TO_CLOSE) ASC) AS rank
    FROM 
        FACT_CASE fc 
    JOIN 
        DIM_CATEGORY dc ON fc.Category_SK = dc.Category_SK
    GROUP BY 
        fc.Fact_Case_SK,
        dc.CATEGORY1,
        dc.[TYPE]
)

SELECT
    Fact_Case_SK,
    CATEGORY1,
    [TYPE],
    sum_response_time
FROM 
    RankedCases
WHERE 
    rank <= 10;
