SELECT 
    p.nome AS pokemon_base,
    pf.nome_forma,
    t.nome AS tipo
FROM pokemon p
JOIN pokemon_forma pf ON p.id_pokemon = pf.id_pokemon
JOIN pokemon_forma_tipo pft ON pf.id_forma = pft.id_forma
JOIN tipo t ON pft.id_tipo = t.id_tipo
WHERE t.nome = 'Fire';