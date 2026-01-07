select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- dbt gère souvent les montants en centimes, on divise par 100 pour avoir des dollars
    amount / 100 as amount,
    created as created_at
from dbt-tutorial.jaffle_shop.payments