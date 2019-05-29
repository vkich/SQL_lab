use V_Kichula_module_2
go
--drop table Refrigerator
--drop table if exists Refrigerator
-- I should write drop table if exists ... in newer versions

create table Refrigerator
(
	serial_no integer primary key,
	model varchar(30) not null unique,
	length float NOT NULL constraint length_check CHECK(length > 0),
	width float NOT NULL  constraint width_check CHECK(width > 0),
	height float NOT NULL  constraint height_check CHECK(height > 0),
	weight float NOT NULL  constraint weight_check CHECK(weight > 0), 
	maker varchar(50) NOT NULL,
	energy_class char(1) constraint energy_class_check 
	CHECK ( energy_class IN ('A', 'B', 'C', 'D', 'E') ),
	color varchar(25) constraint default_color DEFAULT ( 'white' ),
	manufactured DATE NOT NULL,
	warranty_period smallint,
	noise_level smallint constraint noise_level_check CHECK (noise_level between 1 and 3)
	constraint noise_level_default DEFAULT (3)
)

select * INTO Refrigerator2 from Refrigerator
  
alter table Refrigerator2 add constraint length_check2 CHECK(length > 0);
alter table Refrigerator2 add op_type char(3);
alter table Refrigerator2 add op_date datetime; 
