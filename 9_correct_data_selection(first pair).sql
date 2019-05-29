use V_Kichula_module_2

delete from Building_Owner
delete from Building
go
insert into Building_Owner 
( 
	owner_ID, first_name, last_name,
	phone_number, birth_date, sex,
	married)
	VALUES
	( 3, 'Red', 'Fox', '(073)1234567', '19891219', 'f', 'n' ),
	( 2, 'Sam', 'Norton', '(063)1234567', '19501210', 'm', 'n' ),
	( 1, 'Sam', 'Burton', '(093)1234567', '19501201', 'm', 'y' )

insert into Building (name, [owner], [address],
	floor_count, area,  price_m2, width, [length])
VALUES 
('Building 6', 3, 'Lviv, Horodotska, 60',  9, 100, 400, 20, 30),
('Building 4', 2, 'Lviv, Horodotska, 40',  11, 100, 400, 20, 30),
('Building 2', 3, 'Lviv, Horodotska, 20',  5, 100, 400, 20, 30),
('Building A', 1, 'Lviv, Horodotska, 20a', 1, 100, 100, 10, 20),
('Building Low Cost', 1, 'Lviv, Horodotska, 110', 1, 10, 10.2, 5.6, 10.35)

select * from Building_Owner
select * from Building