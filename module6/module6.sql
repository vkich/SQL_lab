-- 1
select *, ROW_NUMBER() OVER (order by city ) as [порядковий номер] from Products

--2
select *, ROW_NUMBER() OVER ( PARTITION BY city order by name) 
as [порядковий номер в межах міста] from Products

--3
select * from
(
	select *, ROW_NUMBER() OVER ( PARTITION BY city order by name) 
	as [no] from Products
)q
WHERE no = 1

--4
select ProductId, DetailId, quantity, SUM(quantity) OVER (PARTITION BY ProductId) as total_prod,
SUM(quantity) OVER (PARTITION BY DetailId) as total_det
 from Supplies
 
 --5
 select * from
 (
 select SupplierId, DetailId, ProductId, quantity, 
 ROW_NUMBER() OVER (order by SupplierId) as rn, COUNT(*) OVER () as total from Supplies
) q
where rn between 10 and 15

--6
select * FROM
(
 select SupplierId, DetailId, ProductId, quantity, 
 ROW_NUMBER() OVER (order by SupplierId) as rn, AVG(quantity) OVER () as avg_qty from Supplies
)q
WHERE quantity < avg_qty
