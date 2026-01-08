WITH prx AS (
    {{ get_stg_local_sales('crf_prx_sales_fr_data') }}
),
sup AS (
    {{ get_stg_local_sales('crf_sup_sales_fr_data') }}
),
hyp AS (
    {{ get_stg_local_sales('crf_hyp_sales_fr_data') }}
)

SELECT * FROM prx
UNION ALL
SELECT * FROM sup
UNION ALL
SELECT * FROM hyp