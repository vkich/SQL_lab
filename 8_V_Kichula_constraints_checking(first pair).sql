use V_Kichula_module_2
delete from Building
delete from Building_Owner

-- 	owner_ID int primary key
insert into Building_Owner 
( 
	owner_ID, first_name, last_name,
	phone_number, birth_date, sex,
	married)
	VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'f', 'n' ),
	( 1, 'Sam', 'Burton', '(093)1234567', '19501201', 'm', 'y' )

--phone_number char(12) NOT NULL UNIQUE
insert into Building_Owner 
( 
	owner_ID, first_name, last_name,
	phone_number, birth_date, sex,
	married)
	VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'f', 'n' ),
	( 2, 'Sam', 'Burton', '(073)1234567', '19501201', 'm', 'y' )

/*	
	constraint Phone_Number_Check CHECK (phone_number like 
	'([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
*/
insert into Building_Owner 
	( owner_ID, first_name, last_name, phone_number, birth_date, sex, married)
VALUES
	( 1, 'Red', 'Fox', '(A73)134567', '19891219', 'f', 'n' )

--constraint sex_check CHECK(sex in ('M', 'F') )
insert into Building_Owner 
	( owner_ID, first_name, last_name, phone_number, birth_date, sex, married)
VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'N', 'n' )

--married CHAR(1) constraint married_check CHECK (married IN('y', 'n'))
insert into Building_Owner 
	( owner_ID, first_name, last_name, phone_number, birth_date, sex, married)
VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'F', 'M' )

/*
number_of_kids INT constraint number_of_kids_default DEFAULT(0)
	constraint number_of_kids_check CHECK(number_of_kids>=0)
*/
insert into Building_Owner 
	( owner_ID, first_name, last_name, phone_number, birth_date, sex, married, number_of_kids)
VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'F', 'y', -1 )

/*
ALTER TABLE [Building] ADD  CONSTRAINT PK_Building PRIMARY KEY
CLUSTERED ([name]);
*/
delete from Building
delete from Building_Owner

-- 	owner_ID int primary key
delete from Building
delete from Building_Owner
insert into Building_Owner 
(owner_ID, first_name, last_name, phone_number, birth_date, sex, married)
	VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'f', 'n' )
go
insert into Building (name, [owner], [address],
	floor_count, area,  price_m2, width, [length])
VALUES 
('Building 6', 1, 'Lviv, Horodotska, 60',  9, 100, 400, 20, 30),
('Building 6', 1, 'Lviv, Horodotska, 40',  11, 100, 400, 20, 30)
/*
ALTER TABLE [Building] ADD 
	CONSTRAINT FK_Building_owner FOREIGN KEY ([owner]) 
	REFERENCES [Building_Owner] ([owner_ID]);
*/
delete from Building
delete from Building_Owner
insert into Building_Owner 
(owner_ID, first_name, last_name, phone_number, birth_date, sex, married)
	VALUES
	( 1, 'Red', 'Fox', '(073)1234567', '19891219', 'f', 'n' )
go
insert into Building (name, [owner], [address],
	floor_count, area,  price_m2, width, [length])
VALUES 
('Building 6', 1, 'Lviv, Horodotska, 60',  9, 100, 400, 20, 30),
('Building 4', 2, 'Lviv, Horodotska, 40',  11, 100, 400, 20, 30)
/*
alter table Building add constraint address_unique
			UNIQUE ([address]);
*/
delete from Building
insert into Building (name, [owner], [address],
	floor_count, area,  price_m2, width, [length])
VALUES 
('Building 6', 1, 'Lviv, Horodotska, 60',  9, 100, 400, 20, 30),
('Building 6', 1, 'Lviv, Horodotska, 40',  11, 100, 400, 20, 30)

