with source as (
    select * from {{ source('cafe_sales_raw', 'cafe_sales_cleaned') }}
),

staged as (
    select
        transaction_id,
        item,
        quantity,
        price_per_unit,
        total_spent,
        payment_method,
        location,
        transaction_date,
        extract(year from transaction_date) as transaction_year,
        extract(month from transaction_date) as transaction_month,
        format_date('%A', transaction_date)  as day_of_week,
        format_date('%B', transaction_date) as month_name
    from source
    where transaction_id is not null
)

select * from staged