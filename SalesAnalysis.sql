CREATE DATABASE COMPANY;
use company;
select * from sales; 

-- Q) 1) find all orders shipped via 'Economy' mode with a total amount greater than 25,000.

select * from sales where Ship_Mode = 'Economy' and Total_Amount > 25000;

-- 2) Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
 
 select * from sales where
Category = 'Technology'
and Country = 'Ireland'
and Order_Date > '2020-01-01';

-- 3) List the top 10 most profitable sales transactions in descending order.

select * from sales
order by Unit_Profit DESC
limit 10; -- top 10 transactions
-- limit 10,20; -- skip 10 records , sowing next 20 records

-- 4) find all customers whose name starts with 'j' and ends with 'n'

select Order_ID, Customer_Name from sales where Customer_Name like 'j%n';

-- 5) Retrieve all product names that contain 'Acco' anywhere in the name.

select Order_ID, Product_Name from sales where Product_Name like '%Acco%';

-- 6) Get the top 5 cities with the highest total sales amount.

select City, sum(Total_Amount) as Total_Sales
from sales
group by City
order by Total_Sales Desc
limit 5; 

-- 7) Display the second set of 10 records for Customer_Name and Total Amount in descending order
select Customer_Name, Total_Amount from sales
order by Total_Amount desc
limit 10, 10;

-- 8) Find the total revenue, average unit cost, and total number of orders.
select 
sum(Total_Amount) as `Total_Revenue`,
avg(unit_cost) as `average unit cost`,
count(order_id) as `total number of orders`
from sales;

-- 9) count unique number of regions

select count(distinct(Region)) as uniq_reg from sales;

-- 10) find the number of orders placed by each customer.

select customer_name, count(order_id) as order_count
from sales
group by customer_name
order by order_count desc;

-- 11) Rank 5 products based on total sales using RANK().

select Product_Name, SUM(Total_Amount) as Total_Sales,
rank() over (order by sum(total_amount) desc) as sales_rank
from sales
group by Product_Name
limit 5;