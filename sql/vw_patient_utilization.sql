-- View: public.vw_patient_utilization

CREATE OR REPLACE VIEW public.vw_patient_utilization
 AS
 SELECT p.patient_id,
    p.last_name,
    p.first_name,
    p.date_of_birth,
    p.sex,
    count(DISTINCT o.order_id) AS total_orders,
    count(r.result_id) AS total_results,
    count(DISTINCT o.panel_loinc) AS unique_panel_types,
    string_agg(DISTINCT m.panel::text, ', '::text ORDER BY (m.panel::text)) AS panel_combination
   FROM patients p
     LEFT JOIN laboratory_orders o ON p.patient_id::text = o.patient_id::text
     LEFT JOIN hl7_messages m ON o.message_id::text = m.message_id::text
     LEFT JOIN laboratory_results r ON o.order_id::text = r.order_id::text
  GROUP BY p.patient_id, p.last_name, p.first_name, p.date_of_birth, p.sex;


