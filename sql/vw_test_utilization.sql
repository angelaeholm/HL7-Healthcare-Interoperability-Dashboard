-- View: public.vw_test_utilization

CREATE OR REPLACE VIEW public.vw_test_utilization
 AS
 SELECT t.test_name,
    t.loinc_code,
    t.unit,
    count(r.result_id) AS total_observations,
    count(DISTINCT r.order_id) AS total_orders,
    round(100.0 * count(r.result_id)::numeric / NULLIF(sum(count(r.result_id)) OVER (), 0::numeric), 2) AS result_percentage
   FROM laboratory_tests t
     LEFT JOIN laboratory_results r ON t.loinc_code::text = r.loinc_code::text
  GROUP BY t.test_name, t.loinc_code, t.unit;


