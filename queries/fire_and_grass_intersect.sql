SELECT p.nome
FROM pokemon p
JOIN pokemon_tipo pt ON p.id_pokemon = pt.id_pokemon
JOIN tipo t ON pt.id_tipo = t.id_tipo
WHERE t.nome = 'Fire'

INTERSECT

SELECT p.nome
FROM pokemon p
JOIN pokemon_tipo pt ON p.id_pokemon = pt.id_pokemon
JOIN tipo t ON pt.id_tipo = t.id_tipo
WHERE t.nome = 'Grass';