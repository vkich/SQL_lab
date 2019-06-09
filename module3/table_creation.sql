--Привіт експертам. Використовував sql server 2014.

use master
go
create database V_Kichula_module3
go
use V_Kichula_module3
go
create table Suppliers 
(
	SupplierId integer primary key,
	name varchar(20),
	rating integer,
	city varchar(20)
)
create table Details 
(
	DetailId integer primary key,
	name varchar(20),
	color varchar(20),
	weight integer,
	city varchar(20)
)
create table Products 
(
	ProductId integer primary key,
	name varchar(20),
	city varchar(20)
)
go

create table Supplies 
(
	SupplierId integer constraint s_id_FK foreign key references Suppliers(SupplierId), 
	DetailId integer constraint d_id_FK foreign key references Details(DetailId),
	ProductId integer constraint p_id_FK foreign key references Products(ProductId), 
	quantity integer
)
go
insert into Suppliers
values
(1,	'Smith',	20,	'London'),
(2,	'Jonth',	10,	'Paris'),
(3,	'Blacke',	30,	'Paris'),
(4,	'Clarck',	20,	'London'),
(5,	'Adams',	30,	'Athens')

insert into Details
values
(1,	'Screw',		'Red',		12,	'London'),
(2,	'Bolt',			'Green',	17,	'Paris'),
(3,	'Male-screw',	'Blue',		17,	'Roma'),
(4,	'Male-screw',	'Red',		14,	'London'),
(5,	'Whell',		'Blue',		12,	'Paris'),
(6,	'Bloom',		'Red',		19,	'London')

insert into Products
values
(1,	'HDD',			'Paris'),
(2,	'Perforator',	'Roma'),
(3,	'Reader',		'Athens'),
(4,	'Printer',		'Athens'),
(5,	'FDD',			'London'),
(6,	'Terminal',		'Oslo'),
(7,	'Ribbon',		'London')
insert into Supplies values
(1,	1,	1,	200),
(1,	1,	4,	700),
(2,	3,	1,	400),
(2,	3,	2,	200),
(2,	3,	3,	200),
(2,	3,	4,	500),
(2,	3,	5,	600),
(2,	3,	6,	400),
(2,	3,	7,	800),
(2,	5,	2,	100),
(3,	3,	1,	200),
(3,	4,	2,	500),
(4,	6,	3,	300),
(4,	6,	7,	300),
(5,	2,	2,	200),
(5,	2,	4,	100),
(5,	5,	5,	500),
(5,	5,	7,	100),
(5,	6,	2,	200),
(5,	1,	4,	100),
(5,	3,	4,	200),
(5,	4,	4,	800),
(5,	5,	4,	400),
(5,	6,	4,	500)

--select * INTO tmp_Details from Details
--truncate table tmp_Details
select * INTO tmp_Details from Details where 1=2

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (1, 'Screw',         'Blue',     13, 'Osaka');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (2, 'Bolt',           'Pink', 12, 'Tokio');

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (18, 'Whell-24', 'Red',   14, 'Lviv');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (19, 'Whell-28', 'Pink',     15, 'London');

