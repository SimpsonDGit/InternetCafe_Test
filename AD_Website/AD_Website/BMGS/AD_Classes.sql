Create Database BMGS
Use BMGS

Create Table EMPLOYEE
(	EmpTRN varchar (10) primary key,
	Name varchar (50) not null,
	Address varchar(50) not null,
	SupervisorID varchar(10) not null,
	CONSTRAINT fk_supID FOREIGN KEY (supervisorID) REFERENCES EMPLOYEE
)

Insert into EMPLOYEE values
('231584693','Marcus Brook','New View Terrace','814357018'),
('782154327','David Stewart','Old Haven','782154327'),
('981234621','Genie Brad','Lacrosse Lane','782154327'),
('158743209','Kylian Jahn','Progress Port','814357018'),
('814357018','Griez Blue','Bleu Court','814357018')

CREATE Table HARDWARE
(	hardwareID varchar (10) primary key,
	status varchar (50) not null,
	brand varchar(50) not null,
	IP_address  varchar(20) not null
)

Insert into HARDWARE values
('H3X501','Available','HP','172.16.0.32'),
('D1A100','Rented','DELL','172.16.0.30'),
('Y5L294','Available','Yealink','172.16.0.46'),
('D2A103','Available','DELL','172.16.0.27'),
('X1P912','Maintenance Due','DELL','172.16.0.90'),
('A6Y426','Available','Avaya','172.16.0.48')

Create Table COMPUTER
(	hardware_ID varchar (10) not null,
	type varchar (50) not null,
	value int not null,
	os_version  varchar(50) not null,
	CONSTRAINT fk_hadware FOREIGN KEY (hardware_ID) REFERENCES HARDWARE
)

Insert into COMPUTER values
('H3X501','Z2 Workstation', 175,'Windows 10'),
('D1A100','Inspiron', 150,'Windows 8.1'),
('D2A103','Inspiron', 150,'Windows 8.1'),
('X1P912','XPS', 130,'Windows 7')


Create Table VOIP_BOOTH
(	hardware_ID varchar (10) not null,
	software_used varchar (50) not null,
	software_version  varchar(50) not null,
	CONSTRAINT fk_hrdware FOREIGN KEY (hardware_ID) REFERENCES  HARDWARE
)

Insert into VOIP_BOOTH values
('Y5L294','Softphone','3CX'),
('A6Y426','Softphone','Asterisk PBX')

Create Table RENTAL
(	reference# int identity(100,3) primary key,
	hardware_ID varchar(10) not null,
	rental_date date not null,
	#_hrs int null,
	final_cost int null,
	empTRN varchar(10) not null,
	supID varchar(10) not null,
	name varchar(50) not null,
	email varchar (50) not null
	CONSTRAINT fk_empltrn FOREIGN KEY (empTRN) REFERENCES  EMPLOYEE,
	CONSTRAINT fk_hardware FOREIGN KEY (hardware_id) REFERENCES HARDWARE,
	CONSTRAINT fk_supervisor FOREIGN KEY (supID) REFERENCES EMPLOYEE
)

Insert into RENTAL values
('A6Y426','2018-09-28',5, 500,'981234621','231584693','Hanna Brewd', 'hanna@gmail.com'),
('D2A103','2018-10-01',2, 300,'158743209','814357018','Michael Dean', 'michaeld@gmail.com'),
('H3X501','2018-10-01',3, 525,'231584693','814357018','Ally May', 'allym@gmail.com')


Create Table MAINTENANCE
(	
	Service# int identity(1,1) primary key,
	hardware_ID varchar(10),
	Maintenance# int not null,
	empTRN varchar (10) not null,
	date date not null,
	type  varchar(50) not null,
	CONSTRAINT fk_hdware FOREIGN KEY (hardware_ID) REFERENCES  HARDWARE,
	CONSTRAINT fk_employtrn FOREIGN KEY (empTRN) REFERENCES  EMPLOYEE
) 

Insert into Maintenance values
('D1A100',1,'814357018','2018-09-22','Servicing'),
('X1P912',1,'782154327','2018-10-16','Replace Fan'),
('D1A100',2,'814357018','2018-10-22','Servicing')

Select * From MAINTENANCE
Select * From EMPLOYEE
Select * from HARDWARE
Select * From RENTAL
Select * From COMPUTER
Select * From VOIP_BOOTH

