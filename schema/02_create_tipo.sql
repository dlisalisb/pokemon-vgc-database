-- Table: public.tipo

-- DROP TABLE IF EXISTS public.tipo;

CREATE TABLE IF NOT EXISTS public.tipo
(
    id_tipo integer NOT NULL DEFAULT nextval('tipo_id_tipo_seq'::regclass),
    nome character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo),
    CONSTRAINT tipo_nome_key UNIQUE (nome)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tipo
    OWNER to postgres;