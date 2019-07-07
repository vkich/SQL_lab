use V_Kichula_module5
go

--a
select ProductId from Supplies where DetailId = ALL (select DetailId from Supplies where SupplierId=3)

--b
select sp.SupplierId, sp.name from Suppliers sp join supplies s ON sp.SupplierId=s.SupplierId
cross apply 
( select AVG(quantity) as q_avg from Supplies where DetailId=1 and Supplies.SupplierId=s.SupplierId ) q
where quantity>q_avg and DetailId=1

--c
select name from Details where DetailId IN
(
	select DetailId from Supplies
	where ProductId IN
	(
		select ProductId from Products where city='London'
	)
)

--d
select distinct sp.SupplierId, sp.name from Suppliers sp join supplies s ON sp.SupplierId=s.SupplierId
where DetailId = ANY ( select DetailId from Details where color='red')

--e
select distinct DetailId from Supplies where SupplierId=2 and ProductId = ANY 
(
	select ProductId from Supplies where SupplierId=2
)

--f
select ProductId from Supplies group by ProductId
HAVING AVG(quantity) > ALL
(
	select MAX(quantity) from Supplies where ProductId=1 group by DetailId
)

--g
select name from Products where ProductId not IN
(select ProductId from Supplies)