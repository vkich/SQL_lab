--1
select name from Suppliers
where city='London'
UNION ALL
select name from Suppliers
where city='Paris'

--2.1
select city from Suppliers s join Supplies sp
ON sp.SupplierId=s.SupplierId 
INTERSECT
select city from Details d join Supplies sp
ON sp.DetailId=d.DetailId 
order by city

--2.2
select city from Suppliers
UNION ALL
select city from Details
order by city

--3
select sp.name from Suppliers sp join Supplies s
ON sp.SupplierId=s.SupplierId join Details d
ON d.DetailId=s.DetailId 
EXCEPT
select sp.name from Suppliers sp join Supplies s
ON sp.SupplierId=s.SupplierId join Details d
ON d.DetailId=s.DetailId where d.city='London'

--4
select ProductId, name, city from Products where city='London' or city='Paris'
EXCEPT
select ProductId, name, city from Products where city='Rome' or city='Paris'

--5
select s.SupplierId, DetailId, ProductId from Supplies s
JOIN Suppliers sp ON sp.SupplierId=s.SupplierId where city='London'
UNION ALL
select s.SupplierId, s.DetailId, ProductId from Supplies s
JOIN Details d ON d.DetailId=s.DetailId where color='green'
EXCEPT
select s.SupplierId, DetailId, s.ProductId from Supplies s
JOIN Products p ON p.ProductId=s.ProductId where city='Paris'
