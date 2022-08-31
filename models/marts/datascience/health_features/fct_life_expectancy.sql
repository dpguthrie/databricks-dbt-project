SELECT 
Year, Country, 
WHOSIS_000001 AS LifeExpectancy 
FROM {{ ref('fct_health_indicators_pivot') }} 
WHERE Year <= 2023