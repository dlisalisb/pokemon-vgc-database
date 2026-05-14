-- Table: public.pokemon_forma

-- DROP TABLE IF EXISTS public.pokemon_forma;

CREATE TABLE IF NOT EXISTS public.pokemon_forma
(
    id_forma integer NOT NULL DEFAULT nextval('pokemon_forma_id_forma_seq'::regclass),
    id_pokemon integer,
    nome_forma character varying(100) COLLATE pg_catalog."default",
    hp integer,
    attack integer,
    defense integer,
    sp_attack integer,
    sp_defense integer,
    speed integer,
    CONSTRAINT pokemon_forma_pkey PRIMARY KEY (id_forma),
    CONSTRAINT pokemon_forma_id_pokemon_fkey FOREIGN KEY (id_pokemon)
        REFERENCES public.pokemon (id_pokemon) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pokemon_forma
    OWNER to postgres;