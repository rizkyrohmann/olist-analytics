with base as (
    select * from {{ ref('stg_cafe_sales') }}
    where location is not null
      and payment_method is not null
)

select
    location,
    payment_method,
    count(transaction_id)       as total_transactions,
    sum(total_spent)            as total_revenue,
    round(avg(total_spent), 2)  as avg_transaction_value
from base
group by 1, 2
order by location, total_revenue desc