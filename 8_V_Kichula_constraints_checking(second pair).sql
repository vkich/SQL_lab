use V_Kichula_module_2
delete from Refrigerator
go
-- constraint length_check CHECK(length > 0)
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class, color, manufactured, warranty_period, noise_level
	)
	VALUES
	( 4, 'XLi-Freezer', 0, 1.9, 2.3, 24.1, 'Zanussi', 'A', 'red', '20180112', 1, 2)

-- constraint width_check CHECK(width > 0)
INSERT INTO Refrigerator
	VALUES
	( 4, 'XLi-Freezer', 1, -1, 2.3, 24.1, 'Zanussi', 'A', 'red', '20180112', 1, 2)

-- constraint height_check CHECK(height > 0)
INSERT INTO Refrigerator
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 0, 24.1, 'Zanussi', 'A', 'red', '20180112', 1, 2)

-- constraint weight_check CHECK(weight > 0)
INSERT INTO Refrigerator
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 2.3, -24.1, 'Zanussi', 'A', 'red', '20180112', 1, 2)

-- constraint energy_class_check CHECK ( energy_class IN ('A', 'B', 'C', 'D', 'E') )
INSERT INTO Refrigerator
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'F', 'red', '20180112', 1, 2)

-- constraint default_color DEFAULT ( 'white')
delete from Refrigerator where serial_no=4
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class,  manufactured, warranty_period, noise_level
	)
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1, 2)
select * FROM Refrigerator

--constraint noise_level_check CHECK (noise_level between 1 and 3)
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class,  manufactured, warranty_period, noise_level
	)
	VALUES
	( 24, 'XL-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1, 4)

--constraint noise_level_default DEFAULT (3)
delete from Refrigerator where serial_no=4
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class,  manufactured, warranty_period
	)
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1)
select * FROM Refrigerator

-- model varchar(30) not null unique
delete from Refrigerator where serial_no=4
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class,  manufactured, warranty_period
	)
	VALUES
	( 4, 'XLi-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1),
	( 5, 'XLi-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1)

-- serial_no integer primary key
delete from Refrigerator
INSERT INTO Refrigerator
	(
		serial_no, model, length, width, height, weight, 
		maker, energy_class,  manufactured, warranty_period
	)
	VALUES
	( 4, 'XS-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1),
	( 4, 'XL-Freezer', 1, 1, 2.3, 24.1, 'Zanussi', 'C', '20180112', 1)