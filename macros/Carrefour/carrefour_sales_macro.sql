{% macro get_stg_local_sales(table_name) %}

SELECT
    -- On force le type string pour le code-barres pour la cohérence
    CAST(barcode_ean13 AS STRING) AS barcode,
    product_CATEGORY,
    pdt_SUB_CATEGORY,
    DATE,
    -- On ajoute souvent le prix ou le revenu ici pour la suite de ton exercice
    revenue, 
    site_key
FROM {{ source('dbt-carrefour', table_name) }} -- Ici, on utilise la variable table_name

{% endmacro %}