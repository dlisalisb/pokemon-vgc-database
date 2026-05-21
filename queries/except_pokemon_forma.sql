SELECT p.id_pokemon, p.nome
FROM pokemon p

EXCEPT

SELECT pf.id_pokemon, p.nome
FROM pokemon_forma pf
JOIN pokemon p ON p.id_pokemon = pf.id_pokemon;