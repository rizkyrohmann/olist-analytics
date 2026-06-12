# Olist E-Commerce Analytics

End-to-end analytics engineering project built on the Olist Brazilian E-Commerce dataset (100K+ transactions).

## Tech Stack

| Layer | Tool |
|---|---|
| Data Warehouse | BigQuery (asia-southeast2) |
| Transformation | dbt Cloud |
| Visualization | Looker Studio |
| Version Control | GitHub |

## Architecture

```
Raw Data (BigQuery) → dbt Staging Models → dbt Mart Models → Looker Studio Dashboard
```

## Project Structure

```
models/
├── staging/          # 8 views — cleaning & renaming raw sources
│   ├── stg_orders
│   ├── stg_order_items
│   ├── stg_customers
│   ├── stg_products
│   ├── stg_sellers
│   ├── stg_order_payments
│   ├── stg_order_reviews
│   └── stg_category_translation
└── marts/            # 3 tables — business logic
    ├── mart_orders
    ├── mart_product_performance
    └── mart_seller_performance
```

## Dashboard

[View Live Dashboard →](https://datastudio.google.com/reporting/8d43acaf-bc57-4d1b-a109-92959529c125)

![Dashboard Preview](https://github.com/rizkyrohmann/olist-analytics/blob/de7f00479b3e5ba0d28b3e83cc6bf6c1bc0f18ff/Screenshot%202026-06-08%20182924.png)

## Key Metrics

- **Total Revenue:** R$ 13.6M
- **Total Orders:** 32,216
- **Average Review Score:** 4.1 / 5
- **Top Category:** Health & Beauty

## Data Sources

[Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — 9 tables, 100K+ orders, 2016–2018.

## How to Run

1. Clone this repo
2. Set up BigQuery connection in dbt Cloud
3. Run `dbt run` to build all models
4. Run `dbt test` to validate data quality
