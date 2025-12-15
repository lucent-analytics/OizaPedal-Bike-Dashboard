SELECT *
FROM bike_share_yr_0;

SELECT *
FROM bike_share_yr_1;

SELECT *
FROM cost_table;

SELECT *
FROM bike_share_yr_0
UNION
SELECT *
FROM bike_share_yr_1;

WITH cte AS
(
    SELECT *
    FROM bike_share_yr_0
    UNION
    SELECT *
    FROM bike_share_yr_1
)
SELECT 
    dteday, 
    season, 
    a.yr, 
    weekday, 
    hr, 
    rider_type, 
    riders,
    price, 
    COGS,
    riders*price AS Revenue,
    riders*price - COGS AS Profit
FROM cte a
LEFT JOIN cost_table b
    ON a.yr = b.yr;
    
    


