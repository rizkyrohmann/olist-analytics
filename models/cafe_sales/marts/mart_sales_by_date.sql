with base as (
    select * from {{ ref('stg_cafe_sales') }}
    where transaction_date is not null
)

select
    transaction_date,
    transaction_year,
    transaction_month,
    month_name,
    day_of_week,
    count(transaction_id)       as total_transactions,
    sum(total_spent)            as daily_revenue,
    round(avg(total_spent), 2)  as avg_transaction_value
from base
group by 1, 2, 3, 4, 5
order by 1