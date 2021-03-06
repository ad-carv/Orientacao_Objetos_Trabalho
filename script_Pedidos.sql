USE [master]
GO
/****** Object:  Database [BancoTrabalho]    Script Date: 5/24/2019 8:12:47 PM ******/
CREATE DATABASE [BancoTrabalho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BancoTrabalho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BancoTrabalho.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BancoTrabalho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BancoTrabalho_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BancoTrabalho] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BancoTrabalho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BancoTrabalho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BancoTrabalho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BancoTrabalho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BancoTrabalho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BancoTrabalho] SET ARITHABORT OFF 
GO
ALTER DATABASE [BancoTrabalho] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BancoTrabalho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BancoTrabalho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BancoTrabalho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BancoTrabalho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BancoTrabalho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BancoTrabalho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BancoTrabalho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BancoTrabalho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BancoTrabalho] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BancoTrabalho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BancoTrabalho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BancoTrabalho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BancoTrabalho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BancoTrabalho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BancoTrabalho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BancoTrabalho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BancoTrabalho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BancoTrabalho] SET  MULTI_USER 
GO
ALTER DATABASE [BancoTrabalho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BancoTrabalho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BancoTrabalho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BancoTrabalho] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BancoTrabalho] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BancoTrabalho] SET QUERY_STORE = OFF
GO
USE [BancoTrabalho]
GO
/****** Object:  Table [dbo].[Despacho]    Script Date: 5/24/2019 8:12:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despacho](
	[id] [int] NOT NULL,
	[pedidoId] [int] NOT NULL,
	[transportadoraId] [int] NOT NULL,
	[enderecoEntregaId] [varchar](256) NOT NULL,
	[dataDespacho] [date] NOT NULL,
 CONSTRAINT [PK_Despacho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalhesPedido]    Script Date: 5/24/2019 8:12:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalhesPedido](
	[id] [int] NOT NULL,
	[pedidoId] [int] NOT NULL,
	[produtoId] [int] NOT NULL,
	[qauntidade] [int] NOT NULL,
	[precoUnitario] [real] NOT NULL,
	[desconto] [real] NOT NULL,
 CONSTRAINT [PK_DetalhesPedido] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 5/24/2019 8:12:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NOT NULL,
	[funcionatioId] [int] NOT NULL,
	[dataPedido] [date] NOT NULL,
	[dataPagamento] [date] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPagamento]    Script Date: 5/24/2019 8:12:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPagamento](
	[id] [int] NOT NULL,
	[tipoPag] [varchar](256) NOT NULL,
 CONSTRAINT [PK_TipoPagamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [BancoTrabalho] SET  READ_WRITE 
GO
