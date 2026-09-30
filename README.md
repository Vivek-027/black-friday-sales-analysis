# Black Friday Sales — End-to-End Data Analytics Project

##  Project Overview
This project analyzes **550,068 Black Friday retail transactions** to understand customer demographics, spending behavior, product performance, and location-based trends. The same 13 business questions were answered across **four tools** ( Python, SQL, Power BI, and Excel/Google Sheets ) to demonstrate the same analysis expressed through different technologies, with results cross-validated between them.
This is a pure **analytics/BI project** ,the goal is to explain what happened and why , using statistics, SQL queries, and interactive dashboards.

##  Dataset
- **Source:**  [Black Friday Sales dataset (Kaggle)](https://www.kaggle.com/datasets/sdolezel/black-friday)
- **Local copy:** [Dataset/Black_friday_sales_dataset.csv](Dataset/Black_friday_sales_dataset.csv)
- **Size:** 550,068 rows, 12 columns
- **Fields:** User_ID, Product_ID, Gender, Age, Occupation, City_Category, Stay_In_Current_City_Years, Marital_Status, Product_Category_1/2/3, Purchase



## Business Questions Answered

**Demographics & Spending**
1. Does gender affect purchase amount?
2. Which age group spends the most (total and average)?
3. Does marital status affect spending behavior?
4. Which occupation categories generate the highest average/total purchase?
   

**Location**

5. Which city category (A/B/C) generates the most revenue?
6. Does years lived in current city affect spending?

**Product Analysis**

7. Which product categories are purchased most frequently?
8. Which product categories generate the highest total revenue?
9. What's the distribution of purchase amounts?

**Customer Level**

10. Who are the top 10 spending customers?
11. Do specific age+gender segments disproportionately drive revenue?

**Cross Analysis**

12. Is there a relationship between occupation and city category?
13. Which numeric fields correlate with purchase amount?

##  Tools & What Each Contributed

| Tool | Role |
|---|---|
| **Python (pandas, matplotlib, seaborn)** | Data cleaning, EDA, and visualizations in a Jupyter notebook |
| **MySQL** | Same cleaning + 13 business questions written as SQL queries |
| **Power BI** | 3-page interactive dashboard with navigation sidebar, slicers, and a custom color theme |
| **Excel / Google Sheets** | Pivot tables, charts, KPI cards, and a summary dashboard sheet |

##  Key Insights

- **Gender:** Men drive far more revenue (₹3.91B vs ₹1.19B) — mainly from 3x more transactions, not higher spend per visit.
- **Age:** The 26-35 age group leads in *total* revenue (transaction volume), while 51-55 has the highest *average* spend per transaction.
- **Marital Status:** Has almost no effect on spend per transaction (~₹9,265 vs ~₹9,261) — unmarried customers just transact more often.
- **Occupation:** Occupation code 4 leads in total revenue (volume); code 17 leads in average spend per transaction.
- **Location:** City B leads in total revenue (volume-driven); City C has the highest average purchase per transaction.
- **Tenure:** Years lived in a city has virtually no effect on spending (~9,180 to ~9,320 across all groups).
- **Popularity vs. Revenue mismatch:** Product Category 5 is bought most often, but Category 1 earns nearly double the revenue — proving popularity and profitability aren't the same thing.
- **Distribution:** Purchase amounts are moderately right-skewed (mean ₹9,264 > median ₹8,047) — most transactions cluster mid-range, with a smaller high-value tail.
- **Biggest single finding:** **Males aged 26-35 alone drive 31% of total company revenue** — more than the bottom 9 demographic segments combined.
- **Anomaly:** City C leads in average spend across almost every occupation, *except* Occupation 8, which spends most in City A.
- **Correlation:** Occupation (+0.02) and Marital Status (~0.00) show no meaningful relationship with Purchase; Product Category codes show moderate correlation, though this reflects category *codes*, not real quantities.

---

## Repository Structure

black-friday-analytics-project/
├── python/
│   └── Black_Friday_Analytics_Project.ipynb
├── sql/
│   └── black_friday_analysis.sql
├── powerbi/
│   ├── Black_Friday_Dashboard.pbix
│   └── Black_Friday_Executive_Theme.json
├── excel/
│   └── Black_Friday_Dashboard.xlsx
├── screenshots/
│   ├── powerbi_overview.png
│   ├── powerbi_customer_occupation.png
│   ├── powerbi_product_analysis.png
│   └── excel_dashboard.png
└── README.md
```

---

## 📷 Dashboard Previews
*(Add screenshots of your Power BI pages and Excel dashboard here before publishing)*

---

## 🧠 What This Project Demonstrates
- Data cleaning and handling of missing values (both statistically justified, not just dropped)
- Exploratory Data Analysis with clear business framing, not just charts for their own sake
- SQL proficiency: GROUP BY, aggregations, window-style ranking, manual correlation calculation
- Cross-tool consistency: identical results validated across 4 independent platforms


- Dashboard design: interactive filtering (slicers), multi-page navigation, custom theming

