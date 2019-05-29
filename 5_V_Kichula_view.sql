use V_Kichula_module_2
go
create or alter view BO_view AS
SELECT first_name, last_name, birth_date FROM Building_Owner
go
create or alter view bild_view as
select name, address, price_m2, area, Price_m2*area as total FROM Building
WHERE Price_m2*area > 20000 WITH CHECK OPTION
go

select * from BO_view
select * from bild_view

update bild_view set price_m2=1239 where total < 20000

