/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [TRAFFIC_Management]
GO
/****** Object:  Table [dbo].[Crossroad]    Script Date: 25-Oct-17 5:15:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crossroad](
	[Id] [float] NOT NULL,
	[Name_crossroad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Crossroad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrossroadParameters]    Script Date: 25-Oct-17 5:15:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrossroadParameters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_crossroad] [float] NOT NULL,
	[Id_polultion] [nvarchar](2) NOT NULL,
	[Id_traffic] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_CrossroadParameters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pollution]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pollution](
	[Id] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Minimum] [float] NOT NULL,
	[Maximum] [float] NOT NULL,
 CONSTRAINT [PK_Pollution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_traffic] [nvarchar](2) NOT NULL,
	[Id_pollution] [nvarchar](2) NOT NULL,
	[Value_priority] [int] NOT NULL,
 CONSTRAINT [PK_RoutePriority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultCrossroad]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultCrossroad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_crossroad] [float] NOT NULL,
	[Id_priority] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultRoute]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultRoute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_route] [int] NOT NULL,
	[Route_priority] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ResultRoute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[Id] [int] NOT NULL,
	[Name_route] [nvarchar](50) NOT NULL,
	[Id_start] [float] NOT NULL,
	[Id_end] [float] NOT NULL,
 CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteCrossroad]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteCrossroad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_route] [int] NOT NULL,
	[Id_crossroad] [float] NOT NULL,
	[Crossroad_order] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RouteCrossroad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrafficCongestion]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrafficCongestion](
	[Id] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Minimum] [float] NOT NULL,
	[Maximum] [float] NOT NULL,
 CONSTRAINT [PK_TrafficCongestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (1.1, N'1.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (1.3, N'1.3')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (2.1, N'2.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (2.2, N'2.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (2.3, N'2.3')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (3.1, N'3.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (3.2, N'3.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (3.3, N'3.3')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (4.2, N'4.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (4.3, N'4.3')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (5.2, N'5.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (5.4, N'5.4')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (6.1, N'6.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (6.2, N'6.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (6.3, N'6.3')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (6.4, N'6.4')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (7.1, N'7.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (7.2, N'7.2')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (7.4, N'7.4')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (8.1, N'8.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (8.4, N'8.4')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (9.1, N'9.1')
INSERT [dbo].[Crossroad] ([Id], [Name_crossroad]) VALUES (9.2, N'9.2')
SET IDENTITY_INSERT [dbo].[CrossroadParameters] ON 

INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (1, 1.1, N'P1', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (2, 1.3, N'P2', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (3, 2.1, N'P3', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (4, 2.2, N'P1', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (5, 2.3, N'P1', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (6, 3.1, N'P2', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (8, 3.2, N'P2', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (9, 3.3, N'P1', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (10, 4.2, N'P3', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (11, 4.3, N'P2', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (12, 5.2, N'P1', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (13, 5.4, N'P3', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (15, 6.1, N'P1', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (16, 6.2, N'P2', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (17, 6.3, N'P2', N'T1')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (18, 6.4, N'P1', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (19, 7.1, N'P3', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (20, 7.2, N'P1', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (22, 7.4, N'P1', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (23, 8.1, N'P2', N'T2')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (24, 8.4, N'P3', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (25, 9.1, N'P1', N'T3')
INSERT [dbo].[CrossroadParameters] ([Id], [Id_crossroad], [Id_polultion], [Id_traffic]) VALUES (26, 9.2, N'P3', N'T1')
SET IDENTITY_INSERT [dbo].[CrossroadParameters] OFF
INSERT [dbo].[Pollution] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'P1', N'Very Low', 0, 24.99)
INSERT [dbo].[Pollution] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'P2', N'Low', 25, 49.99)
INSERT [dbo].[Pollution] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'P3', N'Medium', 50, 74.99)
INSERT [dbo].[Pollution] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'P4', N'High', 75, 99.99)
INSERT [dbo].[Pollution] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'P5', N'Very High', 100, 10000)
SET IDENTITY_INSERT [dbo].[Priority] ON 

INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (1, N'T1', N'P1', 1)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (2, N'T1', N'P2', 2)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (3, N'T1', N'P3', 3)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (4, N'T2', N'P1', 4)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (5, N'T2', N'P2', 5)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (6, N'T2', N'P3', 6)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (7, N'T3', N'P1', 7)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (8, N'T3', N'P2', 8)
INSERT [dbo].[Priority] ([Id], [Id_traffic], [Id_pollution], [Value_priority]) VALUES (9, N'T3', N'P3', 9)
SET IDENTITY_INSERT [dbo].[Priority] OFF
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (1, N'Зелена', 1.1, 6.2)
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (2, N'Зелена', 6.4, 1.3)
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (3, N'Сина', 1.1, 6.1)
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (4, N'Сина', 6.3, 1.3)
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (5, N'Црвена', 1.1, 6.1)
INSERT [dbo].[Route] ([Id], [Name_route], [Id_start], [Id_end]) VALUES (6, N'Црвена', 6.3, 1.3)
SET IDENTITY_INSERT [dbo].[RouteCrossroad] ON 

INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (1, 1, 1.1, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (3, 1, 2.1, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (4, 1, 3.1, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (5, 1, 4.2, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (6, 1, 5.2, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (7, 1, 6.2, N'6')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (8, 2, 6.4, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (9, 2, 5.4, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (10, 2, 4.3, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (11, 2, 3.3, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (12, 2, 2.3, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (15, 2, 1.3, N'6')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (16, 3, 1.1, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (17, 3, 2.1, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (20, 3, 3.2, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (21, 3, 7.1, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (22, 3, 6.1, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (23, 4, 6.3, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (24, 4, 7.4, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (25, 4, 3.3, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (26, 4, 2.3, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (27, 4, 1.3, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (28, 5, 1.1, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (29, 5, 2.2, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (30, 5, 9.2, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (31, 5, 8.1, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (32, 5, 7.1, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (33, 5, 6.1, N'6')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (34, 6, 6.3, N'1')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (35, 6, 7.2, N'2')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (36, 6, 8.4, N'3')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (37, 6, 9.1, N'4')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (38, 6, 2.3, N'5')
INSERT [dbo].[RouteCrossroad] ([Id], [Id_route], [Id_crossroad], [Crossroad_order]) VALUES (39, 6, 1.3, N'6')
SET IDENTITY_INSERT [dbo].[RouteCrossroad] OFF
INSERT [dbo].[TrafficCongestion] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'T1', N'Intersection operate under capacity', 0, 0.84)
INSERT [dbo].[TrafficCongestion] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'T2', N'Intersection operate near capacity', 0.85, 0.94)
INSERT [dbo].[TrafficCongestion] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'T3', N'Intersection operate at capacity', 0.95, 0.99)
INSERT [dbo].[TrafficCongestion] ([Id], [Description], [Minimum], [Maximum]) VALUES (N'T4', N'Intersection operate over capacity', 1, 100000)
ALTER TABLE [dbo].[CrossroadParameters]  WITH CHECK ADD  CONSTRAINT [FK_CrossroadParameters_Crossroad] FOREIGN KEY([Id_crossroad])
REFERENCES [dbo].[Crossroad] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrossroadParameters] CHECK CONSTRAINT [FK_CrossroadParameters_Crossroad]
GO
ALTER TABLE [dbo].[CrossroadParameters]  WITH CHECK ADD  CONSTRAINT [FK_CrossroadParameters_Pollution] FOREIGN KEY([Id_polultion])
REFERENCES [dbo].[Pollution] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrossroadParameters] CHECK CONSTRAINT [FK_CrossroadParameters_Pollution]
GO
ALTER TABLE [dbo].[CrossroadParameters]  WITH CHECK ADD  CONSTRAINT [FK_CrossroadParameters_TrafficCongestion] FOREIGN KEY([Id_traffic])
REFERENCES [dbo].[TrafficCongestion] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrossroadParameters] CHECK CONSTRAINT [FK_CrossroadParameters_TrafficCongestion]
GO
ALTER TABLE [dbo].[Priority]  WITH CHECK ADD  CONSTRAINT [FK_Priority_Pollution] FOREIGN KEY([Id_pollution])
REFERENCES [dbo].[Pollution] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Priority] CHECK CONSTRAINT [FK_Priority_Pollution]
GO
ALTER TABLE [dbo].[Priority]  WITH CHECK ADD  CONSTRAINT [FK_Priority_TrafficCongestion] FOREIGN KEY([Id_traffic])
REFERENCES [dbo].[TrafficCongestion] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Priority] CHECK CONSTRAINT [FK_Priority_TrafficCongestion]
GO
ALTER TABLE [dbo].[ResultCrossroad]  WITH CHECK ADD  CONSTRAINT [FK_ResultCrossroad_Crossroad] FOREIGN KEY([Id_crossroad])
REFERENCES [dbo].[Crossroad] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResultCrossroad] CHECK CONSTRAINT [FK_ResultCrossroad_Crossroad]
GO
ALTER TABLE [dbo].[ResultCrossroad]  WITH CHECK ADD  CONSTRAINT [FK_ResultCrossroad_Priority] FOREIGN KEY([Id_priority])
REFERENCES [dbo].[Priority] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResultCrossroad] CHECK CONSTRAINT [FK_ResultCrossroad_Priority]
GO
ALTER TABLE [dbo].[ResultRoute]  WITH CHECK ADD  CONSTRAINT [FK_ResultRoute_Route] FOREIGN KEY([Id_route])
REFERENCES [dbo].[Route] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResultRoute] CHECK CONSTRAINT [FK_ResultRoute_Route]
GO
ALTER TABLE [dbo].[RouteCrossroad]  WITH CHECK ADD  CONSTRAINT [FK_RouteCrossroad_Crossroad] FOREIGN KEY([Id_crossroad])
REFERENCES [dbo].[Crossroad] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteCrossroad] CHECK CONSTRAINT [FK_RouteCrossroad_Crossroad]
GO
ALTER TABLE [dbo].[RouteCrossroad]  WITH CHECK ADD  CONSTRAINT [FK_RouteCrossroad_Route] FOREIGN KEY([Id_route])
REFERENCES [dbo].[Route] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteCrossroad] CHECK CONSTRAINT [FK_RouteCrossroad_Route]
GO
/****** Object:  StoredProcedure [dbo].[USP_Crossroad_SelectAll]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[USP_Crossroad_SelectAll]
AS
Begin
	Select *
    From Crossroad
End

GO
/****** Object:  StoredProcedure [dbo].[USP_CrossroadParameters_Select]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_CrossroadParameters_Select]
    (
	 @Id_crossroad float = 0.0
    )
AS
Begin
	Select *
    From CrossroadParameters
	Where Id_crossroad = @Id_crossroad
End

GO
/****** Object:  StoredProcedure [dbo].[USP_CrossroadPriority_Select]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_CrossroadPriority_Select]
    (
	 @Id_traffic NVARCHAR(2),
	 @Id_pollution NVARCHAR(2)
    )
AS
Begin
	Select *
    From Priority
	Where Id_traffic = @Id_traffic
	And  Id_pollution = @Id_pollution
End


GO
/****** Object:  StoredProcedure [dbo].[USP_ResultCrossroad_Insert]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_ResultCrossroad_Insert]
	(
		@Id_crossroad float,
		@Id_priority int,
		@Date datetime
	)
AS
Begin
	Set nocount on

	Insert INTO dbo.ResultCrossroad
	(
		Id_crossroad,
		Id_priority,
		Date
		)
	Values
	(
		@Id_crossroad,
		@Id_priority,
		@Date
	)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_ResultRoute_Insert]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_ResultRoute_Insert]
	(
		@Id_route int,
		@Route_priority int,
		@Date datetime
	)
AS
Begin
	Set nocount on

	Insert INTO dbo.ResultRoute
	(
		Id_route,
		Route_priority,
		Date 
		)
	Values
	(
		@Id_route,
		@Route_priority,
		@Date 
	)
END

GO
/****** Object:  StoredProcedure [dbo].[USP_Route_Select]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Route_Select]
    (
	 @Id_start float =1.1,
	 @Id_end float = 1.1
    )
AS
Begin
	Select *
    From Route
	Where Id_start = @Id_start
	And  Id_end = @Id_end
End

GO
/****** Object:  StoredProcedure [dbo].[USP_Route_SelectAll]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Route_SelectAll]
AS
Begin
	Select *
    From Route
End

GO
/****** Object:  StoredProcedure [dbo].[USP_Route_SelectAllEnds]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Route_SelectAllEnds]
AS
Begin
	Select distinct [Id_end]
    From Route
End

GO
/****** Object:  StoredProcedure [dbo].[USP_Route_SelectAllStarts]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[USP_Route_SelectAllStarts]
AS
Begin
	Select distinct [Id_start]
    From Route
End

GO
/****** Object:  StoredProcedure [dbo].[USP_Route_SelectById]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_Route_SelectById]
    (
	 @Id_route int =0
    )
AS
Begin
	Select *
    From Route
	Where Id = @Id_route
End
GO
/****** Object:  StoredProcedure [dbo].[USP_RouteCrosroads_Select]    Script Date: 25-Oct-17 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[USP_RouteCrosroads_Select]
    (
	 @Id_route int = 0
    )
AS
Begin
	Select *
    From RouteCrossroad
	Where Id_route = @Id_route
End

GO
