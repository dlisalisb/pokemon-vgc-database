 Pokémon VGC Database
 Visão geral do projeto

Este projeto consiste em um banco de dados relacional desenvolvido em PostgreSQL, com foco em estudo de modelagem de dados e análise de estatísticas de Pokémon em um contexto competitivo (VGC).

O objetivo foi estruturar corretamente dados de Pokémon base e suas formas alternativas, permitindo consultas organizadas e análise comparativa de stats.

 Estrutura do banco de dados

O modelo foi construído com normalização e separação de entidades principais:

pokemon → dados base dos Pokémon
pokemon_forma → formas alternativas (Mega, regionais, etc.)
tipo → catálogo de tipos
pokemon_tipo → relacionamento N:N entre Pokémon base e tipos
pokemon_forma_tipo → relacionamento N:N entre formas e tipos
 Relacionamentos
Pokémon base pode ter 1 ou 2 tipos
Pokémon pode possuir múltiplas formas alternativas
Cada forma alternativa também possui seus próprios tipos
Relações N:N tratadas com tabelas intermediárias
  Principais funcionalidades implementadas
Modelagem relacional completa
Suporte a formas alternativas (Mega, regionais, etc.)
Relacionamento normalizado de tipos
Agregação de tipos por Pokémon
Views consolidadas para análise
Cálculo de Total Base Stats
Ordenação por Pokédex e forma
 Query principal (visão consolidada)

A query abaixo une Pokémon base e suas formas alternativas em uma única visualização:

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

 Conceitos aplicados
SQL avançado (JOIN, GROUP BY, UNION ALL)
Modelagem relacional normalizada
Agregação com STRING_AGG
Ordenação com controle de hierarquia (base vs forma)
Cálculo de estatísticas derivadas
 Objetivo do projeto

Este projeto foi desenvolvido para estudo prático de:

Banco de dados relacional
Modelagem de dados complexa
SQL analítico
Organização de dados para análise competitiva
 Possíveis melhorias futuras
API para consulta dos Pokémon
Dashboard com visualização de stats
Análise estatística avançada (médias e rankings)
