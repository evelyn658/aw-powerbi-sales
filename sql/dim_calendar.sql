-- Cleanned dim_date table --
SELECT 
  [DateKey] AS [Date Key], 
  [FullDateAlternateKey] AS Date,  
  [EnglishDayNameOfWeek] AS Day, 
  [WeekNumberOfYear] AS WeekNr,
  [EnglishMonthName] AS Month, 
  LEFT([EnglishMonthName], 3) AS [Month Short], 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year 
FROM 
  [AdventureWorksDW2022].[dbo].[DimDate]
  WHERE CalendarYear >= 2022
