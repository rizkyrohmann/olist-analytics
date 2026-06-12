with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

category_translation as (
    select * from {{ ref('stg_category_translation') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select
        p.product_id,
        coalesce(ct.product_category_name_english, p.product_category_name) as product_category,
        count(distinct oi.order_id) as total_orders,
        sum(oi.price) as total_revenue,
        avg(oi.price) as avg_price,
        sum(oi.freight_value) as total_freight
    from order_items oi
    left join products p using (product_id)
    left join category_translation ct on p.product_category_name = ct.product_category_name
    left join orders o using (order_id)
    where o.order_status = 'delivered'
    group by 1, 2
)

select * from final