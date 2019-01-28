select tab1.Employee, tab1.Year, tab1.MonthsNumber, tab1.Months, SUM(tab1.SubTotal) as 'Sales' from (select distinct 
PP.FirstName +' '+PP.LastName as [Employee],YEAR(SOH.OrderDate)[Year],MONTH (SOH.OrderDate) as 'MonthsNumber' , 
DATENAME(MONTH, SOH.OrderDate) AS'Months',SOH.SubTotal from Sales.SalesPerson SP
join Person.Person PP
on PP.BusinessEntityID = SP.BusinessEntityID
join Sales.SalesOrderHeader SOH
on SP.BusinessEntityID = SOH.SalesPersonID
where pp.BusinessEntityID !=287 and pp.BusinessEntityID!= 274
) as tab1 group by Employee , Year, MonthsNumber, Months
order by Employee, Year, MonthsNumber, Months
