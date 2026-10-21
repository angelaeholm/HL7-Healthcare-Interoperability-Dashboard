-- Table: public.laboratory_results

CREATE TABLE IF NOT EXISTS public.laboratory_results
(
    result_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    order_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    message_id character varying(30) COLLATE pg_catalog."default" NOT NULL,
    observation_number integer NOT NULL,
    loinc_code character varying(20) COLLATE pg_catalog."default" NOT NULL,
    result_value numeric(12,4) NOT NULL,
    unit character varying(30) COLLATE pg_catalog."default" NOT NULL,
    result_status character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT laboratory_results_pkey PRIMARY KEY (result_id),
    CONSTRAINT uq_order_observation UNIQUE (order_id, observation_number),
    CONSTRAINT uq_order_test UNIQUE (order_id, loinc_code),
    CONSTRAINT fk_result_order FOREIGN KEY (order_id)
        REFERENCES public.laboratory_orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_result_order_message FOREIGN KEY (order_id, message_id)
        REFERENCES public.laboratory_orders (order_id, message_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_result_test FOREIGN KEY (loinc_code)
        REFERENCES public.laboratory_tests (loinc_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
