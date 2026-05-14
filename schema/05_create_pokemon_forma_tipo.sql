-- Table: public.pokemon_forma_tipo

-- DROP TABLE IF EXISTS public.pokemon_forma_tipo;

CREATE TABLE IF NOT EXISTS public.pokemon_forma_tipo
(
    id_forma integer NOT NULL,
    id_tipo integer NOT NULL,
    CONSTRAINT pokemon_forma_tipo_pkey PRIMARY KEY (id_forma, id_tipo),
    CONSTRAINT pokemon_forma_tipo_id_forma_fkey FOREIGN KEY (id_forma)
        REFERENCES public.pokemon_forma (id_forma) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT pokemon_forma_tipo_id_tipo_fkey FOREIGN KEY (id_tipo)
        REFERENCES public.tipo (id_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pokemon_forma_tipo
    OWNER to postgres;