-- =========================================
-- Query principal de visualização do projeto
-- Pokemon VGC Database
--
-- Objetivo:
-- Exibir Pokémon base e formas alternativas
-- com seus tipos e stats consolidados.
-- =========================================

SELECT
pokedex_number, nome, tipos, hp,attack, defense, sp_attack, sp_defense, speed, total_base_stats
FROM ( SELECT
LPAD(p.id_pokemon::TEXT, 4, '0') AS pokedex_number, p.nome,
STRING_AGG(t.nome, ', ') AS tipos, p.hp, p.attack, p.defense, p.sp_attack, p.sp_defense, p.speed,
(p.hp + p.attack + p.defense + p.sp_attack + p.sp_defense + p.speed) AS total_base_stats, 'BASE' AS origem, 0 AS ordem_forma

FROM pokemon p
JOIN pokemon_tipo pt
ON p.id_pokemon = pt.id_pokemon
JOIN tipo t
ON pt.id_tipo = t.id_tipo

GROUP BY
p.id_pokemon, p.nome, p.hp, p.attack, p.defense, p.sp_attack, p.sp_defense, p.speed

UNION ALL

SELECT
LPAD(pf.id_pokemon::TEXT, 4, '0') AS pokedex_number,
pf.nome_forma AS nome,
STRING_AGG(t.nome, ', ') AS tipos,
pf.hp, pf.attack, pf.defense, pf.sp_attack, pf.sp_defense, pf.speed,
(pf.hp + pf.attack + pf.defense + pf.sp_attack + pf.sp_defense + pf.speed) AS total_base_stats,
'FORMA' AS origem,
1 AS ordem_forma

FROM pokemon_forma pf

JOIN pokemon_forma_tipo pft
ON pf.id_forma = pft.id_forma

JOIN tipo t
ON pft.id_tipo = t.id_tipo

GROUP BY
pf.id_forma, pf.id_pokemon, pf.nome_forma, pf.hp, pf.attack, pf.defense, pf.sp_attack, pf.sp_defense, pf.speed) sub

ORDER BY pokedex_number, ordem_forma;