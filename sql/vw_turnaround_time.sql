-- View: public.vw_turnaround_time

CREATE OR REPLACE VIEW public.vw_turnaround_time
 AS
 SELECT order_id,
    patient_id,
    message_id,
    panel_name,
    panel_loinc,
    collection_time,
    result_time,
    round(EXTRACT(epoch FROM result_time - collection_time) / 60.0, 2) AS turnaround_minutes,
    round(EXTRACT(epoch FROM result_time - collection_time) / 3600.0, 2) AS turnaround_hours
   FROM laboratory_orders;


