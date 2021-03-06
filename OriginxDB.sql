USE [master]
GO
/****** Object:  Database [OriginXDB]    Script Date: 5/19/2015 10:47:21 PM ******/
CREATE DATABASE [OriginXDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OriginXDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OriginXDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OriginXDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OriginXDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OriginXDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OriginXDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OriginXDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OriginXDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OriginXDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OriginXDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OriginXDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OriginXDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OriginXDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OriginXDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OriginXDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OriginXDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OriginXDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OriginXDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OriginXDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OriginXDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OriginXDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OriginXDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OriginXDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OriginXDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OriginXDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OriginXDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OriginXDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OriginXDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OriginXDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OriginXDB] SET  MULTI_USER 
GO
ALTER DATABASE [OriginXDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OriginXDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OriginXDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OriginXDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OriginXDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OriginXDB]
GO
/****** Object:  Table [dbo].[countrybranch]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[countrybranch](
	[CBid] [int] IDENTITY(1,1) NOT NULL,
	[coutrybranchcode] [varchar](50) NULL,
	[branchcity] [varchar](50) NULL,
	[branchadmin] [varchar](50) NULL,
	[branchdesc] [varchar](50) NULL,
 CONSTRAINT [PK_countrybranch] PRIMARY KEY CLUSTERED 
(
	[CBid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[phoneno1] [int] NULL,
	[phoneno2] [int] NULL,
	[clientlogo] [varchar](50) NULL,
	[additionalinfo] [varchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[deliveries]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deliveries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deliveryid] [varchar](50) NULL,
	[sendclientid] [int] NULL,
	[reciveclientid] [int] NULL,
	[startdate] [date] NULL,
	[sentdate] [date] NOT NULL,
	[enddate] [date] NOT NULL,
	[restartdateid] [date] NOT NULL,
	[countrybranchid] [int] NOT NULL,
	[worldbranchid] [int] NOT NULL,
	[salespersonid] [int] NULL,
	[deliverypersonid] [int] NOT NULL,
 CONSTRAINT [PK_deliveries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[nic] [int] NULL,
	[mobile] [int] NULL,
	[address] [varchar](50) NULL,
	[position] [varchar](50) NULL,
	[basicsalary] [money] NULL,
	[bonus] [money] NULL,
	[userimage] [varchar](50) NULL,
	[hiredate] [date] NULL,
	[department] [varchar](50) NULL,
	[birthday] [date] NULL,
	[sex] [varchar](50) NULL,
	[phoneno1] [int] NULL,
	[phoneno2] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[user_level] [int] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[itemdetails]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itemdetails](
	[id] [int] NOT NULL,
	[itemcode] [varchar](50) NULL,
	[itemweight] [varchar](50) NULL,
	[itemdesc] [varchar](50) NULL,
 CONSTRAINT [PK_itemdetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[officeworldwide]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[officeworldwide](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[officename] [varchar](50) NULL,
	[officecountry] [varchar](50) NULL,
	[officeadmin] [varchar](50) NULL,
	[officedesc] [varchar](50) NULL,
 CONSTRAINT [PK_officeworldwide] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payments]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payments](
	[id] [int] NOT NULL,
	[paymenttype] [varchar](50) NULL,
	[paymentdesc] [varchar](50) NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registrationkey]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registrationkey](
	[registrationKeyid] [int] IDENTITY(1,1) NOT NULL,
	[registrationKey] [varchar](50) NULL,
 CONSTRAINT [PK_registrationkey] PRIMARY KEY CLUSTERED 
(
	[registrationKeyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Send_Receive]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Send_Receive](
	[customer_ID] [nchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[send_receive] [nvarchar](1) NULL,
 CONSTRAINT [PK_Send_Receive] PRIMARY KEY CLUSTERED 
(
	[customer_ID] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[addCountryBranch]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addCountryBranch]
@coutrybranchcode varchar(50),
@branchcity varchar(50),
@branchadmin varchar(50),
@branchdesc varchar(50)

AS 

INSERT INTO countrybranch
           (coutrybranchcode
           ,branchcity
           ,branchadmin
           ,branchdesc)
     VALUES
           (@coutrybranchcode,@branchcity,@branchadmin,@branchdesc);
	Return 0

GO
/****** Object:  StoredProcedure [dbo].[addCustomer]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addCustomer]
	@name varchar(50),
	@address varchar(50),
	@type varchar(50),
	@phoneno1 int,
	@phoneno2 int,
	@clientlogo varchar(50),
	@additionalinfo varchar(50)

AS
	INSERT INTO customers(
	name,
	address,
	type,phoneno1,
	phoneno2,
	clientlogo,
	additionalinfo) 
	
	VALUES (@name,@address,@type,@phoneno1,@phoneno2,@clientlogo,@additionalinfo);
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[addemployees]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addemployees]
	@name varchar(50),
	@nic int,
	@mobile int,
	@address varchar(50),
	@position varchar(50),
	@basicsalary int,
	@bonus int,
	@userimage varchar(50),
	@hiredate date,
	@department varchar(50),
	@birthday date,
	@sex varchar(50),
	@phoneno1 int,
	@phoneno2 int,
	@username varchar(50),
	@password varchar(50),
	@user_level int

AS
	INSERT INTO employee(
	[name],[nic],[mobile],[address],[position],[basicsalary],[bonus], [userimage],[hiredate], [department],
    [birthday],[sex],[phoneno1],[phoneno2],username,password,user_level	) 

VALUES (@name,@nic,@mobile,@address,@position,@basicsalary,@bonus,@userimage,@hiredate,@department,@birthday,
@sex,@phoneno1,@phoneno2, @username,@password,@user_level);

RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[addWorldOffice]    Script Date: 5/19/2015 10:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addWorldOffice]
@officename varchar(50),
@officecountry varchar(50),
@officeadmin varchar(50),
@officedesc varchar(50) 

AS

INSERT INTO officeworldwide (officename,officecountry,officeadmin,officedesc)
values (@officename,@officecountry,@officeadmin,@officedesc) 

GO
USE [master]
GO
ALTER DATABASE [OriginXDB] SET  READ_WRITE 
GO
