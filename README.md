# Olist E-Commerce Data Analysis

## Project Overview

An end-to-end e-commerce data analysis project built using the Brazilian E-Commerce Public Dataset by Olist.

The project analyzes sales performance, product categories, payment methods, sellers, customer geography, delivery performance, and customer reviews using Databricks, SQL, Python, and GitHub.

## Business Problem

The objective is to analyze e-commerce transaction data and identify meaningful business insights related to:

- Revenue and order performance
- Monthly sales trends
- Product category performance
- Payment method usage
- Seller contribution
- Customer geography
- Delivery performance
- Customer satisfaction and reviews

## Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

The dataset contains approximately 100,000 orders from the Brazilian e-commerce marketplace Olist.

### Main Tables

- Customers
- Orders
- Order Items
- Payments
- Reviews
- Products
- Sellers
- Geolocation
- Product Category Translation

## Tools & Technologies

- **Databricks Free Edition** — Data ingestion, validation, SQL analysis, and dashboard
- **SQL** — Data analysis and business insights
- **Python** — Data inspection and analytical support
- **GitHub** — Version control and project documentation
- **Kaggle** — Dataset source

## Data Validation

The project includes validation checks for:

- Row counts
- Null values
- Duplicate primary keys
- Foreign key relationships
- Date consistency
- Payment values
- Product prices
- Freight values
- Review score validity
- Product category translations

Validation queries are available in:

`sql/01_data_validation.sql`

## SQL Business Analysis

The analysis covers:

1. Overall sales performance
2. Monthly revenue trends
3. Product category performance
4. Payment method performance
5. Seller performance
6. Customer geography
7. Delivery time vs. review score
8. Review score distribution
9. Order status analysis
10. Product value vs. freight value

Business analysis queries are available in:

`sql/02_business_analysis.sql`

## Dashboard

### Olist E-Commerce Sales & Customer Analytics

The interactive Databricks dashboard provides an executive overview of:

- Total Product Revenue
- Average Order Value
- Total Orders
- Top Product Categories
- Monthly Revenue Trends
- Payment Methods
- Top Sellers
- Delivery Time vs. Review Score
- Revenue by Customer State
- Order Status Distribution
- Review Score Distribution
- Product Value vs. Freight Value

## Key Business Insights

- Total product revenue analyzed: **R$13.59M**
- Total orders: **99,441**
- Average Order Value including freight (orders with items): **R$160.58**
- Average delivery time: **12.5 days**
- Average valid review score: **4.09 / 5**
- Health & Beauty generated the highest product revenue among categories.
- São Paulo generated the highest customer-state revenue.
- Credit card was the most frequently recorded payment method in the dataset.
- Higher review scores were associated with shorter average delivery times.

> Delivery time and review score are presented as an association in the analysis and should not be interpreted as proof of causation.

## Project Structure

```text
olist-ecommerce-data-analysis/
│
├── docs/
│   └── business_insights.md
│
├── notebooks/
│
├── sql/
│   ├── 01_data_validation.sql
│   └── 02_business_analysis.sql
│
├── .gitignore
└── README.md
```

## Skills Demonstrated

- SQL data analysis
- Data validation
- Data quality checks
- Aggregation and business metrics
- JOIN operations
- Date and time analysis
- E-commerce analytics
- Dashboard development
- Business insight generation
- Databricks
- Git and GitHub

## Project Outcome

This project demonstrates an end-to-end Data Analyst workflow:

**Data → Validation → SQL Analysis → Business Insights → Dashboard → Documentation**

## Author

**Sai Prakash**

Aspiring Data Analyst | SQL | Python | Excel | Databricks | Data Visualization