use V_Kichula_module3
go
--1
update Suppliers set rating=rating+10 where rating <
(select rating from Suppliers where SupplierId=4)

--2
select ProductId from Products where city='London'
union
select s.ProductId from Supplies s join
Suppliers sp on sp.SupplierId=s.SupplierId
where sp.city='London'

--3
delete from Products where ProductId 
	not in (select distinct ProductId from Supplies)

--4

select distinct s1.SupplierId, s1.DetailId d1, s2.DetailId d2 into #pair_table from Supplies s1
JOIN Supplies s2 ON s1.SupplierId=s2.SupplierId and s1.DetailId<s2.DetailId
select * from #pair_table

--5
update Supplies set quantity=quantity*1.1
where SupplierId in
(select distinct sp.SupplierId from Supplies sp join Suppliers s
on s.SupplierId=sp.SupplierId join Details d on d.DetailId=sp.DetailId
where color='red')

--6
select distinct color, city INTO one_tmp_Details from Details
select * from one_tmp_Details

--7
select s.DetailId INTO London_Details from Supplies s join Suppliers sp 
	on s.SupplierId=sp.SupplierId
	and sp.city='London'
union
select s.DetailId from Supplies s
join Products p on p.ProductId=s.ProductId and p.city='London' 
select * from London_Details

--8
insert into Suppliers values (10, 'White', null, 'NY')
select * from Suppliers

--9
delete from supplies where productid in
( select productid from Products where city='Roma')
delete from Products where city='Roma'

--10
select d.city into #Cities from Supplies s join Details d
ON s.DetailId=d.DetailId
UNION
select p.city from Supplies s join Products p
ON s.ProductId=p.ProductId
UNION
select sp.city from Supplies s join Suppliers sp
ON s.SupplierId=sp.SupplierId order by city
select * from #Cities 

--11
update Details set color='yellow' where color='red' and weight<15

--12
select ProductId, city into #city_details from Products
where city like '_o%'
select * from #city_details

--13
select SupplierId, avg(quantity) as s_avg from Supplies group by SupplierId
select avg(quantity) as s_avg from Supplies

--14
drop table #detail_1_sp
select s.SupplierId, name  into #detail_1_sp from Suppliers sp join Supplies s
on sp.SupplierId=s.SupplierId and s.ProductId=1 order by s.SupplierId
select * from #detail_1_sp

--15
insert into Suppliers values
	(111, 'NewFoundedSupplier', 1,'Chervonohrad'),
	(112, 'TheLastFounded', 2,'Chervonohrad')

--MERGE, the last
--alter table Supplies drop constraint d_id_FK;
--alter table Supplies add constraint d_id_FK foreign key(DetailId) references Details(DetailId) on delete cascade;

MERGE Details d using tmp_Details td
ON d.DetailId=td.DetailId
when matched then 
UPDATE set d.name=td.name, d.color=td.color, d.weight=td.weight, d.city=td.city
when not matched then 
INSERT values (td.DetailId, td.name, td.color, td.weight, td.city);

--when not matched by source then DELETE;

select * from tmp_Details
select * from Details

