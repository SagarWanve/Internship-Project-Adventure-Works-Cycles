-- Calculate the Revenue Amount:
SELECT 
    (UnitPrice * OrderQuantity * (1 - 0)) AS Revenue
FROM Sales;


-- Calculate the Production Cost:
SELECT 
    (ProductStandardCost * OrderQuantity) AS Production_Cost
FROM Sales; 


-- Calculate the Profit:
SELECT 
    ((UnitPrice * OrderQuantity * (1 - 0)) - (ProductStandardCost * OrderQuantity)) AS Profit
FROM Sales;


-- Aggregate Sales Amount by Month and Year:
SELECT 
    Year_, 
    MonthNo, 
    SUM(UnitPrice * OrderQuantity * (1 - 0)) AS Sales_Amount
FROM Sales
GROUP BY Year_, MonthNo;


-- EXTRAS -------------------------------------------------------------------------------------------------------------

-- Performance by Products:
SELECT 
    ProductName, 
    SUM(UnitPrice * OrderQuantity * (1 - 0)) AS Total_Sales
FROM Sales
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;

-- Products with Highest Profit:
SELECT 
    ProductName, 
    SUM((UnitPrice * OrderQuantity * (1 - 0)) - (ProductStandardCost * OrderQuantity)) AS Total_Profit
FROM Sales
GROUP BY ProductName
ORDER BY Total_Profit DESC
LIMIT 10;

-- Performance by Customers:
-- Top Customers by Sales:

SELECT 
    FullName, 
    SUM(UnitPrice * OrderQuantity * (1 - 0)) AS Total_Sales
FROM Sales
GROUP BY FullName
ORDER BY Total_Sales DESC
LIMIT 10;

-- Profit by Region:
SELECT 
    SalesTerritory.SalesTerritoryRegion, 
    SUM((Sales.UnitPrice * Sales.OrderQuantity * (1 - 0)) - (Sales.ProductStandardCost * Sales.OrderQuantity)) AS Total_Profit
FROM Sales
JOIN SalesTerritory
ON Sales.SalesTerritoryKey = SalesTerritory.SalesTerritoryKey
GROUP BY SalesTerritory.SalesTerritoryRegion
ORDER BY Total_Profit DESC;

# Most profitable month in terms of production cost:
SELECT Year_, MonthNo, MonthName_, SUM(SalesAmount - ProductionCost) AS TotalProfit
FROM Sales
GROUP BY Year_, MonthNo, MonthName_
ORDER BY TotalProfit DESC
LIMIT 1;



#Which is the most profitable financial quarter


SELECT FinancialQuarter, SUM(Profit) AS TotalProfit
FROM Sales
GROUP BY FinancialQuarter
ORDER BY TotalProfit DESC
LIMIT 1;





