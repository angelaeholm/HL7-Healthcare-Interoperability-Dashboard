-- View: public.vw_hl7_performance


CREATE OR REPLACE VIEW public.vw_hl7_performance
 AS
 SELECT message_id,
    order_id,
    patient_id,
    panel,
    result_count,
    obx_count,
    validation_status,
    parsing_status,
    validation_error,
    validation_status::text = 'PASSED'::text AS validation_pass,
    parsing_status::text = 'PASSED'::text AS parsing_pass,
    result_count = obx_count AS obx_count_match
   FROM hl7_messages;


