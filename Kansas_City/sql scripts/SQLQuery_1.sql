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


SELECT 
    p.[WORK GROUP],
COUNT(fc.Category_SK) AS Total_Requests
FROM 
   FACT_CASE fc JOIN
   DIM_PARCEL P
   on fc.Parcel_SK=p.Parcel_SK
   GROUP by  p.[WORK GROUP]
   ORDER by Total_Requests DESC
--Composition of Service requests over status_names aggreated values into open,close and resolved  
WITH DerivedStatus AS (
    SELECT s.[status_SK],
        CASE 
            WHEN [Status] IN ('resolved', 'closed') THEN 'closed'
            WHEN [Status] = 'open' THEN 'open'
            ELSE 'inprogress'
        END AS StatusDerived
    FROM
        DIM_STATUS s join FACT_CASE c on s.status_SK=c.status_SK
)

SELECT
    StatusDerived,
    COUNT(s1.status_SK) AS CaseCount
FROM
    DerivedStatus s1
GROUP BY
    StatusDerived;

