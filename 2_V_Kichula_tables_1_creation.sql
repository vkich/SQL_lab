use V_Kichula_module_2
drop table if exists Building
go
drop table if exists Building_owner
go

create table Building_Owner 
( 
	owner_ID int primary key, 
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	phone_number char(12) NOT NULL UNIQUE,
	constraint Phone_Number_Check CHECK (phone_number like 
	'([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	birth_date date NULL,
	sex char(1) NOT NULL 
	constraint sex_check CHECK(sex in ('M', 'F') ),
	married CHAR(1) constraint married_check CHECK (married IN('y', 'n')),
	number_of_kids INT constraint number_of_kids_default DEFAULT(0)
	constraint number_of_kids_check CHECK(number_of_kids>=0),
	inserted_date date,
	updated_date date
)
go

create table Building
(
	name varchar(50) NOT NULL,
	[owner] INT NOT NULL,
	[address] varchar(100) NOT NULL,
	floor_count smallint,
	area float NOT NULL,
	price_m2 decimal(8,2) NOT NULL,
	width float NOT NULL,
	[length] float NOT NULL,
	inserted_date date,
	updated_date date
)
go
	
ALTER TABLE [Building] ADD  CONSTRAINT PK_Building PRIMARY KEY
CLUSTERED ([name]);

ALTER TABLE [Building] ADD 
	CONSTRAINT FK_Building_owner FOREIGN KEY ([owner]) 
	REFERENCES [Building_Owner] ([owner_ID]);

alter table Building add constraint address_unique
			UNIQUE ([address]);
			
alter table Building add constraint floor_count_default
			DEFAULT 1 for floor_count;