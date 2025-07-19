-- Cleanned dim_customers table
SELECT 
  c.CustomerKey AS [Customer Key], 
  c.FirstName AS [First Name], 
  c.LastName AS [Last Name], 
  c.firstname + ' ' + c.lastname AS [Full Name], 
  2025-YEAR(BirthDate) as Age,
  -- Create Age Group from Age
  CASE 
	WHEN 2025-YEAR(BirthDate) < 55 THEN 'Middle-Aged'
	WHEN 2025-YEAR(BirthDate) < 70 THEN 'Young Seniors'
	WHEN 2025-YEAR(BirthDate) < 85 THEN 'Seniors'
	ELSE 'Elderly'
	END AS AgeGroup,
  CASE c.MaritalStatus WHEN 'M' THEN 'Married' WHEN 'S' THEN 'Single' END AS MaritalStatus, 
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,  
  [YearlyIncome],
  -- Create Income Group from YearlyIncome by dividing into 32K range
  CASE 
	WHEN YearlyIncome < 42000 THEN 'Very Low'
	WHEN YearlyIncome < 74000 THEN 'Low'
	WHEN YearlyIncome < 106000 THEN 'Middle'
	WHEN YearlyIncome < 138000 THEN 'High'
	ELSE 'Very High'
	END AS IncomeGroup,
  [EnglishEducation] AS [Education], 
  [EnglishOccupation] AS [Occupation], 
  g.City AS [Customer City], 
  st.SalesTerritoryCountry AS Country,
  st.SalesTerritoryGroup AS Continent,
  c.DateFirstPurchase 
FROM 
  [AdventureWorksDW2022].[dbo].[DimCustomer] as c 
  LEFT JOIN [AdventureWorksDW2022].[dbo].DimGeography AS g ON g.GeographyKey = c.GeographyKey 
  LEFT JOIN [AdventureWorksDW2022].[dbo].DimSalesTerritory AS st ON st.SalesTerritoryKey = g.SalesTerritoryKey
ORDER BY 
  CustomerKey ASC
