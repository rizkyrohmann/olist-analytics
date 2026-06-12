with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

order_payments as (
    select * from {{ ref('stg_order_payments') }}
),

order_reviews as (
    select * from {{ ref('stg_order_reviews') }}
),

order_items_agg as (
    select
        order_id,
        count(order_item_id) as total_items,
        sum(price) as total_price,
        sum(freight_value) as total_freight
    from order_items
    group by 1
),

payments_agg as (
    select
        order_id,
        sum(payment_value) as total_payment_value,
        max(payment_type) as payment_type,
        max(payment_installments) as payment_installments
    from order_payments
    group by 1
),

reviews_agg as (
    select
        order_id,
        avg(review_score) as avg_review_score
    from order_reviews
    group by 1
),

final as (
    select
        o.order_id,
        o.customer_id,
        c.customer_city,
        c.customer_state,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        date_diff(
            date(o.order_delivered_customer_date),
            date(o.order_estimated_delivery_date),
            day
        ) as delivery_delay_day,
        oi.total_items,
        oi.total_price,
        oi.total_freight,
        p.total_payment_value,
        p.payment_type,
        p.payment_installments,
        r.avg_review_score
    from orders o
    left join customers c using (customer_id)
    left join order_items_agg oi using (order_id)
    left join payments_agg p using (order_id)
    left join reviews_agg r using (order_id)
)

select * from final