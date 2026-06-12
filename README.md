# dbt Analytics Projects

End-to-end analytics engineering projects using dbt, BigQuery, and Looker Studio.

---

## Stack
- **Warehouse:** Google BigQuery
- **Transformation:** dbt Cloud
- **Visualization:** Looker Studio
- **Version Control:** GitHub

---

## Project 1: Olist Brazilian E-Commerce Analytics

### Overview
Analytics engineering project on a real Brazilian e-commerce dataset covering
orders, customers, sellers, products, payments, and reviews.

### dbt Models
models/olist/

├── staging/

│   ├── _sources.yml

│   ├── _staging.yml

│   ├── stg_orders.sql

│   ├── stg_order_items.sql

│   ├── stg_order_payments.sql

│   ├── stg_order_reviews.sql

│   ├── stg_customers.sql

│   ├── stg_sellers.sql

│   ├── stg_products.sql

│   └── stg_category_translation.sql

└── marts/

├── mart_orders.sql

├── mart_product_performance.sql

└── mart_seller_performance.sql

### Key Findings
- Total revenue reached 13.6M across 32,216 orders with average review score of 4.1
- Health & Beauty is the top revenue category, followed by Watches & Gifts and Bed Bath & Table
- Revenue spike visible around early 2018, likely driven by seasonal or promotional activity
- Top sellers are heavily concentrated — a small group of sellers contribute disproportionately high revenue
- Revenue trend shows significant growth from late 2016 through 2018

### Dashboard
- [Olist E-Commerce Dashboard](https://datastudio.google.com/reporting/8d43acaf-bc57-4d1b-a109-92959529c125)

---

## Project 2: Cafe Sales Analytics

### Overview
End-to-end analytics project starting from raw dirty data through cleaning,
dbt modeling, and dashboard visualization.

### Data Issues Handled
- Invalid entries (ERROR, UNKNOWN) across item, location, payment_method
- Missing values imputed where possible (price_per_unit from item lookup)
- total_spent recalculated from quantity × price where missing
- Standardized date formats and extracted time dimensions

### dbt Models
models/cafe_sales/

├── staging/

│   ├── sources.yml

│   ├── schema.yml

│   └── stg_cafe_sales.sql

└── marts/

├── mart_sales_by_item.sql

├── mart_sales_by_date.sql

└── mart_sales_by_location_payment.sql

### Key Findings
- Salad is the top revenue item despite mid-range transaction volume
- Payment methods evenly distributed (~33% each)
- In-store revenue slightly higher than Takeaway
- Daily revenue stable throughout 2023 with no strong seasonality

### Dashboard
- [Cafe Sales Analytics Dashboard](https://datastudio.google.com/reporting/28b33796-28d5-4d6a-9137-7e1525c65740)
