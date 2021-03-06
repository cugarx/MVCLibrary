USE [master]
GO
/****** Object:  Database [Library]    Script Date: 04/12/2015 11:35:04 a. m. ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 04/12/2015 11:35:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCountry] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 04/12/2015 11:35:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAuthor] [int] NOT NULL,
	[IdCategory] [int] NOT NULL,
	[ISBN] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Publisher] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/12/2015 11:35:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 04/12/2015 11:35:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[NameEs] [nvarchar](255) NULL,
	[NationalityEs] [nvarchar](255) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (1, 110, N'Bryan', N'Thompson')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (2, 112, N'Mark', N'Finch')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (5, 109, N'Raquel', N'Bush')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (7, 18, N'Adolph', N'Sierra')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (11, 73, N'Pamela', N'Bush')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (12, 3, N'Henrich', N'Olson')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (13, 53, N'Mike', N'Finch')
INSERT [dbo].[Author] ([Id], [IdCountry], [Name], [LastName]) VALUES (15, 3, N'Charly', N'Café')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (10, 5, 45, N'5236485260', N'Astronomys', N'Oceano', N'Nothing')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (23, 11, 48, N'8437278342', N'Spanish Language Advanced', N'Ocean', N'Most Value Book')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (25, 1, 53, N'2214581566', N'Spanish Language Advanced', N'Ocean', N'Anything')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (26, 15, 53, N'2214581566', N'Marine Biology', N'Ocean', N'Anything')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (28, 13, 51, N'0214561231', N'Psicologic IV', N'Salud T.', N'Advance')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (29, 12, 49, N'1234893', N'Cooker Manual', N'El redondo', N'Comida')
INSERT [dbo].[Book] ([Id], [IdAuthor], [IdCategory], [ISBN], [Title], [Publisher], [Description]) VALUES (30, 12, 43, N'1235352556', N'Home Education ', N'Trillas', N'Very good')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (38, N'Bussiness')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (39, N'Childen''s Fiction')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (40, N'Childen''s Non-Fiction')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (41, N'Cooking, Food & Wine')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (42, N'Crafts & Hobbies')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (43, N'Family & Parenting')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (44, N'Fiction')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (45, N'Fun & Games')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (46, N'Gardening')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (47, N'Health, Mind, & Body')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (48, N'History')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (49, N'Home Reference/How-to')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (50, N'Humor')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (51, N'Medical')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (52, N'Music')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (53, N'Performing Arts')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (54, N'Pets')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (55, N'Philosophy')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (56, N'Photography')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (57, N'Reference')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (58, N'Religion')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (59, N'Self-Help')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (60, N'Social Science')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (61, N'Sports & Recreation')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (62, N'Transportation')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (64, N'Travel')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (73, N'Art')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (1, N'AFG.png', N'Afghanistan', N'Afganistán', N'afgana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (2, N'ALB.png', N'Albania', N'Albania', N'albanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (3, N'DEU.png', N'Germany', N'Alemania', N'alemana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (4, N'AND.png', N'Andorra', N'Andorra', N'andorrana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (5, N'AGO.png', N'Angola', N'Angola', N'angoleña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (6, N'ANT.png', N'Netherlands Antilles', N'Antillas Neerlandesas', N'Antillas Neerlandesas (neerlandesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (7, N'CAF.png', N'Central African Republic', N'República Centroafricana', N'centroafricana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (8, N'ARG.png', N'Argentina', N'Argentina', N'argentina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (9, N'SAU.png', N'Saudi Arabia', N'Arabia Saudita', N'saudita')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (10, N'AUT.png', N'Austria', N'Austria', N'austriaca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (11, N'ATG.png', N'Antigua and Barbuda', N'Antigua y Barbuda', N'antiguana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (12, N'AUS.png', N'Australia', N'Australia', N'australiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (13, N'BHS.png', N'Bahamas', N'Bahamas', N'bahameña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (14, N'BHR.png', N'Bahrain', N'Bahréin', N'bahreinia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (15, N'BDI.png', N'Burundi', N'Burundi', N'burundesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (16, N'BLZ.png', N'Belize', N'Belice', N'beliceña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (17, N'BGD.png', N'Bangladesh', N'Bangladesh', N'bangladesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (18, N'BTN.png', N'Bhutan', N'Bután', N'butanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (19, N'SLB.png', N'Solomon Islands', N'Islas Salomón', N'salomonense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (20, N'BEL.png', N'Belgium', N'Bélgica', N'belga')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (21, N'BOL.png', N'Bolivia', N'Bolivia', N'boliviana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (22, N'BIH.png', N'Bosnia and Herzegovina', N'Bosnia y Herzegovina', N'bosnioherzegovina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (23, N'BRA.png', N'Brazil', N'Brasil', N'brasileña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (24, N'BRB.png', N'Barbados', N'Barbados', N'barbadensa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (25, N'BRN.png', N'Brunei', N'Brunei', N'bruneana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (26, N'BMU.png', N'Bermuda', N'Bermuda', N'bermudeña (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (27, N'BWA.png', N'Botswana', N'Botsuana', N'botsuana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (28, N'BGR.png', N'Bulgaria', N'Bulgaria', N'búlgara')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (29, N'CAN.png', N'Canada', N'Canadá', N'canadiense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (30, N'KHM.png', N'Cambodia', N'Cambodia', N'camboyana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (31, N'TCD.png', N'Chad', N'Chad', N'chadiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (32, N'CHL.png', N'Chile', N'Chile', N'chilena')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (33, N'CHN.png', N'China', N'China', N'china')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (34, N'CYP.png', N'Cyprus', N'Chipre', N'chipriota')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (35, N'CIV.png', N'Côte d’Ivoire', N'Costa de Marfil', N'marfileña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (36, N'CMR.png', N'Cameroon', N'Camerún', N'camerunesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (37, N'PRK.png', N'North Korea', N'Corea del Norte', N'norcoreana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (38, N'COL.png', N'Colombia', N'Colombia', N'colombiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (39, N'COG.png', N'Congo', N'Congo', N'congoleña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (40, N'CRI.png', N'Costa Rica', N'Costa Rica', N'costarricense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (41, N'KNA.png', N'Saint Kitts and Nevis', N'San Cristóbal y Nieves', N'sancristobaleña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (42, N'KOR.png', N'South Korea', N'Corea del Sur', N'surcoreana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (43, N'CUB.png', N'Cuba', N'Cuba', N'cubana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (44, N'VAT.png', N'Vatican (Holy See)', N'Ciudad del Vaticano', N'vaticana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (45, N'DNK.png', N'Denmark', N'Dinamarca', N'danesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (46, N'DMA.png', N'Dominica', N'Dominica', N'dominiquesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (47, N'ARE.png', N'United Arab Emirates', N'Emiratos Árabes Unidos', N'Emiratí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (48, N'ECU.png', N'Ecuador', N'Ecuador', N'ecuatoriana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (49, N'EGY.png', N'Egypt', N'Egipto', N'egipcia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (50, N'SVN.png', N'Slovenia', N'Eslovenia', N'eslovena')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (51, N'ESP.png', N'Spain', N'España', N'española')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (52, N'ETH.png', N'Ethiopia', N'Etiopía', N'etíope')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (53, N'USA.png', N'United States of America', N'Estados Unidos de América', N'estadounidense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (54, N'FJI.png', N'Fiji Islands', N'Fiji', N'fiyiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (55, N'PHL.png', N'Philippines', N'Filipinas', N'filipina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (56, N'FIN.png', N'Finland', N'Finlandia', N'finlandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (57, N'FRA.png', N'France', N'Francia', N'francesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (58, N'GIB.png', N'Gibraltar', N'Gibraltar', N'Gibraltareña (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (59, N'GAB.png', N'Gabon', N'Gabón', N'gabonesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (60, N'GHA.png', N'Ghana', N'Ghana', N'ghanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (61, N'GMB.png', N'Gambia', N'Gambia', N'gambiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (62, N'GNQ.png', N'Equatorial Guinea', N'Guinea Ecuatorial', N'ecuatoguineana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (63, N'GRD.png', N'Grenada', N'Granada', N'granadina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (64, N'GRC.png', N'Greece', N'Grecia', N'griega')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (65, N'GRL.png', N'Greenland', N'Groelandia', N'groenlandesa (danesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (66, N'GTM.png', N'Guatemala', N'Guatemala', N'guatemalteca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (67, N'GIN.png', N'Guinea', N'Guinea', N'guineana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (68, N'GUY.png', N'Guyana', N'Guyana', N'guyanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (69, N'GUF.png', N'French Guiana', N'Guayana Francesa', N'francoguyanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (70, N'HUN.png', N'Hungary', N'Hungría', N'húngara')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (71, N'HND.png', N'Honduras', N'Honduras', N'hondureña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (72, N'HKG.png', N'Hong Kong', N'Hong Kong', N'Hong Kong (china)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (73, N'HTI.png', N'Haiti', N'Haiti', N'haitiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (74, N'IDN.png', N'Indonesia', N'Indonesia', N'indonesia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (75, N'MDV.png', N'Maldives', N'Maldivas', N'maldiva')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (76, N'IND.png', N'India', N'India', N'india')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (77, N'GBR.png', N'United Kingdom', N'Reino Unido', N'británica')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (78, N'IRN.png', N'Iran', N'Iran', N'iraní')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (79, N'IRL.png', N'Ireland', N'Irlanda', N'irlandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (80, N'IRQ.png', N'Iraq', N'Iraq', N'iraquí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (81, N'ISL.png', N'Iceland', N'Islandia', N'islandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (82, N'ISR.png', N'Israel', N'Israel', N'israelí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (83, N'ITA.png', N'Italy', N'Italia', N'italiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (84, N'JAM.png', N'Jamaica', N'Jamaica', N'jamaiquina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (85, N'JOR.png', N'Jordan', N'Jordania', N'jordana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (86, N'JPN.png', N'Japan', N'Japón', N'japonesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (87, N'KEN.png', N'Kenya', N'Kenia', N'keniana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (88, N'KWT.png', N'Kuwait', N'Kuwait', N'Kuwaití')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (89, N'LAO.png', N'Laos', N'Laos', N'laosiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (90, N'LBY.png', N'Libya', N'Libia', N'libia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (91, N'LBN.png', N'Lebanon', N'Líbano', N'libanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (92, N'LBR.png', N'Liberia', N'Liberia', N'liberiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (93, N'LIE.png', N'Liechtenstein', N'Liechtenstein', N'liechtensteiniana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (94, N'LSO.png', N'Lesotho', N'Lesoto', N'lesotensa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (95, N'LUX.png', N'Luxembourg', N'Luxemburgo', N'luxemburguesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (96, N'MRT.png', N'Mauritania', N'Mauritania', N'mauritana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (97, N'MUS.png', N'Mauritius', N'Mauricio', N'mauriciana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (98, N'MEX.png', N'Mexico', N'México', N'mexicana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (99, N'MNG.png', N'Mongolia', N'Mongolia', N'mongola')
GO
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (100, N'MYS.png', N'Malaysia', N'Malasia', N'malaya')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (101, N'MLI.png', N'Mali', N'Mali', N'maliense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (102, N'MLT.png', N'Malta', N'Malta', N'maltesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (103, N'MCO.png', N'Monaco', N'Mónaco', N'monagasca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (104, N'MAR.png', N'Morocco', N'Marruecos', N'marroquí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (105, N'MWI.png', N'Malawi', N'Malawi', N'malauí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (106, N'MOZ.png', N'Mozambique', N'Mozambique', N'mozambiqueña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (107, N'NIC.png', N'Nicaragua', N'Nicaragua', N'nicaragüense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (108, N'NER.png', N'Niger', N'Niger', N'nigerina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (109, N'NGA.png', N'Nigeria', N'Nigeria', N'nigeriana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (110, N'NOR.png', N'Norway', N'Noruega', N'noruega')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (111, N'NPL.png', N'Nepal', N'Nepal', N'nepalesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (112, N'NRU.png', N'Nauru', N'Nauru', N'nauruana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (113, N'NZL.png', N'New Zealand', N'Nueva Zelanda', N'neozelandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (114, N'OMN.png', N'Oman', N'Omán', N'omanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (115, N'PAN.png', N'Panama', N'Panamá', N'panameña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (116, N'PNG.png', N'Papua New Guinea', N'Papúa Nueva Guinea', N'papú neoguineana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (117, N'NLD.png', N'Netherlands', N'Países Bajos', N'neerlandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (118, N'PRY.png', N'Paraguay', N'Paraguay', N'paraguaya')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (119, N'PAK.png', N'Pakistan', N'Pakistán', N'pakistaní')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (120, N'POL.png', N'Poland', N'Polonia', N'polaca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (121, N'PER.png', N'Peru', N'Perú', N'peruana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (122, N'PRT.png', N'Portugal', N'Portugal', N'portuguesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (123, N'PRI.png', N'Puerto Rico', N'Puerto Rico', N'estadounidense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (124, N'QAT.png', N'Qatar', N'Qatar', N'catarí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (125, N'CZE.png', N'Czech Republic', N'República Checa', N'checa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (126, N'DOM.png', N'Dominican Republic', N'República Dominicana', N'dominicana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (127, N'ROM.png', N'Romania', N'Rumania', N'rumana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (128, N'RUS.png', N'Russia', N'Rusia', N'rusa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (129, N'RWA.png', N'Rwanda', N'Ruanda', N'ruandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (130, N'SLV.png', N'El Salvador', N'El Salvador', N'salvadoreña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (131, N'ZAF.png', N'South Africa', N'Sudáfrica', N'sudafricana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (132, N'SDN.png', N'Sudan', N'Sudán', N'sudanesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (133, N'SEN.png', N'Senegal', N'Senegal', N'senegalesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (134, N'SYR.png', N'Syria', N'Siria', N'siria')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (135, N'SLE.png', N'Sierra Leone', N'Sierra Leona', N'sierraleonesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (136, N'LCA.png', N'Saint Lucia', N'Santa Lucía', N'santalucense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (137, N'SMR.png', N'San Marino', N'San Marino', N'sanmarinense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (138, N'ASM.png', N'American Samoa', N'Samoa Americana', N'samoana (estadounidense)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (139, N'SGP.png', N'Singapore', N'Singapur', N'singapurense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (140, N'SOM.png', N'Somalia', N'Somalia', N'somalí')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (141, N'LKA.png', N'Sri Lanka', N'Sri Lanka', N'srilankesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (142, N'SUR.png', N'Suriname', N'Surinam', N'surinamesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (143, N'SWE.png', N'Sweden', N'Suecia', N'sueca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (144, N'CHE.png', N'Switzerland', N'Suiza', N'suiza')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (145, N'VCT.png', N'Saint Vincent and the Grenadines', N'San Vicente y las Granadinas', N'sanvicentina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (146, N'SWZ.png', N'Swaziland', N'Suazilandia', N'suazi')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (147, N'THA.png', N'Thailand', N'Tailandia', N'tailandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (148, N'TGO.png', N'Togo', N'Togo', N'Togolesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (149, N'TON.png', N'Tonga', N'Toga', N'tongana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (150, N'TUN.png', N'Tunisia', N'Túnez', N'tunecina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (151, N'TUR.png', N'Turkey', N'Turquía', N'turca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (152, N'TTO.png', N'Trinidad and Tobago', N'Trinidad y Tobago', N'trinitense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (153, N'TWN.png', N'Taiwan', N'Taiwán', N'taiwanesa (china)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (154, N'TZA.png', N'Tanzania', N'Tanzania', N'tanzana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (155, N'UKR.png', N'Ukraine', N'Ucrania', N'ucraniana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (156, N'UGA.png', N'Uganda', N'Uganda', N'ugandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (157, N'URY.png', N'Uruguay', N'Uruguay', N'uruguaya')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (158, N'VNM.png', N'Vietnam', N'Vietnam', N'vietnamita')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (159, N'VEN.png', N'Venezuela', N'Venezuela', N'venezolana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (160, N'YEM.png', N'Yemen', N'Yemen', N'yemenita')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (161, N'ZMB.png', N'Zambia', N'Zambia', N'zambiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (162, N'COD.png', N'Congo, Democratic Republic', N'República Democrática del Congo', N'congoleña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (163, N'BLR.png', N'Belarus', N'Bielorrusia', N'bielorrusa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (164, N'SVK.png', N'Slovakia', N'Eslovaquia', N'eslovaca')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (165, N'DZA.png', N'Algeria', N'Argelia', N'argelina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (166, N'ALA.png', N'Aland Islands', N'Islas de Åland', N'de Aland (finlandesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (167, N'AIA.png', N'Anguilla', N'Anguilla', N'anguilense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (168, N'ATA.png', N'Antarctica', N'Antártica', N'Antártica')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (169, N'ARM.png', N'Armenia', N'Armenia', N'armenia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (170, N'ABW.png', N'Aruba', N'Aruba', N'arubeña')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (171, N'AZE.png', N'Azerbaijan', N'Azerbaiyán', N'azerbaiyana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (172, N'BEN.png', N'Benin', N'Benin', N'beninesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (173, N'BVT.png', N'Bouvet Island', N'Isla Bouvet', N'de Bovet (noruega)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (174, N'IOT.png', N'British Indian Ocean Territory', N'Territorio Británico del Océano Índico', N'británica')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (175, N'BFA.png', N'Burkina Faso', N'Burkina Faso', N'burkinés')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (176, N'CPV.png', N'Cape Verde', N'Cabo Verde', N'caboverdiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (177, N'CYM.png', N'Cayman Islands', N'Islas Caimán', N'caimanés (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (178, N'CXR.png', N'Christmas Island', N'Isla de Navidad', N'isla navidad (australiana)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (179, N'CCK.png', N'Cocos (Keeling) Islands', N'Islas Cocos', N'cocana (australiana)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (180, N'COM.png', N'Comoros', N'Comoras', N'comorensa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (181, N'COK.png', N'Cook Islands', N'Islas Cook', N'isla cook (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (182, N'HRV.png', N'Croatia', N'Croacia', N'croata')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (183, N'CUW.png', N'Curacao', N'Curazao', N'curazoleña (neerlandeza)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (184, N'CBR.png', N'Cyberbunker', N'Cyberbunker', N'cyberbunker')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (185, N'DJI.png', N'Djibouti', N'Djibouti', N'yibutiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (186, N'TMP.png', N'East Timor', N'Timor Oriental', N'timorense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (187, N'ERI.png', N'Eritrea', N'Eritrea', N'eritrea')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (188, N'EST.png', N'Estonia', N'Estonia', N'estonia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (189, N'EUR.png', N'European Union', N'Unión Europea', N'europea')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (190, N'FLK.png', N'Falkland Islands', N'Islas Malvinas', N'maldiva')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (191, N'FRO.png', N'Faroe Islands', N'Islas Feroe', N'feroesa (danesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (192, N'PYF.png', N'French Polynesia', N'Polinesia Francesa', N'francopolinesia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (193, N'ATF.png', N'French Southern territories', N'Tierras Australes y Antárticas Francesas', N'francesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (194, N'GEO.png', N'Georgia', N'Georgia', N'georgiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (195, N'GLP.png', N'Guadeloupe', N'Guadalupe', N'guadalupe (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (196, N'GUM.png', N'Guam', N'Guam', N'guameña (estadounidense)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (197, N'GGY.png', N'Guernsey', N'Guernsey', N'guernsey (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (198, N'GNB.png', N'Guinea-Bissau', N'Guinea-Bisáu', N'guineana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (199, N'HMD.png', N'Heard Island and McDonald', N'Islas Heard y McDonald', N'islas Heard y McDonald (australiana)')
GO
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (200, N'IMN.png', N'Isle of Man', N'Isla de Man', N'manesa (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (201, N'JEY.png', N'Jersey', N'Jersey', N'jersey (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (202, N'KAZ.png', N'Kazakhstan', N'Kazajistán', N'kazaja')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (203, N'KIR.png', N'Kiribati', N'Kiribati', N'kiribatiana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (204, N'KGZ.png', N'Kyrgyzstan', N'Kirguistán', N'kirguisa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (205, N'LVA.png', N'Latvia', N'Latvia', N'letona')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (206, N'LTU.png', N'Lithuania', N'Lituania', N'lituana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (207, N'MAC.png', N'Macau', N'Macao', N'macaudais (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (208, N'MKD.png', N'Macedonia', N'Macedonia', N'macedonia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (209, N'MDG.png', N'Madagascar', N'Madagascar', N'malgache')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (210, N'MHL.png', N'Marshall Islands', N'Islas Marshall', N'marshalesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (211, N'MTQ.png', N'Martinique', N'Martinica', N'martinicana (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (212, N'MYT.png', N'Mayotte', N'Mayotte', N'mayotense (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (213, N'FSM.png', N'Micronesia, Federated States', N'Micronesia', N'micronesia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (214, N'MDA.png', N'Moldova', N'Moldavia', N'moldava')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (215, N'MNE.png', N'Montenegro', N'Montenegro (República de)', N'montenegrina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (216, N'MSR.png', N'Montserrat', N'Montserrat', N'de Montserrat (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (217, N'MMR.png', N'Myanmar', N'Myanmar (Birmania)', N'birmana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (218, N'NAM.png', N'Namibia', N'Namibia', N'namibia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (219, N'NCL.png', N'New Caledonia', N'Nueva Caledonia', N'neocaledonia (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (220, N'NIU.png', N'Niue', N'Niue', N'niuana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (221, N'NFK.png', N'Norfolk Island', N'Isla Norfolk', N'norfolkense (australiana)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (222, N'MNP.png', N'Northern Mariana Islands', N'Islas Marianas del Norte', N'Normarianense (estadounidense)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (223, N'PLW.png', N'Palau', N'Palau', N'palauana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (224, N'PSE.png', N'Palestine', N'Palestina', N'palestina')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (225, N'PCN.png', N'Pitcairn', N'Islas Pitcairn', N'de Pitcairn (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (226, N'REU.png', N'Réunion', N'Isla de la Reunión', N'reunionesa (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (227, N'SHN.png', N'Saint Helena', N'Isla Santa Elena', N'santahelena (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (228, N'MAF.png', N'Saint Martin', N'Isla de San Martín', N'francesa o neerlandesa')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (229, N'SPM.png', N'Saint Pierre and Miquelon', N'San Pedro y Miquelón', N'sanpedrina (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (230, N'WSM.png', N'Samoa', N'Samoa', N'samoana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (231, N'STP.png', N'Sao Tome and Principe', N'Santo Tomé y Príncipe', N'santotomense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (232, N'SRB.png', N'Serbia', N'Serbia', N'serbia')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (233, N'SYC.png', N'Seychelles', N'Seychelles', N'seychellense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (234, N'SGS.png', N'South Georgia and the South', N'Islas Georgias del Sur y Sandwich del Sur', N'británica')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (235, N'SJM.png', N'Svalbard and Jan Mayen', N'Svalbard y Jan Mayen', N'Noruega')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (236, N'TJK.png', N'Tajikistan', N'Tayikistán', N'tayika')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (237, N'TKL.png', N'Tokelau', N'Tokelau', N'Tokelauana (neozelandesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (238, N'TKM.png', N'Turkmenistan', N'Turkmenistán', N'turkmena')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (239, N'TCA.png', N'Turks and Caicos Islands', N'Islas Turcas y Caicos', N'Turcocaiqueña (británica)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (240, N'TUV.png', N'Tuvalu', N'Tuvalu', N'tuvaluana')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (241, N'UMI.png', N'United States Minor Outlying', N'Islas ultramarinas de Estados Unidos', N'estadounidense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (242, N'UZB.png', N'Uzbekistan', N'Uzbekistán', N'uzbeka')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (243, N'VUT.png', N'Vanuatu', N'Vanuatu', N'vanuatuense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (244, N'VGB.png', N'Virgin Islands, British', N'Islas Vírgenes Británicas', N'virgenense británica')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (245, N'VIR.png', N'Virgin Islands, U.S.', N'Islas Vírgenes', N'estadounidense')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (246, N'WLF.png', N'Wallis and Futuna', N'Wallis y Futuna', N'Walisiana (francesa)')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (247, N'ESH.png', N'Western Sahara', N'Sahara Occidental', N'saharaui')
INSERT [dbo].[Country] ([Id], [Code], [Name], [NameEs], [NationalityEs]) VALUES (248, N'ZWE.png', N'Zimbabwe', N'Zimbabue', N'zimbabuense')
SET IDENTITY_INSERT [dbo].[Country] OFF
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_Country] FOREIGN KEY([IdCountry])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_Country]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([IdAuthor])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
