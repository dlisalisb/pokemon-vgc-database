SELECT
nome, speed
FROM (SELECT
nome, speed 
FROM pokemon

UNION ALL

SELECT
nome_forma AS nome,
speed
FROM pokemon_forma) sub

ORDER BY speed DESC
LIMIT 15;