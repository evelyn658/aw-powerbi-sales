-- Cleanned fact_internetsales table
SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  [SalesOrderNumber], 
  [UnitPrice] as [Unit Price], 
  [TotalProductCost], 
  [SalesAmount] 
FROM 
  [AdventureWorksDW2022].[dbo].FactInternetSales 
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -3 -- Ensures brings three years of date from extraction.
ORDER BY 
  OrderDateKey ASC
