# 📊 E-Commerce Sales & Customer Analytics

An end-to-end business analytics project using **MySQL and Excel** to analyse e-commerce sales, customer behaviour, product performance, regional performance, and revenue trends.

The project transforms transaction-level data into **business KPIs, SQL analysis, an Excel dashboard, and actionable recommendations**.

---

## 🎯 Project Objective

The objective of this project is to understand:

- Overall sales performance
- Monthly revenue trends
- Product and category performance
- Regional sales performance
- Customer purchasing behaviour
- Repeat customer behaviour
- Revenue contribution by category and region
- High-value customers and products

The analysis uses SQL to answer business questions and Excel to communicate the results through an executive-style dashboard.

---

## 🛠️ Tools & Technologies

![MySQL](https://img.shields.io/badge/MySQL-Database-orange)
![SQL](https://img.shields.io/badge/SQL-Analysis-blue)
![Excel](https://img.shields.io/badge/Excel-Dashboard-green)

- **MySQL**
- **SQL**
- **Microsoft Excel**
- Data Analysis
- Data Visualization
- Business Intelligence

---

# 📦 Dataset

The project uses a synthetic e-commerce transaction dataset containing:

- **500 transactions**
- **100 unique customers**
- **5 product categories**
- **4 regions**
- Transaction dates from **January to August 2026**

### Dataset Columns

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| order_date | Date of transaction |
| customer_id | Customer identifier |
| region | Customer region |
| product_id | Product identifier |
| product_name | Product name |
| category | Product category |
| unit_price | Price per unit |
| quantity | Units purchased |
| discount | Discount applied |
| revenue | Revenue generated |

---

# 📊 Key KPIs

| KPI | Result |
|---|---:|
| Total Revenue | ₹1,096,555 |
| Total Orders | 500 |
| Total Customers | 100 |
| Total Units Sold | 888 |
| Average Order Value | ₹2,193.11 |

---

# 🔍 SQL Analysis

MySQL was used to perform transaction-level and business-level analysis.

The SQL analysis includes:

- `SUM()`
- `COUNT()`
- `AVG()`
- `GROUP BY`
- `WHERE`
- `CASE`
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- `RANK()`
- `ROW_NUMBER()`
- `LAG()`
- Revenue contribution analysis
- Customer segmentation
- Monthly trend analysis

---

# 📈 Analysis Areas

## 💰 Sales Analysis

Analysed:

- Total revenue
- Total orders
- Average Order Value
- Monthly revenue trends
- Month-over-month revenue growth

### Key Finding

May was the highest-revenue month with **₹176,230**, while February recorded the lowest revenue at **₹93,152.50**.

---

## 🛍️ Category Analysis

Revenue by category:

| Category | Revenue | Revenue Share |
|---|---:|---:|
| Sports | ₹397,680 | 36.27% |
| Electronics | ₹288,330 | 26.29% |
| Lifestyle | ₹252,790 | 23.05% |
| Home | ₹115,005 | 10.49% |
| Stationery | ₹42,750 | 3.90% |

### Key Finding

**Sports** was the strongest category, contributing **36.27% of total revenue**.

Sports and Electronics together generated **62.56% of total revenue**.

---

## 🌎 Regional Analysis

| Region | Revenue | Revenue Share |
|---|---:|---:|
| North | ₹349,012.50 | 31.83% |
| South | ₹292,885.00 | 26.71% |
| West | ₹283,877.50 | 25.89% |
| East | ₹170,780.00 | 15.57% |

### Key Finding

**North** was the strongest region, generating **₹349,012.50** and contributing **31.83% of total revenue**.

---

## 🏆 Product Performance

Top products by revenue:

| Product | Category | Revenue |
|---|---|---:|
| Running Shoes | Sports | ₹303,810 |
| Backpack | Lifestyle | ₹180,375 |
| Power Bank | Electronics | ₹145,140 |
| Wireless Earbuds | Electronics | ₹143,190 |
| Desk Lamp | Home | ₹115,005 |

### Key Finding

**Running Shoes** was the highest-revenue product, generating **₹303,810**.

---

# 👥 Customer Analysis

Customer-level analysis was performed to understand:

- Purchase frequency
- Total customer spending
- Units purchased
- High-value customers
- Repeat purchasing behaviour
- Revenue contribution

### Key Findings

- **100 unique customers** were identified.
- **95 customers made repeat purchases.**
- **5 customers were one-time customers.**
- Repeat customers had an average spend of **₹11,441.26**.
- One-time customers had an average spend of **₹1,927**.

> The 95% figure represents the share of customers classified as repeat customers within this dataset; it should not be interpreted as a long-term retention rate.

---

# 📊 Excel Dashboard

An Excel dashboard was created to provide an executive-level summary of the analysis.

### Dashboard Includes

- Total Revenue
- Total Orders
- Total Customers
- Total Units Sold
- Average Order Value
- Monthly Revenue Trend
- Revenue by Category
- Revenue Share by Region
- Top Products
- Customer Analysis
- Customer Segmentation

---

# 💡 Business Insights & Recommendations

### 1. Focus on high-performing categories

Sports generated **36.27% of total revenue**.

**Recommendation:** Prioritize inventory and promotional campaigns for high-performing Sports products.

---

### 2. Leverage Sports and Electronics

Together, Sports and Electronics contributed **62.56% of total revenue**.

**Recommendation:** Test cross-category bundles and targeted promotions around these categories.

---

### 3. Strengthen North-region performance

North generated the highest regional revenue at **₹349,012.50**.

**Recommendation:** Maintain strong product availability in North and test region-specific promotions.

---

### 4. Investigate high-performing months

May generated the highest monthly revenue at **₹176,230**.

**Recommendation:** Identify the factors behind May's performance and replicate successful strategies during weaker months.

---

### 5. Promote high-performing products

Running Shoes generated **₹303,810**, making it the highest-revenue product.

**Recommendation:** Use high-performing products as flagship products for promotions and cross-selling.

---

### 6. Focus on repeat customers

95% of customers in the dataset made repeat purchases.

**Recommendation:** Use loyalty programs and personalized offers to encourage continued purchasing behaviour.

---

# 🏗️ Project Workflow

```text
E-Commerce Transaction Dataset
             │
             ▼
       MySQL Database
             │
             ▼
       Data Validation
             │
             ▼
        SQL Analysis
             │
      ┌──────┼────────┐
      ▼      ▼        ▼
    Sales  Product  Customer
    Analysis Analysis Analysis
      │      │        │
      └──────┼────────┘
             ▼
       KPI Calculation
             │
             ▼
       Excel Dashboard
             │
             ▼
   Business Insights
             │
             ▼
     Recommendations
## 📂 Project Structure

```text
ecommerce-sales-customer-analytics/
│
├── ecommerce_orders.csv
├── schema.sql
├── analysis_queries.sql
├── ecommerce_dashboard.xlsx
├── README.md
└── ...
```

---

## ⚙️ How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/itzchirag00/ecommerce-sales-customer-analytics.git
cd ecommerce-sales-customer-analytics
```

### 2. Create the Database

Open `schema.sql` in MySQL Workbench and execute it.

This creates the `ecommerce_analytics` database and the `orders` table.

### 3. Load the Dataset

Import `ecommerce_orders.csv` into the `orders` table.

### 4. Run SQL Analysis

Open `analysis_queries.sql` and execute the queries in MySQL Workbench.

The queries generate:

- Sales KPIs
- Category analysis
- Regional analysis
- Product rankings
- Customer rankings
- Customer segmentation
- Monthly trends
- Revenue contribution
- Window-function analysis

### 5. Open the Excel Dashboard

Open `ecommerce_dashboard.xlsx` to explore the dashboard and supporting analysis sheets.

---

## 📚 Key Learning Outcomes

Through this project, I gained hands-on experience in:

- Translating business questions into SQL queries
- Working with relational databases
- Performing sales and customer analysis
- Writing CTE-based SQL queries
- Using SQL window functions
- Applying ranking techniques
- Calculating business KPIs
- Analysing customer purchasing behaviour
- Building Excel dashboards
- Identifying business trends
- Converting analytical findings into recommendations
- Presenting data in a business-friendly format

---

## 🔮 Future Improvements

Potential enhancements include:

- Power BI interactive dashboard
- RFM customer analysis
- Profit and margin analysis
- Customer lifetime value analysis
- Sales forecasting
- Automated data pipeline
- Larger real-world dataset
- Interactive analytics application

---

## 👨‍💻 Author

**Chirag Sood**

B.E. Computer Science

Thapar Institute of Engineering & Technology

**GitHub:** [itzchirag00](https://github.com/itzchirag00)

**LinkedIn:** [Chirag Sood](https://linkedin.com/in/chiragsood07)

---

## 📜 License

This project is intended for educational and personal portfolio use.
