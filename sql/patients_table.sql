-- Table: public.patients

CREATE TABLE IF NOT EXISTS public.patients
(
    patient_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    sex character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT patients_pkey PRIMARY KEY (patient_id)
);
