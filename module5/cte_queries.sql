--free cte
with fcte ( x ) as (select x=1),
cos_cte (cx) as (select COS(x) from fcte
union all
  select cx+0.1 from cos_cte where cx<=1)
select * from cos_cte;

--factorial
with nf(n, res) as
( select n=1, res=1 
UNION ALL select n+1, res*(n+1) from nf where n < 10 )
select n as position, res as value from nf where n=10;

--Fibonacci nums
with nfib(pos, n1, n2, n3) as
( select pos=1, n1=0, n2=1, n3=1 
UNION ALL select pos+1, n1=n2, n2=n1+n2, n3=n1+n2 from nfib where pos < 20 )
select pos as position, n3 as value from nfib

--date periods
;with ss (d) as (select cast('20131125 ' as date)
UNION ALL
select DATEADD(DAY, 1, d) from ss 
where d<cast('20140304' as date))
select MIN(StartDAte) as StartDate, MAX(EndDate) as EndDate from
(
	select d as startDate, DATEADD(d, 1, d) as EndDate from ss
) q
where MONTH(startDate)=MONTH(EndDate)
GROUP BY month(startDate)
ORDER BY StartDate

--calendar
--select @@DATEFIRST	
--так як відлітаю на тиждень до Осло, то змушений надати варіант з допомогою
--сайту http://www.kodyaz.com/t-sql/create-monthly-calendar-using-sql.aspx
--але мені цікаво зробити самому (може колись зроблю, буду відсутній з 08.07.19 до 15.07.19.
/*
;with main_calendar (d, n) as ( select dateadd(mm, 1, getdate() - day(getdate()) + 1) - 1, datename(dw, dateadd(mm, 1, getdate() - day(getdate()) + 1) - 1)
UNION ALL
 select DATEADD(dd, -1, d), datename(dw, DATEADD(dd, -1, d)) from main_calendar 
 where DAY (d) > 1)
  select d, n  from main_calendar
*/
;with cte as (
 select
  dateadd(dd,1,(dateadd(mm,-1,dateadd(month,1+datediff(month,0,GETDATE()),-1)))) firstofmonth,
  dateadd(month,1+datediff(month,0,GETDATE()),-1) endofmonth
), cte1 as (
 select
  dateadd(dd, -1 * (
  case datepart(weekday, firstofmonth)
   when 1 then 6
   else datepart(weekday, firstofmonth) - 2
  end), firstofmonth) previousmonday,
  firstofmonth, 
  endofmonth,
  case 
   when datepart(dw,endofmonth) = 1 then endofmonth
   else
   dateadd(dd, 8 - datepart(dw,endofmonth), endofmonth) 
  end as lastsunday
 from cte
), cte2 as (
 select 
  1 cnt, previousmonday as calendarday, lastsunday
 from cte1

 union all

 select 
  cnt+1, dateadd(dd, 1, calendarday) as calendarday, lastsunday
 from cte2
 where
  dateadd(dd, 1, calendarday) <= lastsunday
)
, calendar as (
 select 
  cnt,
  ((cnt-1)/7)+1 weeknumber,
  calendarday, 
  datename(dw,calendarday) nameofday,
 case when (cnt % 7) = 1 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Monday,
 case when (cnt % 7) = 2 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Tuesday,
 case when (cnt % 7) = 3 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Wednesday,
 case when (cnt % 7) = 4 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Thursday,
 case when (cnt % 7) = 5 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Friday,
 case when (cnt % 7) = 6 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Saturday,
 case when (cnt % 7) = 0 and month(calendarday) = month(getdate()) then cast(calendarday as varchar) else NULL end as Sunday
 from cte2
)
select
 weeknumber,
 max(Monday) Monday,
 max(Tuesday) Tuesday,
 max(Wednesday) Wednesday,
 max(Thursday) Thursday,
 max(Friday) Friday,
 max(Saturday) Saturday,
 max(Sunday) Sunday
from calendar
group by weeknumber


 
 --First level Regions
 use V_Kichula_module5
 go
 select region_id, id as place_id, name from geography where region_id=1
 
 -- Ivano-Frankivsk Region
 ;with reg (region_id, place_id, name, place_level) as ( select region_id, id as place_id, name, placelevel=-1 from geography
 where name='Ivano-Frankivsk'
 UNION ALL
 select geography.region_id, id as place_id, geography.name, reg.place_level+1 from geography join reg 
 on geography.region_id=reg.place_id)
 select * from reg where name <> 'Ivano-Frankivsk'
 
  -- ALL Regions
 ;with reg (region_id, place_id, name, place_level) as ( select region_id, id as place_id, name, placelevel=0 from geography
 where name='Ukraine'
 UNION ALL
 select geography.region_id, id as place_id, geography.name, reg.place_level+1 from geography join reg 
 on geography.region_id=reg.place_id)
 select * from reg
 
 --Lviv Region Tree
 ;with LRT (region_id, place_id, name, place_level) as ( select region_id, id as place_id, name, placelevel=1 from geography
 where name='Lviv'
 UNION ALL
 select g.region_id, id as place_id, g.name, LRT.place_level+1 from geography as g join LRT
 on g.region_id=LRT.place_id)
 select name, place_id, region_id, place_level from LRT

--Lviv Region Tree (paths are included)
 ;with LRT (id, name, pl, pa) as 
  ( 
	select id, name, PL=1, cast('/' + name as varchar(40)) as [path] from geography
	where name='Lviv'
	UNION ALL
	select g.id, g.name, lrt.PL+1, cast(LRT.pa + '/' + g.name as varchar(40)) from geography as g join LRT
	on g.region_id=LRT.id
)
 select name, pl, pa from LRT
 
 --Lviv Region Tree (paths and lengths are included)
;with LRT (region_id, place_id, name, place_level, path) as 
  ( 
	select region_id, id as place_id, name, placelevel=0, cast('/' + name as varchar(40)) from geography
	where name='Lviv'
	UNION ALL
	select g.region_id, id as place_id, g.name, place_level+1, cast(LRT.path + '/' + g.name as varchar(40)) from geography as g join LRT
	on g.region_id=LRT.place_id
)
 select name, 'Lviv' as center, place_level as pathlen, path from LRT where name <> 'Lviv'
