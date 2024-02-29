select * from Kansas_City
--1
SELECT
    YEAR("CREATION DATE2") AS request_year,
    COUNT(*) AS request_count
FROM
    Kansas_City
WHERE
    "CREATION DATE2" BETWEEN '2018-01-01' AND '2021-12-31'
GROUP BY
    YEAR("CREATION DATE2")
ORDER BY
    YEAR("CREATION DATE2");

SELECT *FROM Kansas_city ORDER BY [days to close] DESC;