# Sales Analysis Using SQL

## Project Overview

This project analyzes the Sample Superstore sales dataset using MySQL to identify sales trends, profitable products, customer segment performance, and regional opportunities.

## Objectives

- Analyze overall sales, profit, and quantity sold.
- Identify top-selling and loss-making products.
- Analyze monthly and yearly revenue trends.
- Compare regional and customer segment performance.
- Evaluate profitability across discount levels and shipping modes.
- Develop data-driven business recommendations.

## Tools and Technologies

- MySQL Server 8.0
- MySQL Command Line Client
- SQL
- Visual Studio Code
- Git and GitHub

## Dataset

- Dataset: Sample Superstore
- Imported records: 9,994
- Date range: January 3, 2014 – December 30, 2017
- Key fields: Order Date, Ship Date, Region, Product Name, Sales, Quantity, Discount, and Profit

## SQL Skills Demonstrated

- SELECT, WHERE, GROUP BY, and ORDER BY
- Aggregate functions: SUM, COUNT, MIN, and MAX
- HAVING and LIMIT
- Date functions: YEAR, MONTH, and STR_TO_DATE
- Conditional aggregation and NULL checks
- Profit margin calculations
- Business KPI analysis

## Key Findings

- The West region generated the highest sales and profit among the four regions.
- Consumer customers contributed the largest share of revenue.
- Home Office had the highest profit margin among the three customer segments.
- November 2017 was the highest-revenue month in the results analyzed.
- Copiers were the most profitable subcategory in the query results.
- Some products and high-discount groups recorded negative total profit.

## Data Quality

The imported table contains 9,994 records. Initial checks found no missing values in the selected date, sales, profit, and quantity fields.

The import generated warnings that require further investigation before the dataset can be considered fully validated.

## Project Structure

```text
sales-analysis-using-sql/
├── data/
│   └── Sample-Superstore.csv
├── sql/
│   └── sales_analysis.sql
├── screenshots/
└── README.md
```

## Business Recommendations

- Investigate products with persistent negative profit.
- Review high-discount transactions and their effect on margins.
- Study the Central region's lower profit margin.
- Explore opportunities to grow the Home Office segment.
- Monitor monthly revenue and profit trends.

## Conclusion

This project demonstrates how SQL can transform raw sales records into useful business insights for sales performance monitoring and decision-making.

## Author

Add your name and GitHub profile here.


## Project Screenshots

### Sales KPIs
![Sales KPIs](screenshots/sales-kpis.png)


### Yearly Sales Analysis
![Yearly Sales](screenshots/yearly-sales.png)

### Regional Performance
![Regional Analysis](screenshots/regional-analysis.png)

### Loss-Making Products
![Loss Products](screenshots/loss-products.png)
