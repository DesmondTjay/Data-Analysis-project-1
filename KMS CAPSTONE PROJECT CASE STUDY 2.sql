
-- Case Scenario I
select *from KMS

-- 1. Product Category with Highest Sales
SELECT
    Product_Category, 
    SUM(Sales) AS Total_Sales
FROM
    KMS
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC
    --ANSWER-- Technology with total Sales of 5,984,248.18

-- 2. Top 3 and Bottom 3 Regions by Sales
-- Top 3
SELECT 
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC
    ---Answer-- West, Ontario and Prarie

-- Bottom 3
SELECT 
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms
GROUP BY 
    Region
ORDER BY 
    Total_Sales ASC
    ----Answer--- Nunavut, Northwest Territories and Yukon

-- 3. Total Sales of Appliances in Ontario
SELECT 
    SUM(Sales) AS Appliances_Sales_Ontario
FROM 
    kms
WHERE 
    Province = 'Ontario'
    AND "Product_category" = 'Office supplies'
    AND "Product_sub_Category" = 'Appliances';
    ---ANswer----202,346.84

-- 4. Bottom 10 Customers by Sales
SELECT 
    "Customer_Name", 
    SUM(Sales) AS Total_Sales
FROM 
    kms
GROUP BY 
    "Customer_Name"
ORDER BY 
    Total_Sales ASC
    ---Answer--- Offer bundled discounts to incentivize larger orders, 
-----------------Introduce loyalty programs for repeat purchases,
-----------------Optimize shipping methods to reduce costs

-- 5. Most Shipping Cost by Shipping Method
SELECT 
    "Ship_Mode", 
    SUM(Sales - Profit) AS Estimated_Shipping_Cost
FROM 
    kms
GROUP BY 
    "Ship_Mode"
ORDER BY 
    Estimated_Shipping_Cost DESC
    ----Answer---Regular Air

-- Case Scenario II

-- 6. Most Valuable Customers & What They Buy
SELECT 
    "Customer_Name", 
    "Product_Category", 
    SUM(Sales) AS Total_Spent
FROM 
    kms
GROUP BY 
    "Customer_Name", "Product_Category"
ORDER BY 
    Total_Spent DESC
    ----Answer--- Emily,Deborah,Dennis,Jasper,Clytie...All technology product

-- 7. Small Business Customer with Highest Sales
SELECT 
    "Customer_Name", 
    SUM(Sales) AS Total_Sales
FROM 
    kms
WHERE 
    "Customer_Segment" = 'Small Business'
GROUP BY 
    "Customer_Name"
ORDER BY 
    Total_Sales DESC
    ----Answer---- Dennis Kane with 75,967.59 Sales

-- 8. Corporate Customer with Most Orders (2009–2012)
SELECT 
    "Customer_Name", 
    COUNT("Order_ID") AS Order_Count
FROM 
    kms
WHERE 
    "Customer_Segment" = 'Corporate'
    AND "Order_Date" BETWEEN '01/01/2009' AND '12/31/2012'
GROUP BY 
    "Customer_Name"
ORDER BY 
    Order_Count DESC
    -----Answer--- Adam Hart

-- 9. Most Profitable Consumer Customer
SELECT 
    "Customer_Name", 
    SUM(Profit) AS Total_Profit
FROM 
    kms
WHERE 
    "Customer_Segment" = 'Consumer'
GROUP BY 
    "Customer_Name"
ORDER BY 
    Total_Profit DESC
----Answer--- Emily Phan witj 3,4005.44 profit

-- 10. Customers Who Returned Items & Their Segment
SELECT 
    "Customer_Name", 
    "Customer_Segment" 

FROM 
    kms
WHERE 
     Profit < 0
GROUP BY 
        "Customer_Name", "Customer_Segment"


-- 11. Shipping Cost vs Order Priority Analysis
SELECT 
    "Order_Priority", 
    "Ship_Mode", 
    COUNT(*) AS Order_Count, 
    AVG(Sales - Profit) AS Avg_Estimated_Shipping_Cost
FROM 
    kms
GROUP BY 
    "Order_Priority", "Ship_Mode"
ORDER BY 
    "Order_Priority", "Ship_Mode";

    ----ANswer---
    ----Recommendation:
--------Reallocate shipping methods:
---------Use Express Air for Critical/High-priority orders.
---------Shift Low-priority orders to Delivery Truck to save costs.
---------Potential Savings: Up to 20% in shipping costs.
