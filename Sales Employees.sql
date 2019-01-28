select P.BusinessEntityID , FirstName +' '+LastName as [Employees Name],JobTitle from Person.Person P
inner join HumanResources.Employee HE
on P.BusinessEntityID=HE.BusinessEntityID
join Sales.SalesPerson SP
on P.BusinessEntityID=SP.BusinessEntityID
GO
