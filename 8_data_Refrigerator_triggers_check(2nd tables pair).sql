use V_Kichula_module_2
delete from Refrigerator
delete from Refrigerator2
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class, color, manufactured, warranty_period, noise_level
	)
	VALUES
	( 1, 'SamsFreeze', 1.8, 1.5, 2.0, 22.1, 'Samsung', 'A', 'black', '20180609', 1, 2),
	( 4, 'XLi-Freezer', 2.1, 1.9, 2.3, 24.1, 'Zanussi', 'A', 'red', '20180112', 1, 2),
	( 5, 'Xi-Freezer', 2, 1, 2, 22.1, 'Zanussi', 'A', 'white', '20180112', 1, 2),
	( 6, 'XSi-Freezer', 2.1, 1.1, 2.1, 21.1, 'Zanussi', 'B', 'white', '20180112', 1, 2)
	
	delete from Refrigerator where serial_no in (1, 6)
	update Refrigerator set width=1.1 where serial_no=5
	select * from Refrigerator
	select * from Refrigerator2