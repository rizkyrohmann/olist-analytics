with base as (
    select * from {{ ref('stg_cafe_sales') }}
)

select 
    item,
    count(transaction_id)       as total_transactions,
    sum(quantity)               as total_quantity_sold,
    sum(total_spent)            as total_revenue,
    round(avg(total_spent), 2)  as avg_transaction_value
from base
group by 1 
order by total_revenue desc