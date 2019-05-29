use V_Kichula_module_2
go
--drop trigger trg_upd_building

create trigger trg_upd_building on Building 
after update as
begin
	--if @@ROWCOUNT=0 return
	declare @ins as int = (select count(*) from inserted) 
	declare @del as int = (select count(*) from deleted)
	if @ins>0 and @del>0 
	begin
		update Building set updated_date = getdate() from Building
		join inserted on Building.name=inserted.name
		print 'hello from after update trigger'
	end
end




