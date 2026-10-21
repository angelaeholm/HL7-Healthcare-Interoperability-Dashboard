-- View: public.vw_panel_volume

CREATE OR REPLACE VIEW public.vw_panel_volume
 AS
 WITH panel_summary AS (
         SELECT o.panel_name,
            o.panel_loinc,
            count(DISTINCT o.order_id) AS total_orders,
            count(r.result_id) AS total_results
           FROM laboratory_orders o
             LEFT JOIN laboratory_results r ON o.order_id::text = r.order_id::text
          GROUP BY o.panel_name, o.panel_loinc
        )
 SELECT panel_name,
    panel_loinc,
    total_orders,
    total_results,
    round(100.0 * total_orders::numeric / NULLIF(sum(total_orders) OVER (), 0::numeric), 2) AS order_percentage,
    round(100.0 * total_results::numeric / NULLIF(sum(total_results) OVER (), 0::numeric), 2) AS result_percentage,
    round(total_results::numeric / NULLIF(total_orders, 0)::numeric, 2) AS avg_results_per_order
   FROM panel_summary;

