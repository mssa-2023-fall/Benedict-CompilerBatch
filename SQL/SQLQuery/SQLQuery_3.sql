-- create table ba.demoTable(
-- ColA int,
-- ColB int UNIQUE,
-- ColC varchar (10) UNIQUE,
-- ColD VARCHAR(10) NOT NULL,
-- colE varchar(10),
-- ColF varchar(10)
-- CONSTRAINT [PK_ba_demoTable] PRIMARY KEY CLUSTERED (ColE,ColF)
-- );

insert into ba.demoTable(ColA,ColB,ColC,ColD,ColE,ColF)
values (1,1,'test','test2','test3','test4')

insert into ba.demoTable(ColA,ColB,ColC,ColD,ColE,ColF)
values (1,2,'Cat','Dog','Brown','Bear')

Select * FROM ba.demoTable

insert into ba.demoTable(ColC,ColD,ColE,ColF)
values ('test5','test2','test6','test7')

UPDATE ba.demoTable
set ColA=5,ColB=3,ColD='test9'
WHERE ColE='test3' AND ColF = 'test4'

DELETE from ba.demoTable
WHERE ColE='test3' AND ColF = 'test4'

-- create table ba.Category(
--     CategoryID int identity primary key CLUSTERED,
--     CategoryName nvarchar(20) not null UNIQUE,
--     CategoryDescription nvarchar(1000)
-- )

-- create table ba.Product(
--     ProductID int identity primary key clustered,
--     CategoryID int REFERENCES ba.Category(CategoryID),
--     ProductName NVARCHAR(50) not null unique,
--     ProductDescription nvarchar(100)
-- )

INSERT INTO ba.Category(CategoryName,CategoryDescription)
values('Hardware', 'Things you put inside a computer box');

INSERT INTO ba.Category(CategoryName,CategoryDescription)
values('Peripherals', 'Things you use to interface with the hardware');

INSERT INTO ba.Category(CategoryName,CategoryDescription)
values('Software', 'Things you install on the computer');

Select * from ba.Category
Select * FROM ba.Product

INSERT INTO ba.Product(CATEGORYID,ProductName,ProductDescription)
values(1,'Graphics Card', 'Houses GPUs to be installed in a computer box')
INSERT INTO ba.Product(CATEGORYID,ProductName,ProductDescription)
values(3,'Skyrim', 'The Ultimate Final Definitive Legendary Of-The-Year Edition.')
INSERT INTO ba.Product(CATEGORYID,ProductName,ProductDescription)
values (2,'Mouse', 'Used to interact with the GUI')