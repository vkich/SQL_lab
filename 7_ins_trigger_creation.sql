use V_Kichula_module_2
--drop trigger trg_ins_rfg
go
create trigger trg_ins_rfg on Refrigerator 
after insert as
begin
	if @@ROWCOUNT=0 return
	declare @ins as int = (select count(*) from inserted) 
	declare @del as int = (select count(*) from deleted)
	if @ins>0 and @del=0 
	begin
		INSERT INTO Refrigerator2
		(serial_no, model, length, width, height, weight, 
		maker, energy_class, color, manufactured, warranty_period, noise_level, op_type, op_date)
		SELECT inserted.*, 'ins',  GETDATE() FROM  inserted; 
	end
end




