-- Table: public.laboratory_orders

CREATE TABLE IF NOT EXISTS public.laboratory_orders
(
    order_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    patient_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    message_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    panel_loinc character varying(20) COLLATE pg_catalog."default" NOT NULL,
    panel_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    collection_time timestamp without time zone NOT NULL,
    result_time timestamp without time zone NOT NULL,
    order_status character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT laboratory_orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT laboratory_orders_message_id_key UNIQUE (message_id),
    CONSTRAINT uq_order_message UNIQUE (order_id, message_id),
    CONSTRAINT fk_order_message FOREIGN KEY (message_id)
        REFERENCES public.hl7_messages (message_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_order_message_patient FOREIGN KEY (message_id, patient_id)
        REFERENCES public.hl7_messages (message_id, patient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_order_patient FOREIGN KEY (patient_id)
        REFERENCES public.patients (patient_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_order_times CHECK (result_time > collection_time)
);
