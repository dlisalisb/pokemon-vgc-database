-- Table: public.pokemon

-- DROP TABLE IF EXISTS public.pokemon;

CREATE TABLE IF NOT EXISTS public.pokemon
(
    id_pokemon integer NOT NULL,
    nome character varying(50) COLLATE pg_catalog."default" NOT NULL,
    hp integer NOT NULL,
    attack integer NOT NULL,
    defense integer NOT NULL,
    sp_attack integer NOT NULL,
    sp_defense integer NOT NULL,
    speed integer NOT NULL,
    CONSTRAINT pokemon_pkey PRIMARY KEY (id_pokemon)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pokemon
    OWNER to postgres;