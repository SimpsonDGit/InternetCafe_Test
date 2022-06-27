Use BMGS

Create table USER_ROLES
(
	name varchar(10) primary key,
	description varchar(50) not null,
);

Insert into USER_ROLES values
('Admin', 'Administrator Account'),
('Employee', 'Employee Base Account'),
('General', 'Restricted Client Account')



cREATE table USERS
(
	Username varchar(12) primary key,
	password VARBINARY(255) not null,
	name varchar(10) not null,
	created_at datetime not null,
	Constraint fk_role foreign key (name) references USER_ROLES
); 

Insert into USERS  (Username, password, name, created_at) values
('SupeA', ENCRYPTBYPASSPHRASE('SHA1','encryptA'), 'Admin', GETDATE()),
('BMGSemp', ENCRYPTBYPASSPHRASE('SHA1','encryptB'), 'Employee',GETDATE())
--('MachineA', ENCRYPTBYPASSPHRASE('SHA1','bmgsA'),'General' ,GETDATE()),
--('MachineB', ENCRYPTBYPASSPHRASE('SHA1','bmgsB'), 'General',GETDATE()),
--('MachineC', ENCRYPTBYPASSPHRASE('SHA1', 'bmgsC'),'General',GETDATE()),
--('MachineD', ENCRYPTBYPASSPHRASE('SHA1','bmgsD'),'General',GETDATE())



--Truncate Table USERS
Select * From USER_ROLES
Select * From USERS
Select Username,password, Convert(varchar(250), DECRYPTBYPASSPHRASE('SHA1',[password])) as 'Password' From USERS

