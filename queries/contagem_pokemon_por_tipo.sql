SELECT t.nome AS tipo, COUNT(*) AS total_pokemon
FROM pokemon p
JOIN pokemon_tipo pt ON p.id_pokemon = pt.id_pokemon
JOIN tipo t ON pt.id_tipo = t.id_tipo
GROUP BY t.nome
ORDER BY total_pokemon DESC;