-- Cleanned dim_products table 
SELECT 
  p.ProductKey AS [Product Key], 
  p.ProductAlternateKey AS ProductItemCode, 
  p.EnglishProductName AS [Product Name], 
  ISNULL(ps.EnglishProductSubcategoryName, 'Others') AS [Sub Category], 
  ISNULL(pc.EnglishProductCategoryName, 'Others') AS [Product Category], 
  ISNULL(p.ModelName, 'Others') AS [Product Model], 
  ISNULL(p.EnglishDescription, 'Others') AS [Product Desc], 
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2022].[dbo].DimProduct as p 
  LEFT JOIN [AdventureWorksDW2022].[dbo].DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2022].[dbo].DimProductCategory AS pc ON pc.ProductCategoryKey = ps.ProductCategoryKey 
ORDER BY 
  p.ProductKey ASC
