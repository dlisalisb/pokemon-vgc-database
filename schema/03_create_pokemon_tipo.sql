-- Table: public.pokemon_tipo

-- DROP TABLE IF EXISTS public.pokemon_tipo;

CREATE TABLE IF NOT EXISTS public.pokemon_tipo
(
    id_pokemon integer NOT NULL,
    id_tipo integer NOT NULL,
    CONSTRAINT pokemon_tipo_pkey PRIMARY KEY (id_pokemon, id_tipo),
    CONSTRAINT pokemon_tipo_id_pokemon_fkey FOREIGN KEY (id_pokemon)
        REFERENCES public.pokemon (id_pokemon) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT pokemon_tipo_id_tipo_fkey FOREIGN KEY (id_tipo)
        REFERENCES public.tipo (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pokemon_tipo
    OWNER to postgres;