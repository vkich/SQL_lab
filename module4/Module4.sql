--1
use SalesOrders
select distinct CustCity from Customers

--2
select EmpFirstName, EmpLastName, EmpPhoneNumber from Employees

--3
--select CategoryDescription from Categories 
/* Спочатку зробив так як у коментарі вище, потім начитався інфо у групі і
вибрав варіант, записаний нижче  */
select distinct C.CategoryDescription from Order_Details od
LEFT JOIN Products p ON p.ProductNumber=od.ProductNumber 
JOIN Categories c ON c.CategoryID=p.CategoryID
--4
select p.ProductName, CategoryDescription, RetailPrice from Products p
inner join Categories c on p.CategoryID=c.CategoryID
where p.ProductNumber IN (
	select distinct PV.ProductNumber from Product_Vendors PV JOIN Vendors v
	ON PV.VendorID=v.VendorID )

--5
select VendName, VendZipCode from Vendors
order by VendZipCode

--6
select EmpFirstName, EmpLastName, EmpPhoneNumber, EmployeeID from Employees
order by EmpLastName, EmpFirstName

--7
select VendName from Vendors

--8
select distinct CustState from Customers

--9
select ProductName, RetailPrice from Products

--10
select * from Employees

--11
--select distinct VendName, VendCity from Vendors v
--Думаю так: У таблиці Vendors має бути інфо про усіх постачальників,
-- але актуальні замовлення у Order_Details, тому начитавшись інфо від менторів
-- і не тільки, залишаю варіант нижче
select distinct VendName, VendCity from Order_Details od join Products p
	ON od.ProductNumber=p.ProductNumber join Product_Vendors PV
	ON p.ProductNumber=PV.ProductNumber JOIN Vendors v
	ON PV.VendorID=v.VendorID


--12
select Orders.OrderNumber, max(DaysToDeliver) as DeliveryDays from Orders join Order_Details
ON Orders.OrderNumber=Order_Details.OrderNumber
JOIN Product_Vendors PV on PV.ProductNumber=Order_Details.ProductNumber
GROUP BY Orders.OrderNumber
order by Orders.OrderNumber

--13
--select ProductNumber, SUM(QuantityOrdered) as QO from Order_Details group by ProductNumber
select ProductName, QuantityOnHand, RetailPrice, RetailPrice*QuantityOnHand as sum from Products

--14
select OrderNumber, DATEDIFF( day, OrderDate, ShipDate ) as DaysQuantity from Orders

--15
;with natural (n) as (select n=1
UNION ALL
select n+1 FROM natural where n < 10000)
select n from natural
option( maxrecursion 10000)

--16
;with ss (d, name) as (select cast('20190101' as date), DATENAME(WEEKDAY, '20190101') as name
UNION ALL
select DATEADD(DAY, 1, d), DATENAME(WEEKDAY, DATEADD(DAY, 1, d)) as name from ss 
where d<cast('20191231' as date))
select COUNT(*) as quantity_SA_SU from ss WHERE name in ('Saturday', 'Sunday')
option (maxrecursion 366)

