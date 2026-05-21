SELECT nome, speed
FROM pokemon
WHERE speed = (SELECT MAX(speed) FROM pokemon);