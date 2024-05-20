-- Overall trend in Service Requests by source over the years 2018-2021
SELECT 
    dd.[Creation_Calender_Year] AS Year,
    ds.[source] AS Source,
    COUNT(fc.[CASE ID]) AS Total_Service_Requests
FROM 
    [Individual_Project_1].[dbo].[FACT_CASE] fc
JOIN 
    [Individual_Project_1].[dbo].[DIM_DATE] dd
ON 
    fc.[DateSK] = dd.[DateSK]
JOIN 
    [Individual_Project_1].[dbo].[DIM_SOURCE] ds
ON 
    fc.[source_sk] = ds.[source_sk]
WHERE 
    dd.[Creation_Calender_Year] BETWEEN 2018 AND 2021
GROUP BY 
    dd.[Creation_Calender_Year],
    ds.[source]
ORDER BY 
    dd.[Creation_Calender_Year],
    ds.[source];
