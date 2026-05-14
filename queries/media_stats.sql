SELECT
ROUND(AVG(total_stats), 2) AS media_total_stats
FROM (SELECT
hp + attack + defense +
sp_attack + sp_defense + speed AS total_stats
FROM pokemon

UNION ALL

SELECT
hp + attack + defense +
sp_attack + sp_defense + speed AS total_stats
FROM pokemon_forma) sub;