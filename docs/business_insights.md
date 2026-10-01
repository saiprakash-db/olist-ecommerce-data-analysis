# Olist E-Commerce Analytics — Business Insights

## 1. Executive Summary

This project analyzes the Brazilian Olist e-commerce dataset using Databricks and SQL to understand sales performance, customer behavior, product categories, sellers, payments, delivery performance, and customer reviews.

The analysis covers approximately 99K orders and more than 112K order items. Product value totaled approximately R$13.59M, while product value plus freight totaled approximately R$15.84M.

---

## 2. Sales Performance

- Total orders with order items: **98,666**
- Product revenue: **R$13.59M**
- Freight value: **R$2.25M**
- Total product + freight value: **R$15.84M**
- Average Order Value including freight: **R$160.58**

Product value represented **85.79%** of the combined product and freight value, while freight represented **14.21%**.

---

## 3. Revenue Trend

Product revenue increased substantially throughout the dataset period.

- 2016 revenue: **R$49.79K** *(partial year)*
- 2017 revenue: **R$6.16M**
- 2018 revenue: **R$7.39M** *(partial year)*

The strongest monthly revenue period was **November 2017**, with approximately **R$1.01M** in product revenue.

September 2018 was excluded from the monthly trend because the dataset contains only one order for that month, making it an incomplete final period.

---

## 4. Product Category Performance

The highest-revenue product categories included:

| Category | Product Revenue |
|---|---:|
| Health & Beauty | R$1.26M |
| Watches & Gifts | R$1.21M |
| Bed Bath Table | R$1.04M |
| Sports & Leisure | R$988.05K |
| Computers & Accessories | R$911.95K |

Health & Beauty generated the highest product revenue among the analyzed categories.

---

## 5. Payment Method Performance

Credit card payments represented the largest payment method in the dataset.

| Payment Method | Records | Total Payment Value |
|---|---:|---:|
| Credit Card | 76,795 | R$12.54M |
| Boleto | 19,784 | R$2.87M |
| Voucher | 5,775 | R$379.44K |
| Debit Card | 1,529 | R$217.99K |

Credit card transactions accounted for the majority of recorded payment value.

---

## 6. Seller Performance

The top seller by product revenue generated approximately **R$229.47K** from 1,132 orders.

The second-highest seller generated approximately **R$222.78K** from 358 orders.

This shows that seller order volume and revenue are not necessarily proportional. Some sellers generated relatively high revenue from fewer orders, indicating differences in average order or item value.

---

## 7. Customer Geography

São Paulo (SP) had the highest number of purchasing customers and the highest product revenue.

- SP customers: **39,981**
- SP product revenue: **R$5.20M**
- RJ customers: **12,303**
- RJ product revenue: **R$1.82M**
- MG customers: **11,178**
- MG product revenue: **R$1.59M**

São Paulo therefore represented the largest customer and revenue concentration in the dataset.

---

## 8. Delivery Time and Customer Reviews

Average delivery time varied substantially across review scores.

| Review Score | Average Delivery Time |
|---:|---:|
| 1 | 21.25 days |
| 2 | 16.61 days |
| 3 | 14.20 days |
| 4 | 12.25 days |
| 5 | 10.63 days |

Lower review scores were associated with longer average delivery times, while higher review scores were associated with shorter delivery times.

This analysis indicates an association between delivery time and review score; it does not establish that delivery time directly caused the review score.

---

## 9. Review Score Distribution

Among valid reviews:

- **5-star:** 57.78%
- **4-star:** 19.29%
- **3-star:** 8.24%
- **2-star:** 3.18%
- **1-star:** 11.51%

Overall, 4- and 5-star reviews represented **77.07%** of valid reviews.

The average valid review score was approximately **4.09 out of 5**.

---

## 10. Order Status Performance

Delivered orders represented the overwhelming majority of orders.

| Order Status | Orders | Product Revenue |
|---|---:|---:|
| Delivered | 96,478 | R$13.22M |
| Shipped | 1,107 | R$150.73K |
| Canceled | 625 | R$95.24K |
| Unavailable | 609 | R$2.01K |
| Invoiced | 314 | R$61.53K |
| Processing | 301 | R$60.44K |

There were **99,436 orders excluding orders with a `created` status**.

---

## 11. Key Business Takeaways

1. **Credit cards were the dominant payment method**, accounting for the largest share of recorded payment value.
2. **Health & Beauty generated the highest product revenue** among the product categories analyzed.
3. **São Paulo was the largest customer market**, leading both customer count and product revenue.
4. **Delivery time and review score showed a clear association**, with lower-rated orders having longer average delivery times.
5. **Delivered orders dominated the dataset**, accounting for the vast majority of order volume and product revenue.
6. **Freight represented 14.21% of combined product and freight value**, making shipping cost an important component of the overall order value.
7. **Seller revenue varied independently from order volume**, demonstrating why both metrics are useful when evaluating seller performance.

---

## 12. Dashboard

The project includes an interactive Databricks dashboard covering:

- Total Product Revenue
- Average Order Value
- Orders Excluding Created
- Payment Methods
- Top Product Categories
- Review Score Distribution
- Delivery Time by Review Score
- Monthly Revenue Trend
- Top Sellers
- Order Status
- Revenue by Customer State
- Product Value vs Freight Value