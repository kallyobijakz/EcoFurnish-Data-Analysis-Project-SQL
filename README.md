# EcoFurnish-Data-Analysis-Project-SQL


## Overview
EcoFurnish is a leading provider of eco-friendly furniture, committed to sustainable sourcing and creating stylish, environmentally responsible pieces. Operating through both online platforms and physical stores, EcoFurnish offers a diverse range of products, from office chairs to bedroom sets.

In partnership with 10Alytics, a data-driven analytics company, this project utilizes PostgreSQL to analyze sales, inventory, and customer data to provide valuable insights into EcoFurnish’s operations and enhance decision-making processes.

## Objectives
This analysis aims to achieve the following:

Customer Purchase Insights:
Retrieve customer names alongside the quantity of products they purchased, including customers who haven’t made any purchases.

Sales and Customer Information:
Extract all sales_id, sale_date, and customer_email details, ensuring inclusion of sales records without customer information where applicable.

Product Sales Data:
Display all product_id values sold, accompanied by the customer’s first name.
Retrieve all product names, casting their prices as text for consistency across price representations.

Purchase Amounts:
Display customer names (first and last) with the sale amount for purchased products or “No amount” if no sale exists.

Product Stock Levels:
List all products and show the total quantity sold, displaying a 0 for products with no recorded sales.
Classify products by stock levels, with labels for "Low Stock" (less than 10 units), "Medium Stock" (10-50 units), and "High Stock" (more than 50 units).

Date-Based Sales Analysis:
Extract sale information, including sale_id, sale_date, and the sale year.
Segment sales by quarter based on the sale date, labeling as “Q1” (January to March), “Q2” (April to June), “Q3” (July to September), or “Q4” (October to December).

## Technologies Used
The analysis was conducted using PostgreSQL. 10Alytics contributed high-level data expertise to design queries and organize the outputs, ensuring actionable insights for EcoFurnish.

## Key SQL Queries

Customer Purchases:
Retrieve all customer names and quantities purchased, with inclusion for customers with no purchases.

Sales and Customer Information:
Display all sales_id, sale_date, and customer_email, including sales without customer details.

Product Sales Data:
Extract product_id and customer first name for all sales transactions.
Cast product prices as text in the product name query for uniformity.

Purchase Amounts and Defaults:
Show all customer names with the sale amount, defaulting to “No amount” or 0 if unavailable.

Total Quantity Sold per Product:
List products with total quantity sold, assigning a 0 where no sales data exists.

Stock Level Classification:
Classify products based on stock levels as "Low Stock," "Medium Stock," or "High Stock."

Date-Based Analysis:
Extract sale information with sale_id, sale_date, sale year, and assign a quarter label (Q1-Q4) based on the sale date.

## Project Structure
SQL Queries: SQL scripts used to retrieve, filter, and format the data for each objective.
Documentation: Details of each query’s purpose, structure, and output explanations.
Visualization: Screenshots and examples of query results to illustrate findings and facilitate understanding.

## Conclusion
The EcoFurnish Data Analysis Project, developed in collaboration with 10Alytics, provides valuable insights into customer purchasing patterns, stock levels, and seasonal sales performance. Through the use of PostgreSQL and targeted SQL queries, this project empowers EcoFurnish to optimize inventory, enhance customer experience, and make data-driven decisions to support sustainable growth.
