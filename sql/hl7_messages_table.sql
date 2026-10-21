-- Table: public.hl7_messages

CREATE TABLE IF NOT EXISTS public.hl7_messages
(
    message_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    order_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    patient_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    panel character varying(10) COLLATE pg_catalog."default" NOT NULL,
    result_count integer NOT NULL,
    obx_count integer NOT NULL,
    validation_status character varying(30) COLLATE pg_catalog."default" NOT NULL,
    parsing_status character varying(30) COLLATE pg_catalog."default",
    validation_error text COLLATE pg_catalog."default",
    CONSTRAINT hl7_messages_pkey PRIMARY KEY (message_id),
    CONSTRAINT hl7_messages_order_id_key UNIQUE (order_id),
    CONSTRAINT uq_message_patient UNIQUE (message_id, patient_id),
    CONSTRAINT fk_message_patient FOREIGN KEY (patient_id)
        REFERENCES public.patients (patient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT hl7_messages_result_count_check CHECK (result_count >= 0),
    CONSTRAINT hl7_messages_obx_count_check CHECK (obx_count >= 0)
);
