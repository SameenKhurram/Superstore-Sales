# Superstore-Sales
## Project Overview
The objective of this project was to conduct an extensive Exploratory Data Analysis (EDA) on a 'Sample - Superstore' dataset to uncover insights into sales performance, customer behavior, products details and sales trends. By answering a comprehensive set of analytical questions, the project aimed to:
- Understand sales trends across different regions and product categories.
- Identify key drivers of profit and loss within the superstore's operations.
- See the variety and popularity of products among customers.
- Uncover patterns in customer purchasing behavior.
- Identify the patterns of orders.
- See the difference and patterns during the time of the available data.
- See the sales effected by discount
- 
The purpose of this project was not only to derive actionable insights for improving sales strategies, inventory management, and customer engagement but also to facilitate data-driven decision-making within the retail environment. Through meticulous analysis, the project provides valuable recommendations that could help in optimizing product offerings, enhancing customer satisfaction, and ultimately driving sales growth.

### Dataset
The dataset was imported from [Kaggle Superstore Sales Dataset](https://www.kaggle.com/datasets/rohitsahoo/sales-forecasting/data)
It is very easy to understand and self-explainatory. It consists of several columns including:

| Column Name           | Data Type | Description                                  |
|-----------------------|-----------|----------------------------------------------|
| Order ID              | String    | The unique identifier for each transaction.  |
| Order Date            | Date      | The date when the order was placed.          |
| Ship Date             | Date      | The date when the order was shipped.         |
| Ship Mode             | String    | The type of shipping method used.            |
| Customer ID           | String    | The unique identifier for each customer.     |
| Customer Name         | String    | The name of the customer.                    |
| Segment               | String    | The market segment the order belongs to.     |
| Country               | String    | The country where the order was placed.      |
| City                  | String    | The city where the order was placed.         |
| State                 | String    | The state where the order was placed.        |
| Postal Code           | Integer   | The postal code for the order's location.    |
| Region                | String    | The region where the order was placed.       |
| Product ID            | String    | The unique identifier for each product.      |
| Category              | String    | The category of the product.                 |
| Sub-Category          | String    | The sub-category of the product.             |
| Product Name          | String    | The name of the product.                     |
| Sales                 | Float     | The total sales amount for the transaction.  |
| Quantity              | Integer   | The quantity of items per order.             |
| Discount              | Float     | Any discounts applied to the order.          |
| Profit                | Float     | The profit made from the order.              |


## Technologies Used

- My SQL for EDA
- Power BI for the interactive visualization

## Setup Instructions

Imported the Excel data file into my SQL for EDA purposes

## Approach

### Cleaning:

- The dates (Ship Date, Order Date) were transformated into standardized date formats.
- Column names were renamed to match the standard formatting.
- No duplicates in the primary key (Row ID) were found.
- No Null values were found
  
### Analysis:

- My Sql was used to do the analysis
  

# Analysis List
## EDA Questions

### General Analysis
1. What is the total number of customers?
 <img width="100" alt="Total Customers" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/af319018-7111-48f2-927f-2eff2646ef23">


2. What is the count of country,city and state?
 <img width="129" alt="Country, City,State" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/f1d4d18f-85af-4e07-b9c5-1d17bd6d92f5">


3. Sub-categories and products in the segments
 <img width="213" alt="Segments, sub-category, Products name" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/18a373fd-3a6f-4dc5-b274-393f36ec377e">


4. What is the popular shipping mode by orders?
   <img width="125" alt="ship mode count" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/c6f1a604-8c9a-4e3f-93df-e5014d66fa66">


5. What are the 10 most popular products by quantity?
    <img width="275" alt="Popular Product" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/9a625d0f-1eb1-4911-a78e-d8459e705148">


6. What are the 10 most profitable products?
    <img width="267" alt="Most profitable product" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/c8aae6dc-f9b1-47ec-af04-4177e788b0ea">


7. Who are the top 10 customers?
    <img width="165" alt="Top 10 customers" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/10354dbf-b68f-4a2c-9152-b745ad8bb01a">


8. What are the products with profit more than the average?
    <img width="299" alt="Products with more than average profit" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/b97fb06f-0b89-4ae1-a3ab-30238219dc1b">


9. What is the profit by Month and Year?
    <img width="165" alt="Profit by month and year" src="https://github.com/SameenKhurram/Superstore-Sales/assets/144594341/7b43e623-2ddd-4bb9-9b3f-68dfa598d98c">



### Sales Analysis
1. What is the total sales revenue over time?
2. What is the top selling category of products?
3. Calculate total sales by country and region
4. Identify the worst performing countries by sales?

### Orders Analysis
1. Calculate the average order value
2. What is the effect of shipping rate on delivery time and its relation with quantity?
3. What is the peak time for orders?(identify the days and the months)

### Customer Analysis
1. Identify the customers who generate high revenue.
2. Identify the segment that high generating revenue customers spent on.
3. How many orders did a segment received?

### Product Analysis
1. Calculate total gross profit of each product.
2. Which is the lowest performing product monthly (revenue basis)?
3. Which is the lowest performing product monthly (quantity basis)?

### Discount and profit analysis
1. How does discount effect sales?
2. What are the categories with most discounts?

### Time Series Analysis
1. Calculate quantity sold from a category over time.
2. Calculate profits of a category over time.
3. Calculate sales over time.

