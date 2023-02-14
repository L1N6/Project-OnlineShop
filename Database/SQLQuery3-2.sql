USE [master]
GO
CREATE DATABASE [SHOP_DB_Test_4]
GO
USE [SHOP_DB_Test_4]
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[DepartmentID] [int] NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	PRIMARY KEY ([EmployeeID])
)
GO
INSERT [dbo].[Employees] ([LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Davolio', N'Nancy', 1, N'Sales Representative', N'Ms.', CAST(N'1948-12-08T00:00:00.000' AS DateTime), CAST(N'1992-05-01T00:00:00.000' AS DateTime), N'507 - 20th Ave. E.
Apt. 2A')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Fuller', N'Andrew', 5, N'Vice President, Sales', N'Dr.', CAST(N'1952-02-19T00:00:00.000' AS DateTime), CAST(N'1992-08-14T00:00:00.000' AS DateTime), N'908 W. Capital Way')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Leverling', N'Janet', 1, N'Sales Representative', N'Ms.', CAST(N'1963-08-30T00:00:00.000' AS DateTime), CAST(N'1992-04-01T00:00:00.000' AS DateTime), N'722 Moss Bay Blvd.')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Peacock', N'Margaret', 2, N'Sales Representative', N'Mrs.', CAST(N'1937-09-19T00:00:00.000' AS DateTime), CAST(N'1993-05-03T00:00:00.000' AS DateTime), N'4110 Old Redmond Rd.')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Buchanan', N'Steven', 1, N'Sales Manager', N'Mr.', CAST(N'1955-03-04T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'14 Garrett Hill')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'Suyama', N'Michael', 2, N'Sales Representative', N'Mr.', CAST(N'1963-07-02T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'Coventry House
Miner Rd.')
INSERT [dbo].[Employees] ( [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES ( N'King', N'Robert', 1, N'Sales Representative', N'Mr.', CAST(N'1960-05-29T00:00:00.000' AS DateTime), CAST(N'1994-01-02T00:00:00.000' AS DateTime), N'Edgeham Hollow
Winchester Way')	
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	PRIMARY KEY([CustomerID])
		
)
GO
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'ABCDE', N'FPT', N'DoThanh', N'Sales Representative', N'City Center Plaza 516 Main St.')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'EGYJF', N'FPTU', N'ThoPN3', N'Mr', N'Vinhome Smart City')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'ERNSH', N'Ernst Handel', N'Roland Mendel', N'Sales Manager', N'Kirchgasse 6')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FAMIA', N'Familia Arquibaldo', N'Aria Cruz', N'Marketing Assistant', N'Rua Orós, 92')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FISSA', N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'Accounting Manager', N'C/ Moralzarzal, 86')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FOLIG', N'Folies gourmandes', N'Martine Rancé', N'Assistant Sales Agent', N'184, chaussée de Tournai')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FOLKO', N'Folk och fä HB', N'Maria Larsson', N'Owner', N'Åkergatan 24')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FRANK', N'Frankenversand', N'Peter Franken', N'Marketing Manager', N'Berliner Platz 43')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FRANR', N'France restauration', N'Carine Schmitt', N'Marketing Manager', N'54, rue Royale')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FRANS', N'Franchi S.p.A.', N'Paolo Accorti', N'Sales Representative', N'Via Monte Bianco 34')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'FURIB', N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez', N'Sales Manager', N'Jardim das rosas n. 32')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'GALED', N'Galería del gastrónomo', N'Eduardo Saavedra', N'Marketing Manager', N'Rambla de Cataluña, 23')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'GODOS', N'Godos Cocina Típica', N'José Pedro Freyre', N'Sales Manager', N'C/ Romero, 33')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'GOURL', N'Gourmet Lanchonetes', N'André Fonseca', N'Sales Associate', N'Av. Brasil, 442')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'GREAL', N'Great Lakes Food Market', N'Howard Snyder', N'Marketing Manager', N'2732 Baker Blvd.')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'GROSR', N'GROSELLA-Restaurante', N'Manuel Pereira', N'Owner', N'5ª Ave. Los Palos Grandes')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'HANAR', N'Hanari Carnes', N'Mario Pontes', N'Accounting Manager', N'Rua do Paço, 67')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'HILAA', N'HILARION-Abastos', N'Carlos Hernández', N'Sales Representative', N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address]) VALUES (N'HUNGC', N'Hungry Coyote Import Store', N'Yoshi Latimer', N'Sales Representative', N'City Center Plaza 516 Main St.')

GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[CustomerID] [nchar](5) NULL FOREIGN KEY REFERENCES Customers([CustomerID]),
	[EmployeeID] [int] NULL FOREIGN KEY REFERENCES [Employees]([EmployeeID]),
	[Role] [int] NOT NULL,
	PRIMARY KEY ([AccountID])
 )
 
GO
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'emp1@fpt.edu.vn', N'123', NULL, 5, 1)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'emp2@fpt.edu.vn', N'123', NULL, 2, 1)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thanhdqhe163317@fpt.edu.vn', N'123', N'ABCDE', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'cust1@gmail.com', N'123', N'ERNSH', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'cust2@gmail.com', N'123', N'FAMIA', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'adfn3@gmail.com', N'123', N'FISSA', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thodfsapn3@gmail.com', N'123', N'FOLIG', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thopnsa3@gmail.com', N'123', N'FRANK', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thopnad3@gmail.com', N'123', N'FURIB', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thopndfsaaaa3@gmail.com', N'123', N'GALED', NULL, 2)
INSERT [dbo].[Accounts] ( [Email], [Password], [CustomerID], [EmployeeID], [Role]) VALUES ( N'thopaaaaan3@gmail.com', N'123', N'GODOS', NULL, 2)
GO
 CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](15) NOT NULL,
	[Picture] [nvarchar](40) NULL,
	PRIMARY KEY ([BrandID])
	)

GO
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('APPLE','Apple.png')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('SAMSUNG','ss.jpg')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('OPPO','logo-oppo-1.jpg')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('VIVO','vivo.png')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('XIAOMI','Xiaomi.png')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('REALME','realme.png')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('MOBELL','mobell.png')
INSERT [dbo].[Brands] ( [BrandName], [Picture]) VALUES ('ITEL','itel.png')
GO

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[Status][bit] DEFAULT 1,
	PRIMARY KEY ([OrderID])
 )
 GO
