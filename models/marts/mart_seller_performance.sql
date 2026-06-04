with order_items as (
    select * from {{ ref('stg_order_items') }}
),

sellers as (
    select * from {{ ref('stg_sellers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

reviews as (
    select * from {{ ref('stg_order_reviews') }}
),

reviews_agg as (
    select
        order_id,
        avg(review_score) as avg_review_score
    from reviews
    group by order_id
),

final as (
    select
        s.seller_id,
        s.seller_city,
        s.seller_state,
        count(distinct oi.order_id) as total_orders,
        sum(oi.price) as total_revenue,
        avg(oi.price) as avg_order_value,
        avg(r.avg_review_score) as avg_review_score
    from order_items oi
    left join sellers s using (seller_id)
    left join orders o using (order_id)
    left join reviews_agg r using (order_id)
    where o.order_status = 'delivered'
    group by 1, 2, 3
)

select * from final