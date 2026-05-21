SELECT p.id_pokemon, p.nome
FROM pokemon p
JOIN pokemon_tipo pt ON p.id_pokemon = pt.id_pokemon
JOIN tipo t ON pt.id_tipo = t.id_tipo
WHERE t.nome = 'Fire'

EXCEPT

SELECT p.id_pokemon, p.nome
FROM pokemon_forma pf
JOIN pokemon p ON p.id_pokemon = pf.id_pokemon
JOIN pokemon_forma_tipo pft ON pf.id_forma = pft.id_forma
JOIN tipo t ON pft.id_tipo = t.id_tipo
WHERE t.nome = 'Fire';