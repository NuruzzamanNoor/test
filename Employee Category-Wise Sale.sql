select tab1.Employee, tab1.Year, tab1.MonthNumber, tab1.Month, tab1.Category, SUM(tab1.SubTotal) as 'Sales' from (select distinct 
PP.FirstName +' '+PP.LastName as [Employee],YEAR(SOH.OrderDate)[Year],MONTH (SOH.OrderDate) as 'MonthNumber' , DATENAME
(MONTH, SOH.OrderDate) AS'Month',PC.Name as 'Category',SOH.SubTotal from Sales.SalesPerson SP
join Person.Person PP
on PP.BusinessEntityID = SP.BusinessEntityID
join Sales.SalesOrderHeader SOH
on SP.BusinessEntityID = SOH.SalesPersonID
join Sales.SalesOrderDetail SD
on SOH.SalesOrderID = SD.SalesOrderID

join Production.Product P on P.ProductID = SD.ProductID
join Production.ProductSubcategory PSC on P.ProductSubcategoryID=PSC.ProductCategoryID
join Production.ProductCategory PC on PSC.ProductCategoryID = PC.ProductCategoryID

) as tab1 group by Employee , Year, MonthNumber, Month, Category
order by Employee, Year, MonthNumber, Month
