USE [SHOP_DB_Test_19]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[Role] [int] NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](15) NOT NULL,
	[Picture] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ProductDetailID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DiscountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Rate] [int] NULL,
	[ProductID] [int] NULL,
	[Time] [datetime] NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[Gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[Discount] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](40) NOT NULL,
	[Picture] [nvarchar](40) NOT NULL,
	[StartEvent] [datetime] NOT NULL,
	[EndEvent] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryProductDetails]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryProductDetails](
	[HistoryProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[ProductDetailID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductStorage] [int] NULL,
	[UnitPrice] [money] NULL,
	[Picture] [nvarchar](40) NULL,
	[Coler] [nvarchar](10) NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[Status] [nvarchar](40) NOT NULL,
	[Time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryProducts]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryProducts](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NULL,
	[BrandID] [int] NULL,
	[Chip] [nvarchar](100) NULL,
	[Ram] [int] NULL,
	[Pin] [nvarchar](40) NULL,
	[OperatingSystem] [nvarchar](100) NULL,
	[PhoneScreen] [nvarchar](100) NULL,
	[Picture] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Status] [nvarchar](40) NOT NULL,
	[Time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[DiscountID] [int] NULL,
	[ProductDetailID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[OrderHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Description] [nvarchar](40) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OrderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
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
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductStorage] [int] NOT NULL,
	[UnitPrice] [money] NULL,
	[Picture] [nvarchar](40) NULL,
	[Coler] [nvarchar](10) NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/1/2023 9:31:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[BrandID] [int] NULL,
	[Chip] [nvarchar](100) NOT NULL,
	[Ram] [int] NOT NULL,
	[Pin] [nvarchar](40) NOT NULL,
	[OperatingSystem] [nvarchar](100) NOT NULL,
	[PhoneScreen] [nvarchar](100) NOT NULL,
	[Picture] [nvarchar](100) NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (1, N'emp1@fpt.edu.vn', N'123', NULL, 5, 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (2, N'emp2@fpt.edu.vn', N'123', NULL, 2, 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (3, N'thanhdqhe163317@fpt.edu.vn', N'123', N'ABCDE', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (4, N'cust1@gmail.com', N'123', N'ERNSH', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (5, N'cust2@gmail.com', N'123', N'FAMIA', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (6, N'adfn3@gmail.com', N'123', N'FISSA', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (7, N'thodfsapn3@gmail.com', N'123', N'FOLIG', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (8, N'thopnsa3@gmail.com', N'123', N'FRANK', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (9, N'thopnad3@gmail.com', N'123', N'FURIB', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (10, N'thopndfsaaaa3@gmail.com', N'123', N'GALED', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (11, N'thopaaaaan3@gmail.com', N'123', N'GODOS', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (12, N'admin', N'123', NULL, NULL, 3, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [Status]) VALUES (13, N'levietaqviet2001@gmail.com', N'uyfedvdfyjyl', N'levaa', NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (1, N'APPLE', N'Apple.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (2, N'SAMSUNG', N'ss.jpg')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (3, N'OPPO', N'logo-oppo-1.jpg')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (4, N'VIVO', N'vivo.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (5, N'XIAOMI', N'Xiaomi.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (6, N'REALME', N'realme.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (7, N'MOBELL', N'mobell.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Picture]) VALUES (8, N'ITEL', N'itel.png')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetails] ON 

INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (1, 3, 1, 10, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (2, 3, 2, 5, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (3, 3, 3, 5, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (4, 3, 39, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (5, 3, 40, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (6, 4, 4, 5, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (7, 4, 5, 4, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (8, 4, 6, 7, 3)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (9, 4, 41, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (10, 4, 42, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (11, 5, 42, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (12, 6, 42, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (13, 7, 42, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (14, 8, 42, 3, NULL)
INSERT [dbo].[CartDetails] ([CartDetailID], [AccountID], [ProductDetailID], [Quantity], [DiscountID]) VALUES (15, 9, 42, 3, NULL)
SET IDENTITY_INSERT [dbo].[CartDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (1, 3, 1, 5, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (2, 4, 1, 5, 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (3, 5, 1, 5, 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (4, 7, 1, 5, 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (5, 3, 1, 5, 2, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (6, 4, 1, 3, 2, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (7, 5, 1, 4, 2, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (8, 8, 1, 5, 2, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (9, 3, 1, 5, 3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (10, 4, 1, 4, 3, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (11, 5, 1, 4, 3, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (12, 9, 1, 5, 3, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (13, 3, 1, 5, 4, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (14, 4, 1, 5, 4, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (15, 5, 1, 4, 4, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (16, 10, 1, 5, 4, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (17, 3, 1, 5, 5, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (18, 4, 1, 5, 5, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (19, 5, 1, 4, 5, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (20, 6, 1, 5, 5, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (21, 3, 1, 4, 6, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Nice Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (22, 4, 1, 4, 6, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (23, 5, 1, 4, 6, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (24, 6, 1, 4, 6, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (25, 3, 1, 2, 7, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (26, 4, 1, 3, 8, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (27, 5, 1, 5, 9, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good Product', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (28, 6, 1, 5, 9, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good ', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (29, 7, 1, 5, 9, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good ', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (30, 8, 1, 5, 9, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Good ', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (31, 3, 1, 2, 11, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (32, 4, 1, 3, 12, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (33, 5, 1, 1, 13, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'never buy again', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (34, 6, 1, 2, 14, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'bad', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (35, 6, 1, 5, 14, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Wow', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (36, 7, 1, 5, 14, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Good', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (37, 8, 1, 5, 14, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Best Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (38, 3, 1, 2, 15, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (39, 4, 1, 3, 16, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (40, 5, 1, 1, 17, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'never buy again', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (41, 6, 1, 2, 18, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'bad', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (42, 3, 1, 2, 19, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (43, 4, 1, 3, 20, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (44, 5, 1, 1, 21, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'never buy again', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (45, 6, 1, 5, 22, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'bad', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (46, 7, 1, 5, 22, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Nice', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (47, 8, 1, 5, 22, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Good Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (48, 9, 1, 5, 22, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'yeah', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (49, 3, 1, 2, 23, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (50, 4, 1, 3, 24, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (51, 5, 1, 1, 25, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'never buy again', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (52, 6, 1, 2, 26, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'bad', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (53, 3, 1, 5, 27, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Bad Phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (54, 4, 1, 3, 28, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'I hate this phone', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (55, 5, 1, 3, 29, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'never buy again', NULL)
INSERT [dbo].[Comments] ([CommentID], [AccountID], [Status], [Rate], [ProductID], [Time], [Description], [Picture]) VALUES (56, 6, 1, 4, 30, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'bad', NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'ABCDE', N'FPT', N'DoThanh', N'Sales Representative', N'City Center Plaza 516 Main St.', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'EGYJF', N'FPTU', N'ThoPN3', N'Mr', N'Vinhome Smart City', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'ERNSH', N'Ernst Handel', N'Roland Mendel', N'Sales Manager', N'Kirchgasse 6', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FAMIA', N'Familia Arquibaldo', N'Aria Cruz', N'Marketing Assistant', N'Rua Orós, 92', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FISSA', N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'Accounting Manager', N'C/ Moralzarzal, 86', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FOLIG', N'Folies gourmandes', N'Martine Rancé', N'Assistant Sales Agent', N'184, chaussée de Tournai', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FOLKO', N'Folk och fä HB', N'Maria Larsson', N'Owner', N'Åkergatan 24', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FRANK', N'Frankenversand', N'Peter Franken', N'Marketing Manager', N'Berliner Platz 43', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FRANR', N'France restauration', N'Carine Schmitt', N'Marketing Manager', N'54, rue Royale', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FRANS', N'Franchi S.p.A.', N'Paolo Accorti', N'Sales Representative', N'Via Monte Bianco 34', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'FURIB', N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez', N'Sales Manager', N'Jardim das rosas n. 32', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'GALED', N'Galería del gastrónomo', N'Eduardo Saavedra', N'Marketing Manager', N'Rambla de Cataluña, 23', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'GODOS', N'Godos Cocina Típica', N'José Pedro Freyre', N'Sales Manager', N'C/ Romero, 33', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'GOURL', N'Gourmet Lanchonetes', N'André Fonseca', N'Sales Associate', N'Av. Brasil, 442', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'GREAL', N'Great Lakes Food Market', N'Howard Snyder', N'Marketing Manager', N'2732 Baker Blvd.', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'GROSR', N'GROSELLA-Restaurante', N'Manuel Pereira', N'Owner', N'5ª Ave. Los Palos Grandes', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'HANAR', N'Hanari Carnes', N'Mario Pontes', N'Accounting Manager', N'Rua do Paço, 67', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'HILAA', N'HILARION-Abastos', N'Carlos Hernández', N'Sales Representative', N'Carrera 22 con Ave. Carlos Soublette #8-35', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'HUNGC', N'Hungry Coyote Import Store', N'Yoshi Latimer', N'Sales Representative', N'City Center Plaza 516 Main St.', 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [Gender]) VALUES (N'levaa', N'Null', N'aaaaa aa', N'NULL', N'ha noi', 0)
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (1, 1, 1, 0.2)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (2, 2, 1, 0.15)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (3, 3, 1, 0.2)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (4, 4, 1, 0.75)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (5, 5, 1, 0.2)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (6, 6, 1, 0.1)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (7, 9, 2, 0.075)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (8, 10, 2, 0.05)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (9, 11, 2, 0.005)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (10, 12, 3, 0.075)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (11, 13, 3, 0.09)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (12, 14, 3, 0.08)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (13, 15, 3, 0.07)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (14, 16, 3, 0.06)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (15, 1, 4, 0.1)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (16, 2, 4, 0.11)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (17, 3, 4, 0.22)
INSERT [dbo].[Discounts] ([DiscountID], [ProductID], [EventID], [Discount]) VALUES (18, 4, 4, 0.77)
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (1, N'Davolio', N'Nancy', 1, N'Sales Representative', N'Ms.', CAST(N'1948-12-08T00:00:00.000' AS DateTime), CAST(N'1992-05-01T00:00:00.000' AS DateTime), N'507 - 20th Ave. E.
Apt. 2A')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (2, N'Fuller', N'Andrew', 5, N'Vice President, Sales', N'Dr.', CAST(N'1952-02-19T00:00:00.000' AS DateTime), CAST(N'1992-08-14T00:00:00.000' AS DateTime), N'908 W. Capital Way')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (3, N'Leverling', N'Janet', 1, N'Sales Representative', N'Ms.', CAST(N'1963-08-30T00:00:00.000' AS DateTime), CAST(N'1992-04-01T00:00:00.000' AS DateTime), N'722 Moss Bay Blvd.')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (4, N'Peacock', N'Margaret', 2, N'Sales Representative', N'Mrs.', CAST(N'1937-09-19T00:00:00.000' AS DateTime), CAST(N'1993-05-03T00:00:00.000' AS DateTime), N'4110 Old Redmond Rd.')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (5, N'Buchanan', N'Steven', 1, N'Sales Manager', N'Mr.', CAST(N'1955-03-04T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'14 Garrett Hill')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (6, N'Suyama', N'Michael', 2, N'Sales Representative', N'Mr.', CAST(N'1963-07-02T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'Coventry House
Miner Rd.')
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address]) VALUES (7, N'King', N'Robert', 1, N'Sales Representative', N'Mr.', CAST(N'1960-05-29T00:00:00.000' AS DateTime), CAST(N'1994-01-02T00:00:00.000' AS DateTime), N'Edgeham Hollow
Winchester Way')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [EventName], [Picture], [StartEvent], [EndEvent]) VALUES (1, N'SummerSale', N'eventsale1.jpg', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Events] ([EventID], [EventName], [Picture], [StartEvent], [EndEvent]) VALUES (2, N'PurpleRoseSale', N'purplesale.jpg', CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2023-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Events] ([EventID], [EventName], [Picture], [StartEvent], [EndEvent]) VALUES (3, N'BestSale', N'salevent3.jpg', CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Events] ([EventID], [EventName], [Picture], [StartEvent], [EndEvent]) VALUES (4, N'RedSale', N'redsale.jpg', CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-04-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryProductDetails] ON 

INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (1, 9, 1, 1, 64, 11490000.0000, N'iphone-11-den-1-1-1-org.jpg', N'DEN', 92, 10, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (2, 9, 2, 1, 128, 1349000.0000, N'iphone-11-trang-1-org.jpg', N'TRANG', 19, 11, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (3, 9, 3, 2, 1000, 34990000.0000, N'iphone-13-pro-max-1-2.jpg', N'XAM', 114, 5, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (4, 9, 4, 2, 1000, 34990000.0000, N'iphone-13-pro-max-1-1.jpg', N'BAC', 341, 5, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (5, 9, 5, 2, 1000, 34990000.0000, N'iphone-13-pro-max-xanh-1.jpg', N'XANHDUONG', 241, 4, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (6, 9, 6, 3, 1000, 29990000.0000, N'iphone-13-pro-max-1-1.jpg', N'BAC', 341, 7, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (7, 9, 7, 3, 1000, 29990000.0000, N'iphone-13-pro-max-xanh-1.jpg', N'XANHDUONG', 241, 8, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (8, 9, 8, 3, 1000, 29990000.0000, N'iphone-13-pro-1tb-xam-1.jpg', N'XAM', 56, 9, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (9, 9, 9, 3, 1000, 29990000.0000, N'iphone-13-pro-xanh-1.jpg', N'XANHLA', 24, 10, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (10, 9, 10, 4, 128, 29990000.0000, N'iphone-14-pro-vang-1-2.jpg', N'VANG', 44, 2, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (11, 9, 11, 4, 128, 29990000.0000, N'iphone-14-pro-den-1-1.jpg', N'DEN', 52, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (12, 9, 12, 4, 128, 29990000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 25, 4, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (13, 9, 13, 4, 128, 29990000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 1, 2, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (14, 9, 14, 4, 256, 32490000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 1, 5, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (15, 9, 15, 4, 256, 32490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 14, 1, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (16, 9, 16, 4, 512, 38490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 474, 7, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (17, 9, 17, 4, 1000, 43490000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 477, 8, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (18, 9, 18, 4, 1000, 43490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 24, 9, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (19, 9, 19, 4, 1000, 43490000.0000, N'iphone-14-pro-vang-1-2.jpg', N'VANG', 242, 1, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (20, 9, 20, 5, 128, 18990000.0000, N'samsung-galaxy-flip4-glr-tim-1.jpg', N'TIM', 1000, 2, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (21, 9, 21, 5, 128, 18990000.0000, N'samsung-galaxy-flip4-glr-tim-1.jpg', N'TIM', 1000, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (22, 9, 22, 5, 256, 20990000.0000, N'samsung-galaxy-z-flip4-xanh-128gb-1.jpg', N'XANHDUONG', 1000, 4, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (23, 9, 23, 6, 128, 23990000.0000, N'samsung-galaxy-s22-ultra-1-1 .jpg', N'Do', 1000, 5, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (24, 9, 24, 6, 256, 28990000.0000, N'samsung-galaxy-s22-ultra-1-1 .jpg', N'Do', 1000, 6, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (25, 9, 25, 7, 128, 4890000.0000, N'samsung-galaxy-a23-1-1.jpg', N'DEN', 1000, 7, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (26, 9, 26, 7, 256, 6190000.0000, N'samsung-galaxy-a23-1-1.jpg', N'DEN', 1000, 8, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (27, 9, 27, 8, 128, 9490000.0000, N'samsung-galaxy-z-flod-4-den-1.jpg', N'DEN', 2000, 9, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (28, 9, 28, 9, 128, 18990000.0000, N'oppo-reno8-pro-black-1.jpg', N'DEN', 24, 1, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (29, 9, 29, 10, 128, 23990000.0000, N'oppo-a55-4g-1-2.jpg', N'DEN', 24, 1, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (30, 9, 30, 11, 128, 4890000.0000, N'oppo-find-x5-pro-1-1.jpg', N'DEN', 24, 1, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (31, 9, 31, 12, 256, 11990000.0000, N'oppo-reno6-den-1-org.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (32, 9, 32, 13, 128, 18990000.0000, N'Vivo-y15s-2021-xanh-den-200x200.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (33, 9, 33, 14, 128, 23990000.0000, N'vivo-v25-pro-5g-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (34, 9, 34, 15, 128, 4890000.0000, N'vivo-v25-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (35, 9, 35, 16, 128, 9490000.0000, N'vivo-t1-5g-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (36, 9, 36, 17, 128, 18990000.0000, N'xiaomi-redmi-note-11-pro-4g-1-3.jpg', N'TRANG', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (37, 9, 37, 18, 128, 23990000.0000, N'xiaomi-redmi-note-11s-5g-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (38, 9, 38, 19, 128, 4890000.0000, N'xiaomi-12t-pro-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (39, 9, 39, 20, 128, 9490000.0000, N'xiaomi-11t-pro-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (40, 9, 40, 21, 128, 18990000.0000, N'realme-9-pro-1-1.jpg', N'XANHDUONG', 24, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (41, 9, 41, 22, 128, 23990000.0000, N'realme-8-pro-den-1-org.jpg', N'DEN', 24, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (42, 9, 42, 23, 128, 4890000.0000, N'realme-10-xanh-1.jpg', N'DEN', 24, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (43, 9, 43, 24, 128, 9490000.0000, N'realme-9-4g-1-2.jpg', N'DEN', 24, 3, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (44, 9, 44, 25, 128, 18990000.0000, N'mobell-rock-4-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (45, 9, 45, 26, 128, 23990000.0000, N'mobell-m539-den-1-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (46, 9, 46, 27, 128, 4890000.0000, N'mobell-f209-den-1-2.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (47, 9, 47, 28, 128, 9490000.0000, N'mobell-m239-1-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (48, 9, 48, 29, 128, 4890000.0000, N'itel-l6502-den-1 (1).jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProductDetails] ([HistoryProductDetailID], [AccountID], [ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder], [Status], [Time]) VALUES (49, 9, 49, 30, 128, 9490000.0000, N'itel-l6006-den-1.jpg', N'DEN', 24, 0, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HistoryProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryProducts] ON 

INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (1, 9, 1, N'iPhone 11', 1, N'Apple A13 Bionic', 4, N'3110 mAh,18 W', N'iOS 15', N'IPS LCD,6.1",Liquid Retina', N'iphone-11-(88).jpg', 11490000.0000, N'CREATE', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (2, 9, 2, N'iPhone 13 Pro Max', 1, N'Apple A15 Bionic', 6, N'4352 mAh,20 W', N'iOS 15', N'OLED,6.7",Super Retina XDR ', N'iphone-13-pro-max-1tb-(38).jpg', 34990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (3, 9, 3, N'iPhone 13 Pro', 1, N'Apple A15 Bionic', 6, N'3095 mAh,20 W', N'iOS 15', N'OLED,6.1",Super Retina XDR', N'iphone-13-pro-1tb-(38).jpg', 29990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (4, 9, 4, N'iPhone 14 Pro Max', 1, N'Apple A16 Bionic', 6, N'4323 mAh,20 W', N'iOS 16', N'OLED,6.7",Super Retina XDR', N'iphone-14-pro-max-(40).jpg', 29990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (5, 9, 5, N'Samsung Galaxy Z Flip4', 2, N'Snapdragon 8+ Gen 1', 8, N'3700 mAh,25 W', N'Android 12', N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 1.9"Full HD+', N'samsung-galaxy-z-flip4-(12).jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (6, 9, 6, N'Samsung Galaxy S22 Ultra', 2, N'Snapdragon 8+ Gen 1', 8, N'5000 mAh,45 W', N'Android 12', N'Dynamic AMOLED 2X6.8"Quad HD+ (2K+)', N'samsung-galaxy-s22-ultra-(20).jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (7, 9, 7, N'Samsung Galaxy A23', 2, N'Snapdragon 680', 8, N'5000 mAh,25 W', N'Android 12', N'PLS TFT LCD6.6"Full HD+', N'samsung-galaxy-a23-cam-thumb-600x600.jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (8, 9, 8, N'Samsung Galaxy Z Fold4', 2, N'Snapdragon 8+ Gen 1', 12, N'4400 mAh,25 W', N'Android 12', N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)', N'samsung-galaxy-z-fold4-(14).jpg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (9, 9, 9, N'OPPO Reno8 Pro', 3, N'MediaTek Dimensity 8100 Max 8 nhân', 12, N'4500 mAh,80 W', N'Android 12', N'AMOLED6.7"Full HD+', N'oppo-reno8-pro-thumb-xanh-1-600x600.jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (10, 9, 10, N'OPPO A55', 3, N'MediaTek Helio G35', 4, N'5000 mAh,18 W', N'Android 12', N'IPS LCD6.5"HD+', N'oppo-a55-4g-(22).jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (11, 9, 11, N'OPPO Find X5', 3, N'Snapdragon 8 Gen 1', 12, N'5000 mAh,80 W', N'Android 12', N'AMOLED6.7"Quad HD+ (2K+)', N'oppo-find-x5-pro-(16).jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (12, 9, 12, N'OPPO Reno6', 3, N'MediaTek Dimensity 900 5G', 8, N'4300 mAh,65 W', N'Android 11', N'AMOLED6.43"Full HD+', N'oppo-reno6-5g-black-600x600.jpg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (13, 9, 13, N'Vivo Y15s', 4, N'MediaTek Helio P35', 3, N'5000 mAh,10 W', N'Android 11(Go Edition)', N'IPS LCD6.51"HD+', N'vivo-y15s-2021-(20).jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (14, 9, 14, N'Vivo V25 Pro', 4, N'MediaTek Dimensity 1300', 8, N'4830 mAh,66 W', N'Android 12', N'AMOLED6.56"Full HD+', N'vivo-v25-pro-5g-xanh-thumb-1-600x600.jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (15, 9, 15, N'Vivo V25', 4, N'MediaTek Dimensity 900 5G', 8, N'4500 mAh,44 W', N'Android 12', N'AMOLED6.44"Full HD+', N'vivo-v25-5g-vang-thumb-1-1-600x600.jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (16, 9, 16, N'Vivo T1', 4, N'Snapdragon 778G 5G', 8, N'4300 mAh,65 W', N'Android 11', N'AMOLED6.43"Full HD+', N'vivo-t1-5g-thumb-den-600x600.jpg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (17, 9, 17, N'Xiaomi Redmi Note 11', 5, N'Snapdragon 680', 4, N'5000 mAh,30 W', N'Android 11', N'AMOLED6.43"Full HD+', N'xiaomi-redmi-note-11-4gb-64gb-(26).jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (18, 9, 18, N'Xiaomi Redmi Note 11S', 5, N'MediaTek Dimensity 810 5G', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-redmi-note-11s-5g-(16).jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (19, 9, 19, N'Xiaomi 12T Pro', 5, N'Snapdragon 8+ Gen 1', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-12t-pro-thumb-bac-1-600x600.jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (20, 9, 20, N'Xiaomi 11T Pro', 5, N'Snapdragon 888', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (21, 9, 21, N'Realme 9 Pro+', 6, N'MediaTek Dimensity 920 5G', 8, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-9-pro-plus-5g-blue-thumb-600x600.jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (22, 9, 22, N'Realme 8', 6, N'MediaTek Helio G95', 4, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-8-silver-600x600.jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (23, 9, 23, N'Realme 10	', 6, N'MediaTek Helio G99', 4, N'5000 mAh,33 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-10-thumb-1-600x600.jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (24, 9, 24, N'Realme 9', 6, N'Snapdragon 680', 4, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-9-4g-den-thumb-600x600.jpg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (25, 9, 25, N'MoBell Rock 4', 7, N'Unisoc T606', 4, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-rock-4-xanh-duong-thumb-600x600.jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (26, 9, 26, N'Mobell M539', 7, N'Unisoc T606', 4, N'5050 mAh,18 W', N'Android 11', N'TFT LCD6.5"HD+', N'mobell-m539-do-thumb-600x600.jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (27, 9, 27, N'Mobell F209', 7, N'Unisoc T606', 3, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-f209-den-thumb-600x600.jpg', 4890000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (28, 9, 28, N'Mobell M239', 7, N'Unisoc T606', 3, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-m239-do-thumb-1-600x600.jpg', 9490000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (29, 9, 29, N'Itel L6502', 8, N'Spreadtrum SC9832E', 3, N'4000 mAh,5 W', N'Android 10', N'IPS LCD6.52"HD+', N'itel-l6502-den-600x600.jpg', 18990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (30, 9, 30, N'Itel L6006', 8, N'Spreadtrum SC9832E', 2, N'3000 mAh,5 W', N'Android 10', N'IPS LCD6.52"HD+', N'itel-l6006-violet-600x600.jpg', 23990000.0000, N'CREATE', CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (31, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10000000.0000, N'UPDATE', CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (32, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11490000.0000, N'UPDATE', CAST(N'2022-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (33, 9, 2, N'iPhone 13 Pro Max', 1, N'Apple A15 Bionic', 6, N'4352 mAh,20 W', N'iOS 15', N'OLED,6.7",Super Retina XDR ', N'iphone-13-pro-max-1tb-(38).jpg', 34990000.0000, N'DELETE', CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[HistoryProducts] ([HistoryID], [AccountID], [ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price], [Status], [Time]) VALUES (34, 9, 2, N'iPhone 13 Pro Max', 1, N'Apple A15 Bionic', 6, N'4352 mAh,20 W', N'iOS 15', N'OLED,6.7",Super Retina XDR ', N'iphone-13-pro-max-1tb-(38).jpg', 34990000.0000, N'CREATE', CAST(N'2022-12-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HistoryProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (1, 1, 1, 1, 10)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (2, 1, 1, 2, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (3, 1, 2, 3, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (4, 1, NULL, 39, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (5, 1, NULL, 40, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (6, 2, 2, 4, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (7, 2, 2, 5, 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (8, 2, 3, 6, 7)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (9, 2, NULL, 41, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (10, 2, NULL, 42, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (11, 3, 3, 7, 8)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (12, 3, 3, 8, 9)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (13, 3, 3, 9, 10)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (14, 4, 4, 10, 2)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (15, 4, 4, 11, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (16, 4, 4, 12, 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (17, 5, 4, 13, 2)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (18, 5, 4, 14, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (19, 5, 4, 15, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (20, 6, 4, 16, 7)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (21, 6, 4, 17, 8)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (22, 6, 4, 18, 9)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (23, 7, 4, 19, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (24, 7, 5, 20, 2)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (25, 7, 5, 21, 3)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (26, 8, 5, 22, 4)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (27, 8, 6, 23, 5)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (28, 8, 6, 24, 6)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (29, 9, 7, 25, 7)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (30, 9, 7, 26, 8)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (31, 9, 8, 27, 9)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (32, 10, 9, 28, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (33, 10, 10, 29, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (34, 10, 11, 30, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (35, 11, 1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (36, 12, 1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (37, 13, 1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (38, 14, 1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (39, 15, 1, 2, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [DiscountID], [ProductDetailID], [Quantity]) VALUES (40, 16, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (1, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (2, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (3, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (4, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (5, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (6, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (7, 1, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (8, 2, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (9, 2, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (10, 2, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (11, 2, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (12, 2, N'Da Duyet', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[OrderHistory] ([OrderHistoryID], [EmployeeID], [Description], [Time], [OrderID]) VALUES (13, 2, N'Da Huy Don', CAST(N'2023-01-11T00:00:00.000' AS DateTime), 14)
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (1, N'GODOS', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 107.8300, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (2, N'FOLKO', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 63.3600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (3, N'FRANK', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 108.2600, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (4, N'FRANK', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 54.8300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (5, N'FAMIA', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 3.1000, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (6, N'FURIB', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 1.3000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (7, N'GALED', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 10.1400, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (8, N'ERNSH', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 101.9500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (9, N'FOLKO', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 5.4400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (10, N'ERNSH', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 94.7700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (11, N'FAMIA', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 13.9900, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (12, N'ERNSH', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-13T00:00:00.000' AS DateTime), 126.3800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (13, N'HUNGC', CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), NULL, 30.3400, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (14, N'HILAA', CAST(N'2023-01-10T00:00:00.000' AS DateTime), NULL, NULL, 184.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (15, N'FRANK', CAST(N'2023-01-10T00:00:00.000' AS DateTime), NULL, NULL, 135.3500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany', 0)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry], [Status]) VALUES (16, N'ERNSH', CAST(N'2023-01-10T00:00:00.000' AS DateTime), NULL, NULL, 67.8800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (1, 1, 64, 11490000.0000, N'iphone-11-den-1-1-1-org.jpg', N'DEN', 92, 10)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (2, 1, 128, 13490000.0000, N'iphone-11-trang-1-org.jpg', N'TRANG', 19, 11)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (3, 2, 1000, 34990000.0000, N'iphone-13-pro-max-1-2.jpg', N'XAM', 114, 5)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (4, 2, 1000, 34990000.0000, N'iphone-13-pro-max-1-1.jpg', N'BAC', 341, 5)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (5, 2, 1000, 34990000.0000, N'iphone-13-pro-max-xanh-1.jpg', N'XANHDUONG', 241, 4)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (6, 3, 1000, 29990000.0000, N'iphone-13-pro-max-1-1.jpg', N'BAC', 341, 7)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (7, 3, 1000, 29990000.0000, N'iphone-13-pro-max-xanh-1.jpg', N'XANHDUONG', 241, 8)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (8, 3, 1000, 29990000.0000, N'iphone-13-pro-1tb-xam-1.jpg', N'XAM', 56, 9)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (9, 3, 1000, 29990000.0000, N'iphone-13-pro-xanh-1.jpg', N'XANHLA', 24, 10)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (10, 4, 128, 29990000.0000, N'iphone-14-pro-vang-1-2.jpg', N'VANG', 44, 2)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (11, 4, 128, 29990000.0000, N'iphone-14-pro-den-1-1.jpg', N'DEN', 52, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (12, 4, 128, 29990000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 25, 4)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (13, 4, 128, 29990000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 1, 2)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (14, 4, 256, 32490000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 1, 5)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (15, 4, 256, 32490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 14, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (16, 4, 512, 38490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 474, 7)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (17, 4, 1000, 43490000.0000, N'iphone-14-pro-bac-1-2.jpg', N'BAC', 477, 8)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (18, 4, 1000, 43490000.0000, N'iphone-14-pro-max-purple-1.jpg', N'TIM', 24, 9)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (19, 4, 1000, 43490000.0000, N'iphone-14-pro-vang-1-2.jpg', N'VANG', 242, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (20, 5, 128, 18990000.0000, N'samsung-galaxy-flip4-glr-tim-1.jpg', N'TIM', 1000, 2)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (21, 5, 128, 18990000.0000, N'samsung-galaxy-flip4-glr-tim-1.jpg', N'TIM', 1000, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (22, 5, 256, 20990000.0000, N'samsung-galaxy-z-flip4-xanh-128gb-1.jpg', N'XANHDUONG', 1000, 4)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (23, 6, 128, 23990000.0000, N'samsung-galaxy-s22-ultra-1-1 .jpg', N'Do', 1000, 5)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (24, 6, 256, 28990000.0000, N'samsung-galaxy-s22-ultra-1-1 .jpg', N'Do', 1000, 6)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (25, 7, 128, 4890000.0000, N'samsung-galaxy-a23-1-1.jpg', N'DEN', 1000, 7)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (26, 7, 256, 6190000.0000, N'samsung-galaxy-a23-1-1.jpg', N'DEN', 1000, 8)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (27, 8, 128, 9490000.0000, N'samsung-galaxy-z-flod-4-den-1.jpg', N'DEN', 2000, 9)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (28, 9, 128, 18990000.0000, N'oppo-reno8-pro-black-1.jpg', N'DEN', 24, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (29, 10, 128, 23990000.0000, N'oppo-a55-4g-1-2.jpg', N'DEN', 24, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (30, 11, 128, 4890000.0000, N'oppo-find-x5-pro-1-1.jpg', N'DEN', 24, 1)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (31, 12, 256, 11990000.0000, N'oppo-reno6-den-1-org.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (32, 13, 128, 18990000.0000, N'Vivo-y15s-2021-xanh-den-200x200.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (33, 14, 128, 23990000.0000, N'vivo-v25-pro-5g-den-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (34, 15, 128, 4890000.0000, N'vivo-v25-den-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (35, 16, 128, 9490000.0000, N'vivo-t1-5g-den-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (36, 17, 128, 18990000.0000, N'xiaomi-redmi-note-11-pro-4g-1-3.jpg', N'TRANG', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (37, 18, 128, 23990000.0000, N'xiaomi-redmi-note-11s-5g-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (38, 19, 128, 4890000.0000, N'xiaomi-12t-pro-den-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (39, 20, 128, 9490000.0000, N'xiaomi-11t-pro-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (40, 21, 128, 18990000.0000, N'realme-9-pro-1-1.jpg', N'XANHDUONG', 24, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (41, 22, 128, 23990000.0000, N'realme-8-pro-den-1-org.jpg', N'DEN', 24, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (42, 23, 128, 4890000.0000, N'realme-10-xanh-1.jpg', N'DEN', 24, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (43, 24, 128, 9490000.0000, N'realme-9-4g-1-2.jpg', N'DEN', 24, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (44, 25, 128, 18990000.0000, N'mobell-rock-4-den-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (45, 26, 128, 23990000.0000, N'mobell-m539-den-1-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (46, 27, 128, 4890000.0000, N'mobell-f209-den-1-2.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (47, 28, 128, 9490000.0000, N'mobell-m239-1-1.jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (48, 29, 128, 4890000.0000, N'itel-l6502-den-1 (1).jpg', N'DEN', 24, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [ProductStorage], [UnitPrice], [Picture], [Coler], [UnitsInStock], [UnitsOnOrder]) VALUES (49, 30, 128, 9490000.0000, N'itel-l6006-den-1.jpg', N'DEN', 24, 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (1, N'iPhone 11', 1, N'Apple A13 Bionic', 4, N'3110 mAh,18 W', N'iOS 15', N'IPS LCD,6.1",Liquid Retina', N'iphone-11-(88).jpg', 11490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (2, N'iPhone 13 Pro Max', 1, N'Apple A15 Bionic', 6, N'4352 mAh,20 W', N'iOS 15', N'OLED,6.7",Super Retina XDR ', N'iphone-13-pro-max-1tb-(38).jpg', 34990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (3, N'iPhone 13 Pro', 1, N'Apple A15 Bionic', 6, N'3095 mAh,20 W', N'iOS 15', N'OLED,6.1",Super Retina XDR', N'iphone-13-pro-1tb-(38).jpg', 29990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (4, N'iPhone 14 Pro Max', 1, N'Apple A16 Bionic', 6, N'4323 mAh,20 W', N'iOS 16', N'OLED,6.7",Super Retina XDR', N'iphone-14-pro-max-(40).jpg', 29990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (5, N'Samsung Galaxy Z Flip4', 2, N'Snapdragon 8+ Gen 1', 8, N'3700 mAh,25 W', N'Android 12', N'Chính: Dynamic AMOLED 2X, Phụ: Super AMOLEDChính 6.7" & Phụ 1.9"Full HD+', N'samsung-galaxy-z-flip4-(12).jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (6, N'Samsung Galaxy S22 Ultra', 2, N'Snapdragon 8+ Gen 1', 8, N'5000 mAh,45 W', N'Android 12', N'Dynamic AMOLED 2X6.8"Quad HD+ (2K+)', N'samsung-galaxy-s22-ultra-(20).jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (7, N'Samsung Galaxy A23', 2, N'Snapdragon 680', 8, N'5000 mAh,25 W', N'Android 12', N'PLS TFT LCD6.6"Full HD+', N'samsung-galaxy-a23-cam-thumb-600x600.jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (8, N'Samsung Galaxy Z Fold4', 2, N'Snapdragon 8+ Gen 1', 12, N'4400 mAh,25 W', N'Android 12', N'Dynamic AMOLED 2XChính 7.6" & Phụ 6.2"Quad HD+ (2K+)', N'samsung-galaxy-z-fold4-(14).jpg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (9, N'OPPO Reno8 Pro', 3, N'MediaTek Dimensity 8100 Max 8 nhân', 12, N'4500 mAh,80 W', N'Android 12', N'AMOLED6.7"Full HD+', N'oppo-reno8-pro-thumb-xanh-1-600x600.jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (10, N'OPPO A55', 3, N'MediaTek Helio G35', 4, N'5000 mAh,18 W', N'Android 12', N'IPS LCD6.5"HD+', N'oppo-a55-4g-(22).jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (11, N'OPPO Find X5', 3, N'Snapdragon 8 Gen 1', 12, N'5000 mAh,80 W', N'Android 12', N'AMOLED6.7"Quad HD+ (2K+)', N'oppo-find-x5-pro-(16).jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (12, N'OPPO Reno6', 3, N'MediaTek Dimensity 900 5G', 8, N'4300 mAh,65 W', N'Android 11', N'AMOLED6.43"Full HD+', N'oppo-reno6-5g-black-600x600.jpg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (13, N'Vivo Y15s', 4, N'MediaTek Helio P35', 3, N'5000 mAh,10 W', N'Android 11(Go Edition)', N'IPS LCD6.51"HD+', N'vivo-y15s-2021-(20).jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (14, N'Vivo V25 Pro', 4, N'MediaTek Dimensity 1300', 8, N'4830 mAh,66 W', N'Android 12', N'AMOLED6.56"Full HD+', N'vivo-v25-pro-5g-xanh-thumb-1-600x600.jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (15, N'Vivo V25', 4, N'MediaTek Dimensity 900 5G', 8, N'4500 mAh,44 W', N'Android 12', N'AMOLED6.44"Full HD+', N'vivo-v25-5g-vang-thumb-1-1-600x600.jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (16, N'Vivo T1', 4, N'Snapdragon 778G 5G', 8, N'4300 mAh,65 W', N'Android 11', N'AMOLED6.43"Full HD+', N'vivo-t1-5g-thumb-den-600x600.jpg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (17, N'Xiaomi Redmi Note 11', 5, N'Snapdragon 680', 4, N'5000 mAh,30 W', N'Android 11', N'AMOLED6.43"Full HD+', N'xiaomi-redmi-note-11-4gb-64gb-(26).jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (18, N'Xiaomi Redmi Note 11S', 5, N'MediaTek Dimensity 810 5G', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-redmi-note-11s-5g-(16).jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (19, N'Xiaomi 12T Pro', 5, N'Snapdragon 8+ Gen 1', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-12t-pro-thumb-bac-1-600x600.jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (20, N'Xiaomi 11T Pro', 5, N'Snapdragon 888', 4, N'5000 mAh,30 W', N'Android 12', N'AMOLED6.43"Full HD+', N'xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (21, N'Realme 9 Pro+', 6, N'MediaTek Dimensity 920 5G', 8, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-9-pro-plus-5g-blue-thumb-600x600.jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (22, N'Realme 8', 6, N'MediaTek Helio G95', 4, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-8-silver-600x600.jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (23, N'Realme 10	', 6, N'MediaTek Helio G99', 4, N'5000 mAh,33 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-10-thumb-1-600x600.jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (24, N'Realme 9', 6, N'Snapdragon 680', 4, N'4500 mAh,60 W', N'Android 12', N'Super AMOLED6.4"Full HD+', N'realme-9-4g-den-thumb-600x600.jpg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (25, N'MoBell Rock 4', 7, N'Unisoc T606', 4, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-rock-4-xanh-duong-thumb-600x600.jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (26, N'Mobell M539', 7, N'Unisoc T606', 4, N'5050 mAh,18 W', N'Android 11', N'TFT LCD6.5"HD+', N'mobell-m539-do-thumb-600x600.jpg', 23990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (27, N'Mobell F209', 7, N'Unisoc T606', 3, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-f209-den-thumb-600x600.jpg', 4890000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (28, N'Mobell M239', 7, N'Unisoc T606', 3, N'5050 mAh,18 W', N'Android 12', N'TFT LCD6.5"HD+', N'mobell-m239-do-thumb-1-600x600.jpg', 9490000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (29, N'Itel L6502', 8, N'Spreadtrum SC9832E', 3, N'4000 mAh,5 W', N'Android 10', N'IPS LCD6.52"HD+', N'itel-l6502-den-600x600.jpg', 18990000.0000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [BrandID], [Chip], [Ram], [Pin], [OperatingSystem], [PhoneScreen], [Picture], [Price]) VALUES (30, N'Itel L6006', 8, N'Spreadtrum SC9832E', 2, N'3000 mAh,5 W', N'Android 10', N'IPS LCD6.52"HD+', N'itel-l6006-violet-600x600.jpg', 23990000.0000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetails] ([ProductDetailID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[HistoryProductDetails]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[HistoryProductDetails]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetails] ([ProductDetailID])
GO
ALTER TABLE [dbo].[HistoryProducts]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[HistoryProducts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discounts] ([DiscountID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductDetailID])
REFERENCES [dbo].[ProductDetails] ([ProductDetailID])
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
