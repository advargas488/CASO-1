USE [Caso_1]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[Deliverables]
DROP TABLE IF EXISTS [dbo].[Actions]
DROP TABLE IF EXISTS [dbo].[Planes]
DROP TABLE IF EXISTS [dbo].[Parties]
DROP TABLE IF EXISTS [dbo].[Cantones]
DROP TABLE IF EXISTS [dbo].[Provincias]
DROP TABLE IF EXISTS [dbo].[Usuarios]
DROP PROCEDURE IF EXISTS [dbo].[Consulta_1]
DROP PROCEDURE IF EXISTS [dbo].[Consulta_2]
CREATE TABLE [dbo].[Actions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPlan] [int] NOT NULL,
	[Description] [varchar](120) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cantones]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cantones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Cantones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliverables]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliverables](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPartido] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[IdAction] [int] NOT NULL,
	[IdCanton] [int] NOT NULL,
	[KpiValue] [int] NOT NULL,
	[KpiType] [varchar](15) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Checksum] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Deliverables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parties]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[Parties]
CREATE TABLE [dbo].[Parties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[URLFlag] [varchar](2083) NOT NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_Parties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[Planes]
CREATE TABLE [dbo].[Planes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](64) NOT NULL,
	[URLPicture] [varchar](2083) NOT NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actions]  WITH CHECK ADD  CONSTRAINT [FK_Actions_Plan] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Planes] ([Id])
GO
ALTER TABLE [dbo].[Actions] CHECK CONSTRAINT [FK_Actions_Plan]
GO
ALTER TABLE [dbo].[Cantones]  WITH CHECK ADD  CONSTRAINT [FK_Cantones_Provincias] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([Id])
GO
ALTER TABLE [dbo].[Cantones] CHECK CONSTRAINT [FK_Cantones_Provincias]
GO
ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Actions] FOREIGN KEY([IdAction])
REFERENCES [dbo].[Actions] ([Id])
GO
ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Actions]
GO
ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Cantones] FOREIGN KEY([IdCanton])
REFERENCES [dbo].[Cantones] ([Id])
GO
ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Cantones]
GO
ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Parties] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Parties] ([Id])
GO
ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Parties]
GO
ALTER TABLE [dbo].[Deliverables]  WITH CHECK ADD  CONSTRAINT [FK_Deliverables_Plan] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[Planes] ([Id])
GO
ALTER TABLE [dbo].[Deliverables] CHECK CONSTRAINT [FK_Deliverables_Plan]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Parties] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Parties] ([Id])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Plan_Parties]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_1]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_1]
	-- Add the parameters for the stored procedure here
	 @Canton VARCHAR(20)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @idCanton INT

	SELECT @idCanton = Id 
					   FROM Cantones AS C
					   WHERE C.Nombre = @Canton;
	
	SELECT D.IdPartido, D.IdAction, D.IdCanton, D.IdPlan, D.PostTime
		FROM Deliverables AS D
		WHERE D.IdCanton = @idCanton
	GROUP BY D.IdPartido ,D.IdAction, D.IdCanton, D.IdPlan, D.PostTime

	SET NOCOUNT OFF;
END

EXECUTE Consulta_2
GO
/****** Object:  StoredProcedure [dbo].[Consulta_2]    Script Date: 2/27/2022 10:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_2]
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @totalPartidos INT;

	SELECT @totalPartidos = COUNT(*)
							FROM Parties

	SELECT C.Nombre
	FROM Cantones AS C, Parties AS P, Deliverables AS D
	WHERE C.Id = D.IdCanton
	GROUP BY C.Nombre
	HAVING @totalPartidos * 0.25 >= COUNT(DISTINCT D.IdPartido);

	SET NOCOUNT OFF;
END
GO

DELETE FROM dbo.Deliverables
DELETE FROM dbo.Actions
DELETE FROM dbo.Planes
DELETE FROM dbo.Parties
DELETE FROM dbo.Cantones
DELETE FROM dbo.Provincias
--Insert parties
DBCC CHECKIDENT('Parties', RESEED, 1)
INSERT INTO dbo.Parties(Name,URLFlag,CreationDate)
SELECT
   MY_XML.Partido.query('Name').value('.', 'VARCHAR(50)'),
   MY_XML.Partido.query('URLFlag').value('.', 'VARCHAR(2083)'),
   MY_XML.Partido.query('CreationDate').value('.', 'DATE')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Partidos.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Partidos/Partido') AS MY_XML (Partido);

--Insert planes
DBCC CHECKIDENT('Planes', RESEED, 1)
INSERT INTO dbo.Planes(IdPartido,Title,Description)
SELECT
   MY_XML.Planes.query('IdPartido').value('.', 'INT'),
   MY_XML.Planes.query('Title').value('.', 'VARCHAR(50)'),
   MY_XML.Planes.query('Description').value('.', 'VARCHAR(250)')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Planes.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Planes/Plan') AS MY_XML (Planes);

--Insert actions
DBCC CHECKIDENT('Actions', RESEED, 1)
INSERT INTO dbo.Actions(IdPlan,Description)
SELECT
   MY_XML.Actions.query('IdPlan').value('.', 'INT'),
   MY_XML.Actions.query('Description').value('.', 'VARCHAR(120)')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Actions.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Actions/Action') AS MY_XML (Actions);

--Insert provincias
DELETE FROM dbo.Provincias
DBCC CHECKIDENT('Provincias', RESEED, 1)
INSERT INTO dbo.Provincias(Nombre)
SELECT
   MY_XML.Provincia.query('Nombre').value('.', 'VARCHAR(11)')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Provincias.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Provincias/Provincia') AS MY_XML (Provincia);

--Insert cantones
DBCC CHECKIDENT('Cantones', RESEED, 1)
INSERT INTO dbo.Cantones(IdProvincia,Nombre)
SELECT
   MY_XML.Cantones.query('IdProvincia').value('.', 'INT'),
   MY_XML.Cantones.query('Nombre').value('.', 'VARCHAR(20)')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Cantones.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Cantones/Canton') AS MY_XML (Cantones);

--Insert derivables
DBCC CHECKIDENT('Deliverables', RESEED, 1)
INSERT INTO dbo.Deliverables(IdPartido,IdPlan,IdAction,IdCanton,KpiValue,KpiType,PostTime,Checksum)
SELECT
   MY_XML.Deliverables.query('IdPartido').value('.', 'INT'),
   MY_XML.Deliverables.query('IdPlan').value('.', 'INT'),
   MY_XML.Deliverables.query('IdAction').value('.', 'INT'),
   MY_XML.Deliverables.query('IdCanton').value('.', 'INT'),
   MY_XML.Deliverables.query('KpiValue').value('.', 'INT'),
   MY_XML.Deliverables.query('KpiType').value('.', 'VARCHAR(15)'),
   MY_XML.Deliverables.query('PostTime').value('.', 'DATETIME'),
   MY_XML.Deliverables.query('Checksum').value('.', 'NVARCHAR(50)')
FROM (SELECT CAST(MY_XML AS xml)
      FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\I-SEMESTRE 2022\BASES II\CASO 1\Data\Deliverables.xml', SINGLE_BLOB) AS T(MY_XML)) AS T(MY_XML)
      CROSS APPLY MY_XML.nodes('Derivables/Derivable') AS MY_XML (Deliverables);