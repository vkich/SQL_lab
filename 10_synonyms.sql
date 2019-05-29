use master
--drop database if exists education;
IF EXISTS(select * from sys.databases where name='education')
DROP DATABASE education;
go
create database education;
go
use education
go
create schema V_Kichula_module_2
go
--drop synonym refr2
create synonym refr for V_Kichula_module_2.dbo.Refrigerator
create synonym refr2 for V_Kichula_module_2.dbo.Refrigerator2
create synonym BO for V_Kichula_module_2.Building_Owner
create synonym Build for V_Kichula_module_2.dbo.Building

select * from refr
select * from Build
select * from sys.tables