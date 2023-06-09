USE [ForRest1]
GO
/****** Object:  Table [dbo].[food_list]    Script Date: 24.03.2023 16:27:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_list](
	[Food_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NOT NULL,
	[Price] [int] NOT NULL,
	[Category] [varchar](45) NOT NULL,
	[In_Stock] [int] NOT NULL,
 CONSTRAINT [PK__food_lis__B350047C55A8EC2C] PRIMARY KEY CLUSTERED 
(
	[Food_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 24.03.2023 16:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_no] [int] NOT NULL,
	[Food] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK__order_de__3214EC27E0B4CC27] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 24.03.2023 16:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[Order_no] [int] IDENTITY(1,1) NOT NULL,
	[Table_no] [int] NOT NULL,
	[State] [varchar](45) NOT NULL,
	[Waiter] [int] NOT NULL,
	[Time] [datetime2](0) NOT NULL,
	[Cancel_Reason] [varchar](250) NULL,
	[Customer] [varchar](45) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workers]    Script Date: 24.03.2023 16:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workers](
	[Worker_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[Password] [varchar](45) NOT NULL,
	[Registration_Date] [datetime2](0) NULL,
	[Salary] [int] NOT NULL,
	[Title] [varchar](45) NOT NULL,
	[Realname] [varchar](45) NOT NULL,
 CONSTRAINT [PK_workers] PRIMARY KEY CLUSTERED 
(
	[Worker_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF__orders__Cancel_R__36B12243]  DEFAULT (NULL) FOR [Cancel_Reason]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF__orders__Customer__37A5467C]  DEFAULT (NULL) FOR [Customer]
GO
ALTER TABLE [dbo].[workers] ADD  CONSTRAINT [DF__workers__Registr__3A81B327]  DEFAULT (NULL) FOR [Registration_Date]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_Food] FOREIGN KEY([Food])
REFERENCES [dbo].[food_list] ([Food_ID])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_Food]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_orders] FOREIGN KEY([Order_no])
REFERENCES [dbo].[orders] ([Order_no])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_workers] FOREIGN KEY([Waiter])
REFERENCES [dbo].[workers] ([Worker_ID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_workers]
GO
