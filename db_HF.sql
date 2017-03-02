USE [db_HF]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[userpassword] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
	[userType] [nvarchar](50) NULL,
	[userSource] [nchar](10) NULL,
 CONSTRAINT [PK_profiles] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[profiles] ([id], [username], [userpassword], [active], [userType], [userSource]) VALUES (2, N'a', N'a', 1, N'admin', N'nonLDAP   ')
INSERT [dbo].[profiles] ([id], [username], [userpassword], [active], [userType], [userSource]) VALUES (1, N'GMRadmin', N'password@123', 1, N'user', N'db        ')
INSERT [dbo].[profiles] ([id], [username], [userpassword], [active], [userType], [userSource]) VALUES (3, N'MR0281', N'mr0281', 1, N'user', N'LDAP      ')
/****** Object:  Table [dbo].[Checks]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Checktype] [nvarchar](100) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Checks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Checks] ON
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (1, N'6 Y CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (2, N'BASE 2 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (3, N'C01 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (4, N'C02 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (5, N'C02+4Y+OTHERS + PAINTING', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (6, N'C02+8Y+4Y+MLG RAI', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (7, N'C03 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (8, N'C03 CHECK C04 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (9, N'C04 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (10, N'C04 CHECK C03 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (11, N'C04+ 2Y', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (12, N'C05 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (13, N'C1 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (14, N'C4 CHECK', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (15, N'MLG RAI', 1)
INSERT [dbo].[Checks] ([ID], [Checktype], [isActive]) VALUES (16, N'MLG REPLACEMENT', 1)
SET IDENTITY_INSERT [dbo].[Checks] OFF
/****** Object:  Table [dbo].[Models]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__Models__3213E83F2B3F6F97] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Models] ON
INSERT [dbo].[Models] ([id], [model], [isActive]) VALUES (1, N'A320', 1)
INSERT [dbo].[Models] ([id], [model], [isActive]) VALUES (2, N'ATR', 1)
INSERT [dbo].[Models] ([id], [model], [isActive]) VALUES (3, N'Q400', 1)
INSERT [dbo].[Models] ([id], [model], [isActive]) VALUES (4, N'FALCON 2000LX', 1)
INSERT [dbo].[Models] ([id], [model], [isActive]) VALUES (5, N'B737NG', 1)
SET IDENTITY_INSERT [dbo].[Models] OFF
/****** Object:  Table [dbo].[Historylog]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Historylog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Aircraft_reg] [varchar](50) NULL,
	[Line] [int] NULL,
	[Customer] [varchar](50) NULL,
	[Aircraft_model] [varchar](50) NULL,
	[Check_type] [varchar](50) NULL,
	[I_date] [date] NULL,
	[TAT] [int] NULL,
	[E_date]  AS (dateadd(day,[TAT],[I_date])) PERSISTED,
	[Overlapp] [bit] NULL,
	[Op_type] [varchar](50) NULL,
	[Sessionby] [nvarchar](50) NULL,
	[Record_time] [datetime] NOT NULL,
	[curr_status] [varchar](20) NULL,
 CONSTRAINT [PK__Historyl__3213E83F1FCDBCEB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Historylog] ON
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (1, N'vv', 4, N'INDIGO', N'A320', N'', CAST(0x223B0B00 AS Date), 2, 0, N'New Entry', N'a', CAST(0x0000A62C00A77321 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (2, N'vv', 4, N'INDIGO', N'A320', N'', CAST(0x223B0B00 AS Date), 2, 0, N'Delete', N'a', CAST(0x0000A62C00A783BF AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (3, N'a', 1, N'AIRASIA', N'A320', N'ascxa', CAST(0x493C0B00 AS Date), 3, 0, N'New Entry', N'a', CAST(0x0000A62D00D9678C AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (4, N'a', 1, N'AIRASIA', N'A320', N'ascxa', CAST(0x493C0B00 AS Date), 3, 0, N'Delete', N'a', CAST(0x0000A62D00D9A517 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (5, N'a', 3, N'INDIGO', N'A320', N'asxas', CAST(0x913B0B00 AS Date), 50, 1, N'Forced Insert', N'a', CAST(0x0000A62D01008C30 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (6, N'a', 3, N'INDIGO', N'A320', N'asxas', CAST(0x913B0B00 AS Date), 50, 1, N'Delete', N'a', CAST(0x0000A62D0100D19F AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (7, N'aa', 1, N'AIRASIA', N'A320', N'dca', CAST(0x3F3C0B00 AS Date), 5, 0, N'New Entry', N'a', CAST(0x0000A62E0005B65D AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (8, N'aa', 2, N'AIRASIA', N'A320', N'dca', CAST(0x3F3C0B00 AS Date), 5, 0, N'Update', N'a', CAST(0x0000A62E000CA5C5 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (9, N'aa', 3, N'AIRASIA', N'A320', N'dca', CAST(0xE43B0B00 AS Date), 15, 1, N'Update', N'a', CAST(0x0000A62E000CCB1F AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (10, N'aa', 3, N'AIRASIA', N'A320', N'dca', CAST(0xE43B0B00 AS Date), 15, 1, N'Delete', N'a', CAST(0x0000A62E0012CC0A AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (11, N'VT-IGT', 1, N'INDIGO', N'A320', N'2C CHECK', CAST(0xCF3B0B00 AS Date), 10, 0, N'Forced Insert', N'a', CAST(0x0000A62E00CF1D8A AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (12, N'VT-IGT', 1, N'INDIGO', N'A320', N'2C CHECK', CAST(0xCF3B0B00 AS Date), 10, 0, N'Delete', N'a', CAST(0x0000A62F00DF8F5D AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (13, N'VT-JCZ', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 22, 1, N'Update', N'a', CAST(0x0000A62F00F05318 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (14, N'VT-JCZ', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 21, 1, N'Update', N'a', CAST(0x0000A62F00F07499 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (15, N'VT-JCZ', 1, N'AIRASIA', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 21, 1, N'Update', N'a', CAST(0x0000A63300F89C83 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (16, N'VT-JCZ', 1, N'AIRASIA', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 23, 1, N'Update', N'a', CAST(0x0000A63300F8ADAD AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (17, N'VT-JCZ', 1, N'AIRASIA', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 10, 1, N'Update', N'a', CAST(0x0000A63300F8C3EC AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (18, N'VT-JCZ', 1, N'AIRASIA', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 10, 1, N'Update', N'a', CAST(0x0000A63300F8D10D AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (19, N'VT-JCZ', 1, N'AIRASIA', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xAC3B0B00 AS Date), 23, 1, N'Update', N'a', CAST(0x0000A63300F9420C AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (20, N'INDIGO 19', 3, N'AIRASIA', N'A320', N'C03 CHECK', CAST(0xC53B0B00 AS Date), 5, 1, N'Update', N'a', CAST(0x0000A63300FDD84B AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (21, N'INDIGO 19', 3, N'AIRASIA', N'A320', N'C03 CHECK', CAST(0xC33B0B00 AS Date), 5, 1, N'Update', N'a', CAST(0x0000A63300FE3FFD AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (22, N'INDIGO 19', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xC33B0B00 AS Date), 5, 1, N'Update', N'a', CAST(0x0000A63300FF1745 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (23, N'INDIGO 19', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xC13B0B00 AS Date), 5, 1, N'Update', N'a', CAST(0x0000A6330107729C AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (24, N'INDIGO 19', 3, N'AIRASIA', N'A320', N'C03 CHECK', CAST(0xC33B0B00 AS Date), 5, 1, N'Update', N'a', CAST(0x0000A63301078E41 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (25, N'INDIGO 19', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xC33B0B00 AS Date), 5, 0, N'Update', N'a', CAST(0x0000A6330107A763 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (26, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0xDF3B0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633010BB57B AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (27, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1E3C0B00 AS Date), 4, 1, N'Update', N'a', CAST(0x0000A633010BFD35 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (28, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1C3C0B00 AS Date), 4, 1, N'Update', N'a', CAST(0x0000A633010C29C0 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (29, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x123C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633010C4850 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (30, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1C3C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633010C609B AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (31, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1F3C0B00 AS Date), 4, 1, N'Update', N'a', CAST(0x0000A633010D1868 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (32, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x183C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A6330119E17C AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (33, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1C3C0B00 AS Date), 4, 1, N'Update', N'a', CAST(0x0000A6330119EFD8 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (34, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x153C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633011A26CC AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (35, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1C3C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633011A4783 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (36, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1E3C0B00 AS Date), 4, 1, N'Update', N'a', CAST(0x0000A633011ADE07 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (37, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x1C3C0B00 AS Date), 4, 0, N'Update', N'a', CAST(0x0000A633011AF8EB AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (38, N'a', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 6, 0, N'New Entry', N'a', CAST(0x0000A63900F1E7D6 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (39, N'a', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 6, 0, N'Delete', N'a', CAST(0x0000A63A016FF268 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (40, N'gowtham', 2, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xD03B0B00 AS Date), 20, 0, N'New Entry', N'a', CAST(0x0000A63C013E3207 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (41, N'gowtham', 2, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xD63B0B00 AS Date), 20, 0, N'Update', N'a', CAST(0x0000A63C013E9FB3 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (42, N'gowtham', 2, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xD63B0B00 AS Date), 20, 0, N'Delete', N'a', CAST(0x0000A63C013ED5EF AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (43, N'bis', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 23, 0, N'New Entry', N'a', CAST(0x0000A63D00D455A0 AS DateTime), N'planing')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (44, N'bis', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 23, 0, N'Update', N'a', CAST(0x0000A63D00E06FD4 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (45, N'bis', 1, N'FLYNAS', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 23, 0, N'Update', N'a', CAST(0x0000A63D00E5B090 AS DateTime), N'planing')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (46, N'bis', 1, N'FLYNAS', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 23, 0, N'Update', N'a', CAST(0x0000A63D00E5CE38 AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (47, N'bis', 1, N'FLYNAS', N'A320', N'6 Y CHECK', CAST(0x493C0B00 AS Date), 23, 0, N'Delete', N'a', CAST(0x0000A63D014095EF AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (48, N'aaa', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xCF3B0B00 AS Date), 30, 0, N'New Entry', N'a', CAST(0x0000A6430173F527 AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (49, N'aaa', 1, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xCF3B0B00 AS Date), 30, 0, N'Delete', N'a', CAST(0x0000A64301748F0D AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (50, N'aaa', 3, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xCF3B0B00 AS Date), 30, 1, N'Forced Insert', N'a', CAST(0x0000A6430177979A AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (51, N'aaa', 3, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0xCF3B0B00 AS Date), 30, 1, N'Delete', N'a', CAST(0x0000A6430177B1D2 AS DateTime), NULL)
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (52, N'VT-TST', 1, N'INDIGO', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xDA3B0B00 AS Date), 5, 1, N'Forced Insert', N'a', CAST(0x0000A67B00C5D976 AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (53, N'VT-JCW', 1, N'JETAIRWAYS', N'ATR', N'C04+ 2Y', CAST(0x273C0B00 AS Date), 12, 1, N'Forced Insert', N'a', CAST(0x0000A69700E739D8 AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (54, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'C04+ 2Y', CAST(0x333C0B00 AS Date), 12, 1, N'Forced Insert', N'a', CAST(0x0000A69700E77C7E AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (55, N'VT-JCS', 1, N'JETAIRWAYS', N'ATR', N'C04+ 2Y', CAST(0x3F3C0B00 AS Date), 12, 1, N'Forced Insert', N'a', CAST(0x0000A69700E7BF0B AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (56, N'VT-JDC', 1, N'JETAIRWAYS', N'ATR', N'6 Y CHECK', CAST(0x063C0B00 AS Date), 3, 1, N'Update', N'a', CAST(0x0000A69700FF7D9C AS DateTime), N'confirm')
INSERT [dbo].[Historylog] ([id], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [Op_type], [Sessionby], [Record_time], [curr_status]) VALUES (57, N'VT-JCQ', 1, N'JETAIRWAYS', N'ATR', N'C02 + 8YE + 4YE+MISC. TASKS', CAST(0xF53B0B00 AS Date), 26, NULL, N'Delete', N'a', CAST(0x0000A698009027FD AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Historylog] OFF
SET ANSI_PADDING OFF
/****** Object:  Table [dbo].[HF_data1]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HF_data1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aircraft_reg] [varchar](20) NULL,
	[Line] [int] NULL,
	[Customer] [varchar](10) NULL,
	[Aircraft_model] [varchar](50) NULL,
	[Check_type] [nvarchar](250) NULL,
	[I_date] [date] NULL,
	[TAT] [int] NULL,
	[E_date]  AS (dateadd(day,[TAT],[I_date])) PERSISTED,
	[Overlapp] [bit] NULL,
	[curr_status] [varchar](20) NULL,
 CONSTRAINT [PK1__HF_data__3214EC277F60ED59] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[HF_data1] ON
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (55, N'VT-JCN', 1, N'JETAIRWAYS', N'ATR', N'C02+8Y+4Y+MLG RAI + MISC. TASKS', CAST(0x5B3B0B00 AS Date), 28, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (56, N'IGO7', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x6C3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (57, N'IGO8', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x723B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (58, N'VT-GOK', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x733B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (59, N'VT-SLD', 5, N'SPICEJET', N'B737', N'1C + 30000 FH + PAINTING', CAST(0x733B0B00 AS Date), 14, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (60, N'A6-FEA', 4, N'FLYDUBAI', N'B737', N'C03+WEIGH+BB', CAST(0x733B0B00 AS Date), 9, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (61, N'VT-SZL', 2, N'SPICEJET', N'B737', N'1C + 30000 FH + 8 Y', CAST(0x753B0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (62, N'VP-CXE', 4, N'FLYNAS', N'A320', N'C03 CHECK', CAST(0x783B0B00 AS Date), 11, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (63, N'IGO9', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x783B0B00 AS Date), 17, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (64, N'A6-FDC', 5, N'FLYDUBAI', N'B737', N'C05', CAST(0x783B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (65, N'VT-SUI', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x7A3B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (66, N'A6-FDG', 5, N'FLYDUBAI', N'B737', N'C05+BB', CAST(0x7C3B0B00 AS Date), 7, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (67, N'A6-FDD', 4, N'FLYDUBAI', N'B737', N'C05', CAST(0x7C3B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (68, N'VT-JDD', 1, N'JETAIRWAYS', N'ATR', N'MLG REPLACEMENT', CAST(0x7D3B0B00 AS Date), 3, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (69, N'A6-FDE', 2, N'FLYDUBAI', N'B737', N'C05', CAST(0x803B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (70, N'VT-JCZ', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0x803B0B00 AS Date), 21, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (71, N'A6-FET', 1, N'FLYDUBAI', N'B737', N'C01+BB', CAST(0x813B0B00 AS Date), 7, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (72, N'VT-APJ', 4, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x833B0B00 AS Date), 16, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (73, N'A6-FDQ', 2, N'FLYDUBAI', N'B737', N'C04+BB', CAST(0x843B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (74, N'A6-FDF', 5, N'FLYDUBAI', N'B737', N'C05', CAST(0x843B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (75, N'IGO10', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x8D3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (76, N'A6-FDS', 5, N'FLYDUBAI', N'B737', N'C04+BB', CAST(0x8E3B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (77, N'IGO11', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x933B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (78, N'VT-WAM', 5, N'GO AIR', N'A320', N'EOL', CAST(0x943B0B00 AS Date), 35, 1, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (79, N'VT-SUL', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x943B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (80, N'VT-JDC', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI + MISC. TASKS', CAST(0x953B0B00 AS Date), 3, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (81, N'A6-FDT', 5, N'FLYDUBAI', N'B737', N'C04+BB', CAST(0x983B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (82, N'VT-JCT', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2YE  +NLG RAI + MISC. TASKS', CAST(0x983B0B00 AS Date), 10, 1, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (83, N'IGO12', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x993B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (84, N'IGO13', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x9F3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (85, N'VT-GOL', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x9F3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (86, N'A6-FDO', 5, N'FLYDUBAI', N'B737', N'C04+BB', CAST(0xA23B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (87, N'VT-JCR', 1, N'JETAIRWAYS', N'ATR', N'C04+2Y+OTHERS TASKS', CAST(0xA23B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (88, N'VT-WAG', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0xA43B0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (89, N'IGO14', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xA53B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (90, N'IGO15', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xAB3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (91, N'VT-WAH', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0xAC3B0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (92, N'VT-SUG', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xAE3B0B00 AS Date), 25, 1, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (93, N'IGO16', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xB13B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (94, N'IGO17', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xB73B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (95, N'VT-WAN', 5, N'GO AIR', N'A320', N'EOL', CAST(0xBC3B0B00 AS Date), 35, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (96, N'IGO18', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xBD3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (97, N'IGO19', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xC33B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (98, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'NLG RAI + MISC. TASKS', CAST(0xC43B0B00 AS Date), 1, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (99, N'VT-JCQ', 1, N'JETAIRWAYS', N'ATR', N'C02 + 8YE + 4YE+MISC. TASKS', CAST(0xC83B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (100, N'VT-SUH', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xC83B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (101, N'IGO20', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0xC93B0B00 AS Date), 17, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (102, N'IGO21', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0xDE3B0B00 AS Date), 17, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (103, N'VT-SUK', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xE23B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (104, N'VT-JCW', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2YE + MISC. TASKS', CAST(0xEB3B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (105, N'IGO22', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xF33B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (106, N'VT-JCP', 1, N'JETAIRWAYS', N'ATR', N'C02+ 8YE + MISC. TASKS', CAST(0xF53B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (107, N'IGO23', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xF93B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (108, N'VT-SUP', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xFC3B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (109, N'IGO24', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xFF3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (110, N'IGO25', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x053C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (111, N'IGO26', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x0B3C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (112, N'VP-CXF', 2, N'FLYNAS', N'A320', N'EOL', CAST(0x0C3C0B00 AS Date), 24, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (113, N'VT-JCW', 1, N'JETAIRWAYS', N'ATR', N'NLG REPLACEMENT + MISC. TASKS', CAST(0x0E3C0B00 AS Date), 1, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (114, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2YE + 24 MO INTR TAKS + MISC. TASKS', CAST(0x0F3C0B00 AS Date), 10, 1, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (115, N'IGO27', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x113C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (116, N'IGO28', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x173C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (117, N'VT-JCS', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2YE + 24 MO INTR TAKS + MISC. TASKS', CAST(0x193C0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (118, N'VT-WAI', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0x1A3C0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (119, N'VT-WAJ', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0x223C0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (120, N'VT-JDD', 1, N'JETAIRWAYS', N'ATR', N'C02 + MISC. TASKS', CAST(0x233C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (121, N'IGO29', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x263C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (122, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x2A3C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (123, N'VP-CXG', 2, N'FLYNAS', N'A320', N'EOL', CAST(0x2A3C0B00 AS Date), 30, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (124, N'IGO30', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x2C3C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (125, N'VT-GON', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x2F3C0B00 AS Date), 5, 0, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (126, N'IGO31', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x323C0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (127, N'VT-ATB', 3, N'AIRASIA', N'A320', N'C01 CHECK', NULL, 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (128, N'VT-JCL', 1, N'JETAIRWAYS', N'ATR', N'C CHECK', CAST(0xC93A0B00 AS Date), 28, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (129, N'VT-JCM', 1, N'JETAIRWAYS', N'ATR', N'C CHECK', CAST(0xE43A0B00 AS Date), 28, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (130, N'VT-TMP', 2, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0xE63A0B00 AS Date), 1, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (131, N'VT-TMU', 5, N'TRUEJET', N'ATR', N'BRIDGING CHECK + ENG & PROPELLER RAI+ ADDNL TASKS', CAST(0xE63A0B00 AS Date), 77, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (132, N'VT-GOQ', 3, N'GO AIR', N'A320', N'C1 CHECK', CAST(0xEC3A0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (133, N'VT-SUE', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xF43A0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (134, N'VT-SZL', 2, N'SPICEJET', N'B737', N'BRIDGING CHECK', CAST(0xFC3A0B00 AS Date), 1, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (135, N'VT-WAN', 2, N'GO AIR', N'A320', N'C03 CHECK', CAST(0xFD3A0B00 AS Date), 6, 1, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (136, N'VT-JCJ', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI', CAST(0xFE3A0B00 AS Date), 2, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (137, N'VP-CXX', 3, N'FLYNAS', N'A320', N'C5 CHECK', CAST(0xFF3A0B00 AS Date), 7, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (138, N'VP-CXS', 3, N'FLYNAS', N'A320', N'C4 CHECK', CAST(0x0A3B0B00 AS Date), 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (139, N'VT-ATF', 2, N'AIRASIA', N'A320', N'C01 CHECK', CAST(0x103B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (140, N'JCX', 1, N'JETAIRWAYS', N'ATR', N'C02 CHECK', CAST(0x1E3B0B00 AS Date), 21, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (141, N'IGO1', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x253B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (142, N'VT-GOR', 2, N'GO AIR', N'A320', N'C1 CHECK', CAST(0x263B0B00 AS Date), 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (143, N'VP-CXV', 2, N'FLYNAS', N'A320', N'C4 CHECK', CAST(0x2A3B0B00 AS Date), 11, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (144, N'IGO2', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x2B3B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (145, N'IGO3', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x313B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (146, N'JCP', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI', CAST(0x333B0B00 AS Date), 2, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (147, N'VT-SUO', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x2B3B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (148, N'VT-BLR', 2, N'AIRASIA', N'A320', N'C01 CHECK', CAST(0x363B0B00 AS Date), 12, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (149, N'INDIGO 4', 4, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x373B0B00 AS Date), 22, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (150, N'VT-JCQ', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI', CAST(0x403B0B00 AS Date), 3, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (151, N'VT-TMK', 4, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0x413B0B00 AS Date), 3, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (152, N'VT-RED', 2, N'AIRASIA', N'A320', N'NLG SEAL REPL + MISC TASK', CAST(0x423B0B00 AS Date), 2, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (153, N'VT-TMP', 2, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0x503B0B00 AS Date), 1, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (154, N'VT-JCV', 1, N'JETAIRWAYS', N'ATR', N'C04+ 2Y', CAST(0x363B0B00 AS Date), 10, NULL, N'confirm')
GO
print 'Processed 100 total records'
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (155, N'VT-JCY', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0x463B0B00 AS Date), 21, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (156, N'VT-SUF', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x473B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (157, N'IGO5', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x4E3B0B00 AS Date), 17, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (158, N'IGO6', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x663B0B00 AS Date), 5, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (159, N'VT-SUM', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x603B0B00 AS Date), 25, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (160, N'VT-SLC', 2, N'SPICEJET', N'B737', N'1C + 30000 FH', CAST(0x623B0B00 AS Date), 8, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (161, N'VT-SGQ', 2, N'SPICEJET', N'B737', N'3C + 6 YRL', NULL, 6, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (162, N'VT-SGJ', 2, N'SPICEJET', N'B737', N'C1+8Y CHECK', NULL, 12, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (163, N'VT-SGQ', 2, N'SPICEJET', N'B737', N'C1+6Y CHECK', NULL, 6, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (164, N'VT-SZK', 2, N'SPICEJET', N'B737', N'C1 CHECK', NULL, 6, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (165, N'VT-SLA', 5, N'SPICEJET', N'B737', N'PAINTING', NULL, 7, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (166, N'VT-SLB', 5, N'SPICEJET', N'B737', N'PAINTING', NULL, 7, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (167, N'VT-SZB', 2, N'SPICEJET', N'B737', N'C1+C2 DIFF', NULL, 4, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (168, N'VT-SLC', 2, N'SPICEJET', N'B737', N'C1+8Y CHECK', NULL, 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (169, N'VT-SLD', 2, N'SPICEJET', N'B737', N'C01+8Y CHECK', NULL, 10, NULL, N'confirm')
INSERT [dbo].[HF_data1] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (170, N'VT-TST', 5, N'INDIGO', N'A320', N'C02+4Y+OTHERS + PAINTING', CAST(0xDA3B0B00 AS Date), 5, 1, N'confirm')
SET IDENTITY_INSERT [dbo].[HF_data1] OFF
SET ANSI_PADDING OFF
/****** Object:  Table [dbo].[HF_data]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HF_data](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aircraft_reg] [varchar](20) NULL,
	[Line] [int] NULL,
	[Customer] [varchar](10) NULL,
	[Aircraft_model] [varchar](50) NULL,
	[Check_type] [nvarchar](250) NULL,
	[I_date] [date] NULL,
	[TAT] [int] NULL,
	[E_date]  AS (dateadd(day,[TAT],[I_date])) PERSISTED,
	[Overlapp] [bit] NULL,
	[curr_status] [varchar](20) NULL,
 CONSTRAINT [PK__HF_data__3214EC277F60ED59] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[HF_data] ON
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (810, N'VT-JCL', 1, N'JETAIRWAYS', N'ATR', N'C CHECK', CAST(0xC93A0B00 AS Date), 27, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (811, N'VT-JCM', 1, N'JETAIRWAYS', N'ATR', N'C CHECK', CAST(0xE43A0B00 AS Date), 26, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (812, N'VT-TMP', 2, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0xE63A0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (813, N'VT-TMU', 5, N'TRUEJET', N'ATR', N'BRIDGING CHECK + ENG & PROPELLER RAI+ ADDNL TASKS', CAST(0xE63A0B00 AS Date), 78, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (814, N'VT-GOQ', 3, N'GO AIR', N'A320', N'C1 CHECK', CAST(0xEC3A0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (815, N'VT-SUE', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0xF33A0B00 AS Date), 23, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (816, N'VT-SZL', 2, N'SPICEJET', N'B737', N'BRIDGING CHECK', CAST(0xFC3A0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (817, N'VT-WAN', 2, N'GO AIR', N'A320', N'C03 CHECK', CAST(0xFD3A0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (818, N'VT-JCJ', 1, N'JETAIRWAYS', N'ATR', N'MLG REPLACEMENT + ADD CHECK ON VT-JCJ', CAST(0xFE3A0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (819, N'VP-CXX', 3, N'FLYNAS', N'A320', N'C5 CHECK', CAST(0xFF3A0B00 AS Date), 10, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (820, N'VP-CXS', 3, N'FLYNAS', N'A320', N'C4 CHECK', CAST(0x093B0B00 AS Date), 13, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (821, N'VT-ATF', 2, N'AIRASIA', N'A320', N'C01 CHECK', CAST(0x103B0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (822, N'JCX', 1, N'JETAIRWAYS', N'ATR', N'C02 CHECK', CAST(0x1E3B0B00 AS Date), 21, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (823, N'IGO 1', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x253B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (824, N'VT-GOR', 2, N'GO AIR', N'A320', N'C1 CHECK', CAST(0x263B0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (825, N'VP-CXV', 2, N'FLYNAS', N'A320', N'C4 CHECK', CAST(0x2A3B0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (826, N'IGO 2', 3, N'INDIGO', N'A320', N'C3 CHECK', CAST(0x2B3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (827, N'VT-SUO', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x2B3B0B00 AS Date), 23, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (828, N'IGO 3', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x313B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (829, N'JCP', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI', CAST(0x333B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (830, N'VT-BLR', 2, N'AIRASIA', N'A320', N'C01 CHECK', CAST(0x363B0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (831, N'VT-JCV', 1, N'JETAIRWAYS', N'ATR', N'C04+ 2Y', CAST(0x363B0B00 AS Date), 10, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (832, N'IGO 4', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x373B0B00 AS Date), 17, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (833, N'VT-APD', 5, N'AIR PEGASU', N'ATR', N'PAINTING + Misc task', CAST(0x383B0B00 AS Date), 43, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (834, N'VT-JCQ', 1, N'JETAIRWAYS', N'ATR', N'MLG RAI', CAST(0x403B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (835, N'VT-TMK', 4, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0x413B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (836, N'VT-RED', 2, N'AIRASIA', N'A320', N'NLG SEAL REPL + MISC TASK', CAST(0x423B0B00 AS Date), 2, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (837, N'VT-JCY', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0x463B0B00 AS Date), 21, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (838, N'VT-SUF', 4, N'SPICEJET', N'Q400', N'BASE 2 CHECK', CAST(0x473B0B00 AS Date), 25, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (839, N'IGO 5', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x4E3B0B00 AS Date), 15, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (840, N'VT-TMP', 2, N'TRUEJET', N'ATR', N'ENG CHANGE', CAST(0x503B0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (841, N'XY-AJM', 2, N'GOLDEN MYR', N'ATR', N'C01 +2Y + 1Y CHECK', CAST(0x5A3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (842, N'VT-JCN', 1, N'JETAIRWAYS', N'ATR', N'C02+8Y+4Y+MLG RAI + MISC. TASKS', CAST(0x5B3B0B00 AS Date), 28, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (843, N'IGO 6', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x663B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (844, N'IGO 7', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x6C3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (845, N'IGO 8', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x723B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (846, N'VT-GOK', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x733B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (847, N'VP-CXE', 4, N'FLYNAS', N'A320', N'C03 CHECK', CAST(0x773B0B00 AS Date), 17, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (848, N'IGO 9', 3, N'INDIGO', N'A320', N'C04 CHECK', CAST(0x783B0B00 AS Date), 17, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (849, N'XY-AJS', 2, N'GOLDEN MYR', N'ATR', N'C01 +2Y + 1Y CHECK', CAST(0x7A3B0B00 AS Date), 10, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (850, N'VT-JDD', 1, N'JETAIRWAYS', N'ATR', N'MLG REPLACEMENT', CAST(0x7D3B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (851, N'VT-JCZ', 1, N'JETAIRWAYS', N'ATR', N'C02+4Y+OTHERS + PAINTING', CAST(0x803B0B00 AS Date), 21, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (852, N'VT-APJ', 5, N'AIRASIA', N'A320', N'6 Y CHECK', CAST(0x823B0B00 AS Date), 15, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (853, N'IGO 10', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x8D3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (854, N'VT-JDD', 2, N'JETAIRWAYS', N'ATR', N'MLG RH SIDE BRACE REPLACEMENT', CAST(0x923B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (855, N'IGO 11', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x933B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (856, N'VT-JCT', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2YE  +NLG RAI + MISC. TASKS', CAST(0x973B0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (857, N'IGO 12', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x993B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (858, N'IGO 13', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x9F3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (859, N'VT-GOL', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x9F3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (860, N'VT-JCR', 1, N'JETAIRWAYS', N'ATR', N'C04+2Y+OTHERS TASKS', CAST(0xA33B0B00 AS Date), 18, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (861, N'VT-WAG', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0xA43B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (862, N'IGO 14', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xA53B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (863, N'VT-WAH', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0xAA3B0B00 AS Date), 8, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (864, N'IGO 15', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xAB3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (865, N'IGO 16', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xB13B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (866, N'VT-JCL', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xB53B0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (867, N'IGO 17', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xB83B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (868, N'VT-JDC', 1, N'JETAIRWAYS', N'ATR', N'Seat Replacement on VT-JDC', CAST(0xB93B0B00 AS Date), 2, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (869, N'VT-JCJ', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xBB3B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (870, N'IGO 18', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xBE3B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (871, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xC03B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (872, N'VT-JCN', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xC33B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (873, N'VT-JCP', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xC63B0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (874, N'VT-HYD', 4, N'AIRASIA', N'A320', N'12Y+C6+BRIDGING+REPAINTING+ DEREG CHECK', CAST(0xC83B0B00 AS Date), 50, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (875, N'IGO 19', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xC93B0B00 AS Date), 7, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (876, N'VT-JDD', 1, N'JETAIRWAYS', N'ATR', N'MLG (LH & RH Replacement) on VT-JDD', CAST(0xC93B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (877, N'VT-JCT', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration + NLG Replacement', CAST(0xCC3B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (878, N'VT-JCM', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xCF3B0B00 AS Date), 2, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (879, N'IGO 20', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xD03B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (880, N'VT-JCV', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration', CAST(0xD13B0B00 AS Date), 7, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (881, N'IGO 21', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xD63B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (882, N'VT-JCX', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration + P&W ECI', CAST(0xD83B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (883, N'VT-PNQ', 5, N'AIRASIA', N'A320', N'BRIDGING + DEREG CHECK+ PAINTING', CAST(0xD83B0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (884, N'VT-JCY', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration + P&W ECI', CAST(0xDC3B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (885, N'IGO 22', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0xDD3B0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (886, N'VT-JCZ', 1, N'JETAIRWAYS', N'ATR', N'Seat Reconfiguration + P&W ECI', CAST(0xDF3B0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (887, N'VT-JCK', 1, N'JETAIRWAYS', N'ATR', N'P&W ECI task + Add on VT-JCK', CAST(0xE23B0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (888, N'IGO 23', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0xE43B0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (889, N'VT-JCQ', 1, N'JETAIRWAYS', N'ATR', N'C02 + 8YE + 4YE+MISC. TASKS', CAST(0xED3B0B00 AS Date), 25, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (890, N'VT-SLJ', 2, N'SPICEJET', N'B737', N'BRIDGING CHECK', CAST(0xF43B0B00 AS Date), 2, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (891, N'IGO S1', 3, N'INDIGO', N'A320', N'SEAT RETROFIT', CAST(0xFD3B0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (892, N'IGO S2', 3, N'INDIGO', N'A320', N'SEAT RETROFIT', CAST(0x003C0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (893, N'IGO S3', 3, N'INDIGO', N'A320', N'SEAT RETROFIT', CAST(0x043C0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (894, N'VT-JDC', 1, N'JETAIRWAYS', N'ATR', N'MLG REPLACEMENT + ADD CHECK', CAST(0x063C0B00 AS Date), 3, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (895, N'IGO S4', 4, N'INDIGO', N'A320', N'SEAT RETROFIT', CAST(0x073C0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (896, N'IGO 24', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x073C0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (897, N'VT-JCK', 1, N'JETAIRWAYS', N'ATR', N'SEAT RETROFIT', CAST(0x093C0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (898, N'IGO 25', 3, N'INDIGO', N'A320', N'C03 CHECK', CAST(0x0C3C0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (899, N'VT-SGY', 2, N'SPICEJET', N'B737', N'25000 FH + C1+ 8 Y + C2 CHECK', CAST(0x0C3C0B00 AS Date), 11, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (900, N'VT-JCP', 1, N'JETAIRWAYS', N'ATR', N'C02 + 2Y(+24 MO) + 4Y(+MPD 4Y) + 8Y(+16000FH) + OTHERS', CAST(0x0D3C0B00 AS Date), 25, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (901, N'VT-TMK', 4, N'TRUEJET', N'ATR', N'C2 CHECK', CAST(0x103C0B00 AS Date), 5, NULL, N'Planned')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (902, N'VT-JRT', 5, N'AIRASIA', N'A320', N'5C + L/G CHANGE', CAST(0x123C0B00 AS Date), 13, NULL, N'Planned')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (903, N'IGO 27', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x163C0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (904, N'VT-WAI', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0x1A3C0B00 AS Date), 8, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (905, N'VT-WAJ', 4, N'GO AIR', N'A320', N'C05 CHECK', CAST(0x223C0B00 AS Date), 8, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (906, N'IGO 26', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x243C0B00 AS Date), 4, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (907, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'NLG REPLACEMENT', CAST(0x263C0B00 AS Date), 1, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (908, N'VT-JCW', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2Y(+24 MO) + OTHERS', CAST(0x273C0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (909, N'IGO 28', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x283C0B00 AS Date), 6, NULL, N'Confirm')
GO
print 'Processed 100 total records'
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (910, N'VT-GOM', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x2A3C0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (911, N'VT-GON', 4, N'GO AIR', N'A320', N'C02 CHECK', CAST(0x2F3C0B00 AS Date), 5, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (912, N'VT-JCU', 1, N'JETAIRWAYS', N'ATR', N'C04 + 2Y(+24 MO) + OTHERS', CAST(0x333C0B00 AS Date), 12, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (913, N'IGO 29', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x343C0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (914, N'IGO 30', 3, N'INDIGO', N'A320', N'C02 CHECK', CAST(0x3B3C0B00 AS Date), 6, NULL, N'Confirm')
INSERT [dbo].[HF_data] ([ID], [Aircraft_reg], [Line], [Customer], [Aircraft_model], [Check_type], [I_date], [TAT], [Overlapp], [curr_status]) VALUES (915, N'VT-JCS', 1, N'JETAIRWAYS', N'ATR', N'C04 +2Y(+24 MO) + OTHERS', CAST(0x3F3C0B00 AS Date), 12, NULL, N'Confirm')
SET IDENTITY_INSERT [dbo].[HF_data] OFF
SET ANSI_PADDING OFF
/****** Object:  Table [dbo].[hangarSheet]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hangarSheet](
	[Linen] [int] NOT NULL,
 CONSTRAINT [PK_hangarSheet] PRIMARY KEY CLUSTERED 
(
	[Linen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[hangarSheet] ([Linen]) VALUES (1)
INSERT [dbo].[hangarSheet] ([Linen]) VALUES (2)
INSERT [dbo].[hangarSheet] ([Linen]) VALUES (3)
INSERT [dbo].[hangarSheet] ([Linen]) VALUES (4)
INSERT [dbo].[hangarSheet] ([Linen]) VALUES (5)
/****** Object:  Table [dbo].[companyRecord]    Script Date: 10/19/2016 11:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companyRecord](
	[company] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'INDIGO', N'#229954', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'JETAIRWAYS', N'#E0F7FA', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'TRUEJET', N'#D35400', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'AIRASIA', N'#A6ACAF', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'SPICEJET', N'#FFEB3B', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'GO AIR', N'#FF33CC', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'FLYDUBAI', N'#ff8200', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'FLYNAS', N'#DAF7A6', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'AIR PEGASU', N'#00FF00', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'GOLDEN MYR', N'#00ACC1', 1)
INSERT [dbo].[companyRecord] ([company], [color], [isActive]) VALUES (N'GMR AVIATION', N'#3633ff', 1)
/****** Object:  StoredProcedure [dbo].[Companies]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Companies]  
as  
begin  
 select company,color from companyRecord where isActive='true';  
end
GO
/****** Object:  StoredProcedure [dbo].[Model]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Model]
as 
begin
	select model from Models where isActive='true'
end
GO
/****** Object:  StoredProcedure [dbo].[logincheck]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[logincheck](
@username varchar(50),
@userpassword varchar(50)
)
as
begin
declare @usersource varchar(15)
if exists(select * from profiles where username=@username and active = 'true' )
begin
	select @usersource = userSource from profiles where username=@username and active = 'true';
	if(@usersource = 'LDAP')
	begin
		select * from profiles where username=@username and active='true'
	end
	else
	begin
	select * from profiles where username=@username and userpassword=@userpassword and active='true'
	end
end
end
GO
/****** Object:  StoredProcedure [dbo].[Check_types]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Check_types]
as
begin
	select Checktype from Checks where isActive='true'
end
GO
/****** Object:  StoredProcedure [dbo].[mp_selectbyorder]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_selectbyorder]
as
begin
	select * from HF_data order by ID;
end
GO
/****** Object:  StoredProcedure [dbo].[mp_selectall]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_selectall]  
@fromDate date,
@toDate date
as  
begin  
 select [ID],[AirCRAFT_REG],[LINE],[CUSTOMER],Aircraft_model,Check_type,I_date,TAT,E_date,COALESCE(Overlapp,0) AS OVERLAPP,curr_status
 from HF_data where @fromDate<I_date and @toDate>E_date order by I_date; 
end

--  exec [mp_selectall] '2016-04-01','2016-04-30'
GO
/****** Object:  StoredProcedure [dbo].[mp_retrivebyReg]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_retrivebyReg]  
@aircraft_reg varchar(50),
@idate date
as  
begin  
 select 
ID
,Aircraft_reg
,Line
,Customer
,Aircraft_model
,Check_type
,right('0'+convert(varchar,DATEPART(day,I_date)),2) as I_date_dd
,TAT
,right('0'+convert(varchar,DATEPART(MONTH,I_date)),2) as I_date_mm
,DATEPART(year,I_date) as I_date_yyyy
,curr_status
  from HF_data where Aircraft_reg=@aircraft_reg and I_date = @idate;   
end
GO
/****** Object:  StoredProcedure [dbo].[mp_retrive]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_retrive]     
@Aircraft_reg varchar(50),    
@I_date date    
as     
begin    
 select * from HF_data where Aircraft_reg=@Aircraft_reg and I_date=@I_date  
end
GO
/****** Object:  StoredProcedure [dbo].[mp_piechartData]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_piechartData]
@line int,
@fromDate date,
@toDate date
as
begin
declare @occupied int 
declare @free int 

	set @occupied = 0;
	set @free = 0;
	while @fromDate<=@toDate
	begin
		if exists (select Line from HF_data where Line =@line and (@fromDate between I_date and E_date))
		begin
			set @occupied = @occupied + 1;
		end
		else
		begin
			set @free = @free +1;
		end 
		set @fromDate = dateadd(day,1,@fromDate);
	end
	select @occupied as Occupied,@free as free
end
GO
/****** Object:  StoredProcedure [dbo].[mp_newModel]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_newModel]
@model nvarchar(20)
as
begin
	insert into Models(model,isActive) values(@model,'true');
end
GO
/****** Object:  StoredProcedure [dbo].[mp_insertcompany]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_insertcompany]
@company nvarchar(50),
@color nvarchar(8),
@decide int out
as
begin
	if not exists (select * from CompanyRecord where company=@company or color=@color)
	begin
		set @decide =1;
		insert into CompanyRecord(company,color,isActive) values(@company,@color,'true'); 
	end
	else
	begin
		set @decide =0;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[mp_insertCheck]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_insertCheck]
@check nvarchar(50),
@decide int out
as
begin
	if not exists (select * from Checks where Checktype=@check)
	begin
		set @decide =1;
		insert into Checks(Checktype,isActive) values(@check,'true'); 
	end
	else
	begin
		set @decide =0;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[mp_deleteModel]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mp_deleteModel]
@model varchar(50)
as
begin
	delete from Models where model = @model;
end
GO
/****** Object:  StoredProcedure [dbo].[mp_deleteCompany]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mp_deleteCompany]
@company varchar(50)
as
begin
	delete from companyRecord where company = @company;
end
GO
/****** Object:  StoredProcedure [dbo].[mp_deleteCheck]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mp_deleteCheck]
@check varchar(50)
as
begin
	delete from Checks where Checktype = @check;
end
GO
/****** Object:  StoredProcedure [dbo].[mp_delete]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_delete]  
@Aircraft_reg varchar(50),  
@idate date,
@Sessionby varchar(20)
as  
begin  
	insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby)
	select Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,'Delete',@Sessionby from HF_data
	where Aircraft_reg=@Aircraft_reg and I_date=@idate ;
	delete from HF_data where Aircraft_reg=@Aircraft_reg and I_date=@idate;  
end
GO
/****** Object:  StoredProcedure [dbo].[mp_check]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_check] (       
@idate date,        
@tat int        
 )       
as        
begin        
 declare @edate date ;      
 set @edate =DATEADD(day,@tat,@idate);      
select distinct Linen from hangarSheet    
where Linen not in (select distinct Line from  HF_data        
where (@idate between I_date and E_date) or (@edate between I_date and E_date) or (I_date between @idate and @edate))       
end
GO
/****** Object:  StoredProcedure [dbo].[mp_update_check]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_update_check]
@idate date,        
@tat int,
@id int
as
begin
	declare @temp_HF_data as table (id int,air_reg nvarchar(50),Line int,I_date date,E_date date);
	insert into @temp_HF_data select  ID,Aircraft_reg,Line,I_date,E_date from HF_data
	delete from @temp_HF_data where id=@id;
	declare @edate date ;      
	set @edate =DATEADD(day,@tat,@idate);      
	select distinct Linen from hangarSheet    
	where Linen not in (select distinct Line from  @temp_HF_data        
	where (@idate between I_date and E_date) or (@edate between I_date and E_date) or (I_date between @idate and @edate))  
end
GO
/****** Object:  StoredProcedure [dbo].[mp_history]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_history]  
as   
begin  
 select  id,Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,E_date,curr_status,Op_type,Sessionby,(CONVERT(varchar,Record_time,103) +'  '+CONVERT(varchar,Record_time,108)) from Historylog;  
end
GO
/****** Object:  StoredProcedure [dbo].[mp_Forceinsert]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_Forceinsert]  
@aircraft_reg varchar(50),          
@line int,          
@customer varchar(50),          
@aircraft_model varchar(50),          
@check_type varchar(50),          
@i_date date,          
@tat int,        
@ses varchar(50),
@status varchar(50)       
as          
begin 
if not exists  
(select * from HF_data where Aircraft_reg=@aircraft_reg and I_date=@i_date)        
 begin  
 declare @tbl as table (line int);  
 insert into @tbl exec mp_check  @i_date,@tat;  
  if exists (select * from @tbl where line=@line)  
  begin              
    insert into HF_data(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'false',@status);   
    insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'false','Forced Insert',@ses,@status);
   end
else
begin
	insert into HF_data(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'true',@status);   
    insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'true','Forced Insert',@ses,@status)
end                        
end
end
GO
/****** Object:  StoredProcedure [dbo].[mp_update]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_update]
@id int,  
@aircraft_reg varchar(50),        
@line int,        
@customer varchar(50),        
@aircraft_model varchar(50),        
@check_type varchar(50),        
@i_date date,        
@tat int,      
@ses varchar(50),        
@decide int out,
@status varchar(20)
as        
begin    
 declare @tbl as table (line int);  
 insert into @tbl exec mp_update_check  @i_date,@tat,@id;  
  if exists (select * from @tbl where line=@line)  
  begin     
   set @decide=2;        
   update HF_data
	set Aircraft_reg=@aircraft_reg, Line=@line,Customer=@customer,Aircraft_model=@aircraft_model,Check_type=@check_type,I_date=@i_date,TAT=@tat,Overlapp='false',curr_status=@status
	where ID=@id;
   insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'false','Update',@ses,@status);        
  end   
  else   
  begin  
   set @decide=1;   
update HF_data
	set Aircraft_reg=@aircraft_reg
	,Line=@line
	,Customer=@customer
	,Aircraft_model=@aircraft_model
	,Check_type=@check_type
	,I_date=@i_date
	,TAT=@tat
	,Overlapp='true'
	,curr_status=@status
	where ID=@id;
   insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'true','Update',@ses,@status);           
  end  
 end
GO
/****** Object:  StoredProcedure [dbo].[mp_insert]    Script Date: 10/19/2016 11:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mp_insert]
@aircraft_reg varchar(50),      
@line int,      
@customer varchar(50),      
@aircraft_model varchar(50),      
@check_type varchar(50),      
@i_date date,      
@tat int,    
@ses varchar(50),      
@decide int out,
@status varchar(50)      
as      
begin      
if not exists
(select * from HF_data where Aircraft_reg=@aircraft_reg and I_date=@i_date)      
	begin
	declare @tbl as table (line int);
	insert into @tbl exec mp_check  @i_date,@tat;
		if exists (select * from @tbl where line=@line)
		begin   
			set @decide=2;      
			insert into HF_data(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'false',@status);  
			insert into Historylog(Aircraft_reg,Line,Customer,Aircraft_model,Check_type,I_date,TAT,Overlapp,Op_type,Sessionby,curr_status) values(@aircraft_reg,@line,@customer,@aircraft_model,@check_type,@i_date,@tat,'false','New Entry',@ses,@status);      
		end 
		else 
		begin
			set @decide=1;	
		end
	end      
else      
	begin      
		set @decide=0;      
	end      
end
GO
/****** Object:  Default [DF__Historylo__Recor__1CF15040]    Script Date: 10/19/2016 11:51:13 ******/
ALTER TABLE [dbo].[Historylog] ADD  DEFAULT (getdate()) FOR [Record_time]
GO
