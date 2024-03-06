SELECT * FROM superstore.store_sales;

#----Data Cleaning---
set sql_safe_updates=0;

#Standardizing date formats of columns

#For Order Date
UPDATE store_sales SET `Order Date` = DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m-%d') WHERE STR_TO_DATE(`Order Date`, '%m/%d/%Y') IS NOT NULL
ALTER TABLE store_sales MODIFY `Order Date` DATE

#For Ship Date
UPDATE store_sales SET `Ship Date` = DATE_FORMAT(STR_TO_DATE(`Ship Date`, '%m/%d/%Y'), '%Y-%m-%d') WHERE STR_TO_DATE(`Ship Date`, '%m/%d/%Y') IS NOT NULL
ALTER TABLE store_sales MODIFY `Ship Date` DATE

#Renaing columns
ALTER TABLE store_sales 
RENAME COLUMN `Row ID` TO `Row_ID`
ALTER TABLE store_sales 
RENAME COLUMN `Order ID` TO `Order_ID`
ALTER TABLE store_sales 
RENAME COLUMN `Order Date` TO `Order_date`
ALTER TABLE store_sales 
RENAME COLUMN `Customer ID` TO `Customer_ID`
ALTER TABLE store_sales 
RENAME COLUMN `Product ID` TO `Product_ID`
ALTER TABLE store_sales 
RENAME COLUMN `Product Name` TO `product_name`
ALTER TABLE store_sales 
RENAME COLUMN `Customer Name` TO `Customer_name`
ALTER TABLE store_sales 
RENAME COLUMN `Ship Date` TO `Ship_date`
ALTER TABLE store_sales 
RENAME COLUMN `Ship Mode` TO `Ship_mode`
ALTER TABLE store_sales 
RENAME COLUMN `postal Code` TO `Postal_code`
ALTER TABLE store_sales 
RENAME COLUMN `postal Code` TO `Postal_code`

#Checking for Duplicates
SELECT `Row_ID`, COUNT(*) 
FROM store_sales 
GROUP BY `Row_ID` 
HAVING COUNT(*) > 1 
LIMIT 0, 1000

#Result: No duplicates found

#Checking for nulls
SELECT 
    `Row_ID`, `Order_ID`, `Order_date`, `Ship_date`, `Ship_mode`, `Customer_ID`, 
    `Customer Name`, `Segment`, `Country`, `City`, `State`, `Postal_code`, `Region`, 
    `Product_ID`, `Category`, `Sub-Category`, `Product Name`, `Sales`, `Quantity`, 
    `Discount`, `Profit`
FROM 
    store_sales
WHERE 
    `Row_ID` IS NULL OR 
    `Order_ID` IS NULL OR 
    `Order_date` IS NULL OR 
    `Ship_date` IS NULL OR 
    `Ship_mode` IS NULL OR 
    `Customer_ID` IS NULL OR 
    `Customer Name` IS NULL OR 
    `Segment` IS NULL OR 
    `Country` IS NULL OR 
    `City` IS NULL OR 
    `State` IS NULL OR 
    `Postal_code` IS NULL OR 
    `Region` IS NULL OR 
    `Product_ID` IS NULL OR 
    `Category` IS NULL OR 
    `Sub-Category` IS NULL OR 
    `Product Name` IS NULL OR 
    `Sales` IS NULL OR 
    `Quantity` IS NULL OR 
    `Discount` IS NULL OR 
    `Profit` IS NULL;

#Result= No Null Values

#---SALES ANALYSIS---
#Total sales revenue over time
select  year(order_date) as Year, round(sum(sales),2) as Total_sales_revenue
from store_sales
group by year(order_date)
order by year(order_date);

#Top selling products
select product_name, sum(quantity) as quantity_sold, country, year(order_date) as year
from store_sales
group by  year(Order_date), country,product_name
order by quantity_sold desc, year(Order_date), country, product_name;

#Top selling category
select category, sum(quantity) as quantity_sold, country
from store_sales
group by  country,category
order by quantity_sold desc,country, category;

#Sales by region/Country/city
select city, country, region, year(order_date) as Year, round(sum(sales),2) as Total_Sales
from store_sales
group by region, city, country,   Year
order by Total_Sales Desc;

#worst performing country
select city, country, region, year(order_date) as Year, round(sum(sales),2) as Total_Sales
from store_sales
group by region, city, country,   Year
order by Total_Sales asc;

#---Order Analysis---

#Average order value
With Revenue as
(select order_id, sum(sales) as Total_revenue, count(row_id) as Total_orders
from store_sales
group by order_id)
select order_id, round(Total_revenue/Total_orders,2) as Average_Order_Value
from Revenue
group by order_id;

#effect of shipping rate on delivery time and its relaton with quantity
select order_id, quantity, ship_mode, day(ship_date) - day(order_date) as days_to_deliver
from store_sales
group by quantity, order_id, ship_mode, days_to_deliver
having  days_to_deliver > 0
order by quantity desc;

#peak time for orders in days, months
select  day(order_date) as day, month(order_date) as month, year(Order_date) as year, quantity
from store_sales
group by quantity, day,month, year
order by quantity desc;

#---Customer Analysis---

#Customer with highest revenue generated
select customer_id, customer_name, round(sum(sales),2) as Total_Revenue
from store_sales
group by customer_id, customer_name
order by Total_revenue desc;

#on what segment highest revenue generated customer spent the most on
select customer_id, customer_name, segment, round(sum(sales),2) as Total_Revenue
from store_sales
group by customer_id, customer_name, segment
order by Total_revenue desc;

# segments with most quantity ordered
select segment, sum(quantity) as frequency
from store_Sales
group by segment;

#---Product Analysis---

#Total Gross profit of each product
With Revenue_profit as
(select product_name, sum(sales) as Total_Revenue, sum(profit) as Total_Profit
from store_sales
group by product_name)
select product_name, round((Total_revenue/Total_profit)*100,1) as Total_Gross_Profit
from Revenue_profit
group by product_name, Total_Gross_Profit
order by Total_Gross_Profit desc;

#lowest performing product monthly (revenue basis)
select product_name, month(ship_date) as month, round(sum(sales),2) as Total_Revenue
from store_sales
group by product_name, month
order by Total_revenue;

#lowest performing product monthly (quantity basis)
select product_name, month(ship_date) as month, sum(quantity) as Total_Quantity
from store_sales
group by product_name, month
order by Total_Quantity;

#---Discount and profit analysis---

#discount effecting sales
select product_name,discount, profit, sum(sales) as Total_Sales, round(sum(sales*discount),2) as discounted_sales
from store_sales
group by product_name, discount,profit
order by profit;

#categories with most discounts
select category,segment, count(discount) as frequency
from store_sales
group by category,segment
order by frequency desc;

#---Time Series Analysis--

#Quantity sold over time
select category, sum(quantity) as quantity_sold, country, year(order_date) as year
from store_sales
group by  year(Order_date), country,category
order by quantity_sold desc, year(Order_date), country, category;

#profits over time
select category,  country, year(order_date) as year, round(sum(profit),2) as Total_Profit
from store_sales
group by  year(Order_date), country,category
order by Total_Profit desc;

#Sales Over time
select category, round(sum(sales),2) as Total_Sales, country, year(order_date) as year
from store_sales
group by  year(Order_date), country,category
order by Total_Sales desc;


