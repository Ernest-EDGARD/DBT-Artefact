WITH prx AS (
    {{ get_carrefour_sales_macro('crf_prx_sales_fr_data') }}
),
sup AS (
    {{ get_carrefour_sales_macro('crf_sup_sales_fr_data') }}
),
hyp AS (
    {{ get_carrefour_sales_macro('crf_hyp_sales_fr_data') }}
)

SELECT * FROM prx
UNION ALL
SELECT * FROM sup
UNION ALL
SELECT * FROM hyp