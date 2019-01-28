select PP.FirstName +' '+pp.LastName as 'Employee',PPSC.Name as 'SubCategory',SD.UnitPrice * SD.OrderQty as 'Sales',sd.SalesOrderID,
SH.SalesOrderNumber,P.Name as 'Product',SD.OrderQty,SD.UnitPrice,PPC.Name as 'Category' from Person.Person PP
join Sales.SalesPerson SP
on PP.BusinessEntityID = SP.BusinessEntityID 
join Sales.SalesOrderHeader SH
on SP.BusinessEntityID = SH.SalesPersonID
join Sales.SalesOrderDetail SD
on SH.SalesOrderID = SD.SalesOrderID
join Production.Product P
on P.ProductID = SD.ProductID
cross join Production.ProductCategory PPC
join Production.ProductSubcategory PPSC
on PPC.ProductCategoryID = PPSC.ProductCategoryID

order by Employee 
