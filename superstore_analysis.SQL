

-- ================================
-- Superstore Sales Analysis
-- Author: Taimoor Ghalib
-- Tool: MySQL
-- ================================


-- ================================
-- Query 1: Total Revenue and Avg Shipping
-- ================================

SELECT
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(AVG(`Delivery Days`), 1) AS Avg_Shipping_Days
FROM cleaned_superstore_sales;


-- ================================
-- Query 2: Revenue by Region
-- ================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Regional_Sales,
    COUNT(`Order ID`) AS Total_Orders
FROM cleaned_superstore_sales
GROUP BY Region
ORDER BY Regional_Sales DESC;


-- ================================
-- Query 3: Top 5 Best Selling Sub-Categories
-- ================================

SELECT
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM cleaned_superstore_sales
GROUP BY Category, `Sub-Category`
ORDER BY Total_Sales DESC
LIMIT 5;


-- ================================
-- Query 4: Top Products with Delivery Analysis
-- ================================

SELECT
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(AVG(`Delivery Days`), 1) AS Avg_Delivery_Days
FROM cleaned_superstore_sales
GROUP BY Category, `Sub-Category`
HAVING Total_Sales > 200000
ORDER BY Avg_Delivery_Days DESC;


-- ================================
-- Query 5: Top 5 VIP Customers
-- ================================

SELECT
    `Customer Name`,
    Segment,
    COUNT(DISTINCT `Order ID`) AS Unique_Orders,
    ROUND(SUM(Sales), 2) AS Total_Spent
FROM cleaned_superstore_sales
GROUP BY `Customer Name`, Segment
ORDER BY Total_Spent DESC
LIMIT 5;


-- ================================
-- Query 6: Year over Year Revenue Growth
-- ================================

SELECT
    `Order Year`,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Annual_Revenue
FROM cleaned_superstore_sales
GROUP BY `Order Year`
ORDER BY `Order Year` ASC;


-- ================================
-- Query 7: Monthly Seasonality Analysis
-- ================================

SELECT
    `Order Month`,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Monthly_Revenue
FROM cleaned_superstore_sales
GROUP BY `Order Month`
ORDER BY Monthly_Revenue DESC;


-- ================================
-- Query 8: Revenue by Customer Segment
-- ================================

SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM cleaned_superstore_sales
GROUP BY Segment
ORDER BY Total_Revenue DESC;


-- ================================
-- Query 9: Shipping Mode Performance
-- ================================

SELECT
    `Ship Mode`,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(AVG(`Delivery Days`), 1) AS Avg_Delivery_Days,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM cleaned_superstore_sales
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;


-- ================================
-- Query 10: Top 10 States by Revenue
-- ================================

SELECT
    State,
    Region,
    COUNT(`Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM cleaned_superstore_sales
GROUP BY State, Region
ORDER BY Total_Revenue DESC
LIMIT 10;