INSERT [dbo].[Orders] ( [CustomerID] ,[OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'GODOS',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 107.8300, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ( [CustomerID] ,[OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FOLKO',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime) , 63.3600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ( [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FRANK',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime) , 108.2600, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FRANK',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime) , 54.8300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ( [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FAMIA',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime) , 3.1000, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FURIB', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime) , 1.3000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'GALED', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 10.1400, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'ERNSH',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 101.9500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FOLKO',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 5.4400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (N'ERNSH',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 94.7700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'FAMIA', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 13.9900, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'ERNSH',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 126.3800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate] , [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'HUNGC',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime),  30.3400, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[Orders] ( [CustomerID], [OrderDate], [RequiredDate] , [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'HILAA',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime),  184.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate] , [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (N'FRANK',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime),  135.3500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ( [CustomerID],  [OrderDate], [RequiredDate] , [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES ( N'ERNSH',  CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), 67.8800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
 CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[BrandID] [int] NULL FOREIGN KEY REFERENCES Brands([BrandID]),
	[Chip] [nvarchar](100) NOT NULL,
	[Ram] [int] NOT NULL,
	[Pin] [nvarchar](40) NOT NULL,
	[OperatingSystem] [nvarchar](100) NOT NULL,
	[PhoneScreen] [nvarchar] (100) NOT NULL,
	[Picture] [nvarchar] (100) NOT NULL,
	[Price] [money] NOT NULL 
	PRIMARY KEY ([ProductID])
)
GO
--brand1 APLE
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('iPhone 11',1,'Apple A13 Bionic',4,'3110 mAh,18 W','iOS 15','IPS LCD,6.1",Liquid Retina','iphone-11-(88).jpg',11490000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('iPhone 13 Pro Max',1, 'Apple A15 Bionic',6,'4352 mAh,20 W','iOS 15','OLED,6.7",Super Retina XDR ','iphone-13-pro-max-1tb-(38).jpg',34990000)                   
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('iPhone 13 Pro',1, 'Apple A15 Bionic',6,'3095 mAh,20 W','iOS 15','OLED,6.1",Super Retina XDR','iphone-13-pro-1tb-(38).jpg',29990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('iPhone 14 Pro Max',1, 'Apple A16 Bionic',6,'4323 mAh,20 W','iOS 16','OLED,6.7",Super Retina XDR','iphone-14-pro-max-(40).jpg',29990000)
--brand2 SAMSUNG
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('Samsung Galaxy Z Flip4',2,'Snapdragon 8+ Gen 1',8,'3700 mAh,25 W','Android 12',N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 1.9"Full HD+','samsung-galaxy-z-flip4-(12).jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('Samsung Galaxy S22 Ultra',2,'Snapdragon 8+ Gen 1',8,'5000 mAh,45 W','Android 12',N'Dynamic AMOLED 2X6.8"Quad HD+ (2K+)','samsung-galaxy-s22-ultra-(20).jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('Samsung Galaxy A23',2,'Snapdragon 680',8,'5000 mAh,25 W','Android 12',N'PLS TFT LCD6.6"Full HD+','samsung-galaxy-a23-cam-thumb-600x600.jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES ('Samsung Galaxy Z Fold4',2,'Snapdragon 8+ Gen 1',12,'4400 mAh,25 W','Android 12',N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)','samsung-galaxy-z-fold4-(14).jpg',9490000)
--brand3 OPPO
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'OPPO Reno8 Pro',3, N'MediaTek Dimensity 8100 Max 8 nhân',12,'4500 mAh,80 W','Android 12','AMOLED6.7"Full HD+','oppo-reno8-pro-thumb-xanh-1-600x600.jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'OPPO A55',3, N'MediaTek Helio G35',4,'5000 mAh,18 W','Android 12','IPS LCD6.5"HD+','oppo-a55-4g-(22).jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'OPPO Find X5',3, N'Snapdragon 8 Gen 1',12,'5000 mAh,80 W','Android 12','AMOLED6.7"Quad HD+ (2K+)','oppo-find-x5-pro-(16).jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'OPPO Reno6',3, N'MediaTek Dimensity 900 5G',8,'4300 mAh,65 W','Android 11','AMOLED6.43"Full HD+','oppo-reno6-5g-black-600x600.jpg',9490000)
--brand4 VIVO
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Vivo Y15s',4, N'MediaTek Helio P35',3,N'5000 mAh,10 W',N'Android 11(Go Edition)',N'IPS LCD6.51"HD+','vivo-y15s-2021-(20).jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Vivo V25 Pro',4, N'MediaTek Dimensity 1300',8,N'4830 mAh,66 W',N'Android 12',N'AMOLED6.56"Full HD+','vivo-v25-pro-5g-xanh-thumb-1-600x600.jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Vivo V25',4, N'MediaTek Dimensity 900 5G',8,N'4500 mAh,44 W',N'Android 12',N'AMOLED6.44"Full HD+','vivo-v25-5g-vang-thumb-1-1-600x600.jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Vivo T1',4, N'Snapdragon 778G 5G',8,N'4300 mAh,65 W',N'Android 11',N'AMOLED6.43"Full HD+','vivo-t1-5g-thumb-den-600x600.jpg',9490000)
--brand5 XIAOMI
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Xiaomi Redmi Note 11',5, N'Snapdragon 680',4,N'5000 mAh,30 W',N'Android 11',N'AMOLED6.43"Full HD+','xiaomi-redmi-note-11-4gb-64gb-(26).jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Xiaomi Redmi Note 11S',5, N'MediaTek Dimensity 810 5G',4,N'5000 mAh,30 W',N'Android 12',N'AMOLED6.43"Full HD+','xiaomi-redmi-note-11s-5g-(16).jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Xiaomi 12T Pro',5, N'Snapdragon 8+ Gen 1',4,N'5000 mAh,30 W',N'Android 12',N'AMOLED6.43"Full HD+','xiaomi-12t-pro-thumb-bac-1-600x600.jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Xiaomi 11T Pro',5, N'Snapdragon 888',4,N'5000 mAh,30 W',N'Android 12',N'AMOLED6.43"Full HD+','xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg',9490000)
--brand6 REALME
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Realme 9 Pro+',6, N'MediaTek Dimensity 920 5G',8,N'4500 mAh,60 W',N'Android 12',N'Super AMOLED6.4"Full HD+','realme-9-pro-plus-5g-blue-thumb-600x600.jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Realme 8',6, N'MediaTek Helio G95',4,N'4500 mAh,60 W',N'Android 12',N'Super AMOLED6.4"Full HD+','realme-8-silver-600x600.jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Realme 10	',6, N'MediaTek Helio G99',4,N'5000 mAh,33 W',N'Android 12',N'Super AMOLED6.4"Full HD+','realme-10-thumb-1-600x600.jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Realme 9',6, N'Snapdragon 680',4,N'4500 mAh,60 W',N'Android 12',N'Super AMOLED6.4"Full HD+','realme-9-4g-den-thumb-600x600.jpg',9490000)
--brand7 MOBELL
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Mobell G21',7, N'Unisoc T606',4,N'5050 mAh,18 W',N'Android 12',N'TFT LCD6.5"HD+','mobell-rock-4-xanh-duong-thumb-600x600.jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Mobell G11',7, N'Unisoc T606',4,N'5050 mAh,18 W',N'Android 11',N'TFT LCD6.5"HD+','mobell-m539-do-thumb-600x600.jpg',23990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Mobell C21 Plus',7, N'Unisoc T606',3,N'5050 mAh,18 W',N'Android 12',N'TFT LCD6.5"HD+','mobell-f209-den-thumb-600x600.jpg',4890000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Mobell C31',7, N'Unisoc T606',3,N'5050 mAh,18 W',N'Android 12',N'TFT LCD6.5"HD+','mobell-m239-do-thumb-1-600x600.jpgg',9490000)
--brand8 ITEL
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Itel L6502',8, N'Spreadtrum SC9832E',3,N'4000 mAh,5 W',N'Android 10',N'IPS LCD6.52"HD+','itel-l6502-den-600x600.jpg',18990000)
INSERT [dbo].[Products] ( [ProductName], [BrandID], [Chip],[Ram],[Pin],[OperatingSystem],[PhoneScreen],Picture,[Price]) VALUES (N'Itel L6006',8, N'Spreadtrum SC9832E',2,N'3000 mAh,5 W',N'Android 10',N'IPS LCD6.52"HD+','itel-l6006-violet-600x600.jpg',23990000)


GO

CREATE TABLE [dbo].[ProductStorages](
	ProductStorageID [int] IDENTITY(1,1) NOT NULL,
	ProductID[int] FOREIGN KEY REFERENCES Products([ProductID]) NOT NULL,
	Storage [int] NOT NULL,
	[UnitPrice] [money] NULL,
	PRIMARY KEY (ProductStorageID)
)
GO
--brand1
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (1,64,11490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (1,128,1349000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (2,1000,34990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (3,1000,29990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (4,128,29990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (4,256,32490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (4,512,38490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (4,1000,43490000)
--brand2
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (5,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (5,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (6,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (6,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (7,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (7,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (8,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (8,256,11990000)
--brand3
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (9,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (9,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (10,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (10,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (11,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (11,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (12,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (12,256,11990000)
--brand4
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (13,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (13,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (14,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (14,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (15,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (15,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (16,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (16,256,11990000)
--brand5
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (17,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (17,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (18,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (18,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (19,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (19,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (20,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (20,256,11990000)
--brand6
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (21,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (21,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (22,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (22,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (23,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (23,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (24,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (24,256,11990000)
--brand7
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (25,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (25,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (26,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (26,256,28990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (27,128,4890000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (27,256,6190000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (28,128,9490000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (28,256,11990000)
--brand8
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (29,128,18990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (29,256,20990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (30,128,23990000)
INSERT [dbo].ProductStorages ( ProductID, Storage,[UnitPrice]) VALUES (30,256,28990000)

GO
CREATE TABLE [dbo].[ProductColors](
	ProductColerID [int] IDENTITY(1,1) NOT NULL,
	ProductStorageID[int] FOREIGN KEY REFERENCES ProductStorages([ProductStorageID]) NOT NULL,
	Picture [nvarchar](40),
	Coler[nvarchar](10),
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	
	PRIMARY KEY (ProductColerID)
)
GO
--brand1
INSERT [dbo].[ProductColors] ( [ProductStorageID], Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (1,'iphone-11-den-1-1-1-org.jpg','DEN',92,236)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (2,'iphone-11-den-1-1-1-org.jpg','DEN',154,14)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (2,'iphone-11-trang-1-org.jpg','TRANG',19,235)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (3,'iphone-13-pro-max-1-2.jpg','XAM',114,254)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (3,'iphone-13-pro-max-1.jpg','VANG',11,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (3,'iphone-13-pro-max-1-1.jpg','BAC',341,754)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (3,'iphone-13-pro-max-xanh-1.jpg','XANHDUONG',241,147)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (4,'iphone-13-pro-1tb-xam-1.jpg','XAM',56,14)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (4,'iphone-13-pro-xanh-1.jpg','XANHLA',24,55)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (4,'iphone-13-pro-trang-glr-1.jpg','BAC',25,11)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (5,'iphone-14-pro-vang-1-2.jpg','VANG',44,47)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (5,'iphone-14-pro-den-1-1.jpg','DEN',52,24)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (5,'iphone-14-pro-max-purple-1.jpg','TIM',25,14)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (5,'iphone-14-pro-bac-1-2.jpg','BAC',575,240)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (6,'iphone-14-pro-bac-1-2.jpg','BAC',242,277)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (6,'iphone-14-pro-max-purple-1.jpg','TIM',14,111)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (7,'iphone-14-pro-max-purple-1.jpg','TIM',474,47)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (8,'iphone-14-pro-max-purple-1.jpg','TIM',24,331)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (8,'iphone-14-pro-bac-1-2.jpg','BAC',477,152)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (8,'iphone-14-pro-vang-1-2.jpg','VANG',242,187)
--brand2
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (9,'samsung-galaxy-flip4-glr-tim-1.jpg','TIM',241,187)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (10,'samsung-galaxy-flip4-glr-tim-1.jpg','TIM',41,87)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (11,'samsung-galaxy-z-flip4-xanh-128gb-1.jpg','XANHDUONG',24,18)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (11,'samsung-galaxy-flip4-glr-tim-1.jpg','TIM',21,187)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (12,'samsung-galaxy-z-flip4-xanh-128gb-1.jpg','XANHDUONG',21,157)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (12,'samsung-galaxy-flip4-glr-tim-1.jpg','TIM',24,157)
--brand3
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (13,'oppo-reno8-t-vang-5g-1.jpg','VANG',24,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (14,'oppo-reno8-t-vang-5g-1.jpg','VANG',214,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (15,'oppo-reno8-t-vang-5g-1.jpg','VANG',21,547)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (16,'oppo-reno8-t-vang-5g-1.jpg','VANG',204,57)
--brand4
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (17,'vivo-y35-den-1-1.jpg','VANG',21,7)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (18,'vivo-y35-den-1-1.jpg','VANG',24,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (19,'vivo-y35-den-1-1.jpg','VANG',204,5)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (20,'vivo-y35-den-1-1.jpg','VANG',24,57)
--brand5
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (21,'xiaomi-redmi-note-11-1-3.jpg','XAM',24,157)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (22,'xiaomi-redmi-note-11-1-3.jpg','XAM',214,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (23,'xiaomi-redmi-note-11-1-3.jpg','XAM',24,517)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (24,'xiaomi-redmi-note-11-1-3.jpg','XAM',240,57)
--brand6
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (25,'realme-c30s-xanh-2gb-1.jpg','XANH',24,17)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (26,'realme-c30s-xanh-2gb-1.jpg','XANH',2,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (27,'realme-c30s-xanh-2gb-1.jpg','XANH',21,55)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (28,'realme-c30s-xanh-2gb-1.jpg','XANH',27,57)
--brand7
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (29,'mobell-rock-4-xanh-duong-1.jpg','XANH',27,57)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (30,'mobell-rock-4-xanh-duong-1.jpg','XANH',17,47)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (31,'mobell-rock-4-xanh-duong-1.jpg','XANH',21,17)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (32,'mobell-rock-4-xanh-duong-1.jpg','XANH',27,57)
--brand8
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (33,'itel-l6502-den-1.jpg','DEN',7,7)
INSERT [dbo].[ProductColors] ( ProductStorageID, Picture,Coler,[UnitsInStock],[UnitsOnOrder]) VALUES (34,'itel-l6502-den-1.jpg','DEN',7,7)
CREATE TABLE [dbo].[OrderHistory](
	OrderHistoryID[int] IDENTITY(1,1) NOT NULL,
	EmployeeID [int] FOREIGN KEY REFERENCES Employees([EmployeeID]) NOT NULL,
	[Description] [nvarchar](40) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OrderID] [int] NOT NULL FOREIGN KEY REFERENCES Orders([OrderID]),
	PRIMARY KEY ([OrderHistoryID])
)
GO
INSERT [dbo].[OrderHistory] ( EmployeeID, [Description], [Time],[OrderID]) VALUES (1,'Da Duyet',CAST(N'2023-02-02T00:00:00.000' AS DateTime),1)
GO
CREATE TABLE [dbo].[Events](
	SaleID[int] IDENTITY(1,1) NOT NULL,
	[NameSale] [nvarchar](40) NOT NULL,
	Picture [nvarchar](40) NOT NULL,
	StartSale[datetime] NOT NULL,
	EndSale[datetime] NULL,
	PRIMARY KEY ([SaleID])
)
GO
INSERT [dbo].[Events] (  StartSale, EndSale,[NameSale],Picture) VALUES (CAST(N'2023-01-10T00:00:00.000' AS DateTime),CAST(N'2023-04-01T00:00:00.000' AS DateTime),'SummerSale','eventsale1.jpg')
INSERT [dbo].[Events] (  StartSale, EndSale,[NameSale],Picture) VALUES (CAST(N'2023-02-14T00:00:00.000' AS DateTime),CAST(N'2023-04-14T00:00:00.000' AS DateTime),'PurpleRoseSale','eventsale2.jpg')
INSERT [dbo].[Events] (  StartSale, EndSale,[NameSale],Picture) VALUES (CAST(N'2023-01-01T00:00:00.000' AS DateTime),CAST(N'2023-04-01T00:00:00.000' AS DateTime),'BestSale','salevent3.jpg')

GO
CREATE TABLE [dbo].[Discounts](
	DiscountID[int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] FOREIGN KEY REFERENCES Products([ProductID]) NOT NULL,
	SaleID[int] FOREIGN KEY REFERENCES [Events]([SaleID]) NOT NULL,
	Discount[real] NOT NULL,
	

	PRIMARY KEY ([DiscountID])
)
GO
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (1,2,0.2)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (1,1,0.1)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (14,2,0.15)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (9,2,0.21)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (20,2,0.05)

INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (11,2,0.02)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (22,2,0.2)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (21,2,0.15)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (27,1,0.1)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (19,1,0.05)
INSERT [dbo].[Discounts] (  ProductID, SaleID,Discount) VALUES (18,1,0.05)


GO
CREATE TABLE [dbo].[OrderDetails](
	OrderDetailID [int] IDENTITY(1,1) NOT NULL,
	OrderID [int] FOREIGN KEY REFERENCES Orders([OrderID]) NOT NULL,
	ProductID[int] FOREIGN KEY REFERENCES Products([ProductID]) NOT NULL,
	DiscountID[int] FOREIGN KEY REFERENCES Discounts([DiscountID]) NULL,
	UnitPrice[money] NOT NULL,
	Quantity[int] NOT NULL,
	PRIMARY KEY (OrderDetailID)

)
GO
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,19,10,4645500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (1,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,18,11,22790500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (2,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (3,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (4,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (4,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (4,19,10,4645500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (4,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (5,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (5,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (5,18,11,22790500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (5,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (6,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (7,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (7,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (7,19,10,4645500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (7,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (8,1,2,9192000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (8,27,9,4401000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (8,18,11,22790500,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (8,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (9,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (10,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (11,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (12,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (13,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (14,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (15,4,29990000,1);
INSERT [dbo].[OrderDetails] (OrderID,ProductID,UnitPrice,Quantity) VALUES (16,4,29990000,1);

GO
CREATE TABLE [dbo].[Cart](
	CartID [int] IDENTITY(1,1) NOT NULL,
	AccountID [int] FOREIGN KEY REFERENCES Accounts (AccountID)NOT NULL,
	PRIMARY KEY (CartID)
)
INSERT [dbo].[Cart] (AccountID) VALUES (3);
INSERT [dbo].[Cart] (AccountID) VALUES (4);
INSERT [dbo].[Cart] (AccountID) VALUES (5);
INSERT [dbo].[Cart] (AccountID) VALUES (6);
INSERT [dbo].[Cart] (AccountID) VALUES (7);
INSERT [dbo].[Cart] (AccountID) VALUES (8);
INSERT [dbo].[Cart] (AccountID) VALUES (9);


CREATE TABLE [dbo].[CartDetails](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	CartID [int]  FOREIGN KEY REFERENCES [Cart](CartID) NOT NULL,
	ProductID[int] FOREIGN KEY REFERENCES Products([ProductID]) NOT NULL,
	Quantity[int] NOT NULL,
	UnitPrice[int] NOT NULL,
	DiscountID[int] FOREIGN KEY REFERENCES Discounts([DiscountID])NULL,
	PRIMARY KEY ([CartDetailID])
)

GO
INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,1,2,9192000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,27,9,4401000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (1,19,10,4645500,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (1,4,29990000,1);

INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,1,2,9192000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,27,9,4401000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,DiscountID,UnitPrice,Quantity) VALUES (2,18,11,22790500,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (2,4,29990000,1);

INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (3,4,29990000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (4,4,29990000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (5,4,29990000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (6,4,29990000,1);
INSERT [dbo].[CartDetails] (CartID,ProductID,UnitPrice,Quantity) VALUES (7,4,29990000,1);


GO
CREATE TABLE [dbo].[Comment](
	CommentID[int] IDENTITY(1,1) NOT NULL,
	AccountID[int] FOREIGN KEY REFERENCES Accounts([AccountID]) NOT NULL,
	
	Rate[int] NULL,
	ProductID[int] FOREIGN KEY REFERENCES Products([ProductID]) ,
	[Time] [datetime] NOT NULL ,
	[Description] [ntext] NULL,
	[Picture] [nvarchar](40) NULL,
	PRIMARY KEY ([CommentID])
	)
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,5,1,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,5,1,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,5,1,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (7,5,1,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,5,2,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,2,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,4,2,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (8,5,2,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,5,3,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,4,3,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,4,3,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (9,5,3,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,5,4,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,5,4,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,4,4,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (10,5,4,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,5,5,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,5,5,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,4,5,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,5,5,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,4,6,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Nice Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,4,6,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'Best Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,4,6,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'Good Product')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,4,6,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'Nice')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,7,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,8,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,9,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,10,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')

	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,11,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,12,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,13,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,14,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,15,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,16,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,17,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,18,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,19,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,20,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,21,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,22,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,23,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,24,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,25,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,26,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (3,2,27,CAST(N'2023-01-01T00:00:00.000' AS DateTime),'Bad Phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (4,3,28,CAST(N'2023-01-02T00:00:00.000' AS DateTime),'I hate this phone')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (5,1,29,CAST(N'2023-01-03T00:00:00.000' AS DateTime),'never buy again')
	INSERT [dbo].[Comment] (AccountID, Rate,ProductID,[Time],[Description]) VALUES (6,2,30,CAST(N'2023-01-04T00:00:00.000' AS DateTime),'bad')


GO
CREATE TABLE [dbo].[HistoryProducts](
	HistoryID [int] IDENTITY(1,1)  NOT NULL,
	ProductID[int] FOREIGN KEY REFERENCES Products(ProductID) NOT NULL,
	EmployeeID[int] FOREIGN KEY REFERENCES Employees([EmployeeID]) NOT NULL,
	[Description] [nvarchar](40) NOT NULL,
	[Time] [datetime] NOT NULL,
	PRIMARY KEY ([HistoryID])

)



