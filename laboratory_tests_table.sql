-- Table: public.laboratory_tests

CREATE TABLE IF NOT EXISTS public.laboratory_tests
(
    loinc_code character varying(20) COLLATE pg_catalog."default" NOT NULL,
    test_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    unit character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT laboratory_tests_pkey PRIMARY KEY (loinc_code)
);
