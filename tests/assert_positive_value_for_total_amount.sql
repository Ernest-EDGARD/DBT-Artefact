--Test singulier Un test singulier est un script SQL qui ne doit renvoyer aucune ligne. Si la requête renvoie des résultats, dbt considère que le test a échoué.

select
  order_id,
  sum(amount) as total_amount
from {{ ref('stg_stripe__payment') }}
group by 1
having (total_amount < 0)