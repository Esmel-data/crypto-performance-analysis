# crypto-performance-analysis
Data analytics pipeline — API → Python → SQL → Power BI | Return &amp; Risk analysis of BTC, ETH, BNB, SOL, XRP over 365 days

# Crypto Performance Analysis
### BTC · ETH · BNB · SOL · XRP — Return & Risk Analysis (365 Days)

> Which cryptocurrency delivers the best return-to-risk ratio over the last 365 days?


## 1. Project Overview

This project analyzes the performance of five major cryptocurrencies —
BTC, ETH, BNB, SOL, and XRP — over a rolling 365-day period.
Data was collected via API calls and processed through a full
analytics pipeline designed to support portfolio allocation decisions.
The final deliverable is a two-page Power BI decision dashboard
targeting non-technical managers and directors.


## 2. Dataset

| Item | Details |
|---|---|
| Source | API call (crypto market data) |
| Datasets | `crypto_metrics` (5 rows × 7 cols) · `historical_crypto_prices` (395 rows × 24 cols) |
| Period | April 2025 → April 2026 |
| Measure variables | annual_return_pct, risk_level_pct, return_risk_ratio, price_range_usd, daily returns |
| Segmentation variables | risk_category, performance_label, return_direction, crypto_name |
| Temporal variables | Date, month, quarter, year |


## 3. Tools & Technologies

| Tool | Role in pipeline |
|---|---|
| Python (Pandas) | Data collection, cleaning, feature engineering, normalization, CSV export |
| SQL (MySQL Workbench) | 10 analytical queries covering return, risk, efficiency, seasonality, and behavior |
| Power BI | 2-page decision dashboard — KPI cards, scatter plot, stacked bar, line chart, slicers |
| Gamma | Analytical report presentation for portfolio and client delivery |


## 4. Project Steps

1. Data Collection (API → Python)
   Raw data retrieved via API calls and loaded into two pandas DataFrames.
   Initial exploration confirmed structure, types, and missing values.

2. Data Cleaning & Feature Engineering (Python)
   Date column converted to datetime. First row dropped (no calculable return).
   Prices normalized Min-Max (0–1) for cross-coin comparison.
   11 new business variables created: `risk_category`, `performance_label`,
   `price_range_usd`, `month`, `quarter`, `year`, and five `*_return_direction` columns.

3. SQL Analysis (MySQL Workbench)
   Both cleaned datasets imported via SQLAlchemy.
   10 queries executed covering: best annual return, lowest risk, Sharpe efficiency,
   price amplitude, average daily return, quarterly BTC cycles,
   bullish day count, risk/return correlation, and daily volatility.

4. Decision Dashboard (Power BI)
   Two-page dashboard built with DAX measures.
   Page 1 — Performance Overview: KPI cards, bar chart, scatter plot,
   donut chart, stacked bar chart, 5 slicers.
   Page 2 — Price & Trend Analysis: indexed line chart, amplitude bar chart,
   quarterly trend chart, full metrics matrix table.

5. Report & Presentation (Gamma)
   10-slide analytical presentation built in Gamma covering the full pipeline,
   SQL findings, dashboard walkthrough, business recommendations,
   and analytical limits.


## 5. Dashboard

Key visuals:
- Scatter plot positioning each coin in the risk/return space
- Stacked bar chart showing bullish vs bearish days per coin
- Indexed price line chart enabling cross-coin comparison on a 0–1 scale


## 6. Key Results & Insights

- ETH is the only top performer: sole coin with both a positive annual
  return (+36.73%) and a positive Sharpe ratio (0.51) — clear allocation priority.
- BTC is the safest, not the most profitable: lowest volatility (42.47%)
  but negative annual return (-11.64%) — suitable for defensive profiles only.
- 3 out of 5 coins are inefficient: SOL, XRP, and BTC fail to compensate
  their risk — selective allocation is essential in this market window.
- BNB offers the most consistent momentum: 199 bullish days out of 395 —
  the most regularly upward-trending coin after ETH.
- 2025Q2 was the only clearly positive quarter for BTC: seasonal pattern
  to monitor for future entry timing decisions.


## 7. How to Run

Prerequisites:
Python 3.9+
pandas, sqlalchemy, pymysql, mysql-connector-python
MySQL Workbench (local instance)
Power BI Desktop

Steps

# 1. Clone the repository
git clone https://github.com/your-username/crypto-performance-analysis.git
cd crypto-performance-analysis

# 2. Install Python dependencies
pip install pandas sqlalchemy pymysql mysql-connector-python

# 3. Run the Python notebook
jupyter notebook crypto_analysis.ipynb
# → Outputs: crypto_metrics_clean.csv + historical_crypto_prices_clean.csv

# 4. Import into MySQL
# Run the SQLAlchemy import script or use MySQL Workbench Table Import Wizard
# Execute the 10 SQL queries in /sql/queries.sql

# 5. Open Power BI
# Open crypto_dashboard.pbix in Power BI Desktop
# Refresh data source pointing to MySQL or cleaned CSV files


Dataset
Data collected via public cryptocurrency market API.
Covers April 2025 → April 2026 (365 rolling days).

Author
ESMEL  www.linkedin.com/in/esmel-amari
