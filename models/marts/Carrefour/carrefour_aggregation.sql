WITH local_data AS (
    SELECT 
        pdt_SUB_CATEGORY,
        SUM(CA) AS total_revenue_local
    FROM {{ ref('stg_carrefour_sales') }}
    GROUP BY 1
),

group_data AS (
    SELECT 
        pdt_SUB_CATEGORY,
        -- On s'assure que le barcode est cohérent ici aussi si besoin
        SUM(CA) AS total_revenue_group
    FROM {{ source('dbt_carrefour', 'crf_sales_group_data') }}
    GROUP BY 1
)

SELECT
    COALESCE(l.pdt_SUB_CATEGORY, g.pdt_SUB_CATEGORY) AS pdt_SUB_CATEGORY,
    l.total_revenue_local,
    g.total_revenue_group,
    -- Calcul de la différence
    (l.total_revenue_local - g.total_revenue_group) AS revenue_diff
FROM local_data l
FULL OUTER JOIN group_data g 
    ON l.sub_category = g.sub_category