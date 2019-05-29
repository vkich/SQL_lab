-- Привіт експертам. Використовував SQL Server 2008 або 2014,
-- тому деколи IF EXISTS закоментовано. 

use master
go
IF EXISTS(select * from sys.databases where name='V_Kichula_module_2')
DROP DATABASE V_Kichula_module_2
--drop database if exists [V_Kichula_module_2]
go
create database [V_Kichula_module_2]
go
alter database [V_Kichula_module_2]
ADD FILEGROUP my_data
go
alter database [V_Kichula_module_2]
add file (name=my_data_file, filename='c:\temp\DB_data_file.mdf',
size=1Mb, maxsize=49Mb, filegrowth=2Mb)
to filegroup my_data

alter database [V_Kichula_module_2]
modify filegroup my_data default