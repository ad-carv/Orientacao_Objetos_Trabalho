USE [master]
GO
/****** Object:  Database [Banco_Simplificado]    Script Date: 07/06/2019 12:10:23 ******/
DROP DATABASE IF EXISTS [Banco_Simplificado]
GO
CREATE DATABASE [Banco_Simplificado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banco_Simplificado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Banco_Simplificado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Banco_Simplificado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Banco_Simplificado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Banco_Simplificado] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banco_Simplificado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banco_Simplificado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banco_Simplificado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banco_Simplificado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banco_Simplificado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banco_Simplificado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Banco_Simplificado] SET  MULTI_USER 
GO
ALTER DATABASE [Banco_Simplificado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banco_Simplificado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banco_Simplificado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banco_Simplificado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Banco_Simplificado] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Banco_Simplificado] SET QUERY_STORE = OFF
GO
USE [Banco_Simplificado]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 07/06/2019 12:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nomeCateg] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 07/06/2019 12:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[sobrenome] [varchar](50) NOT NULL,
	[cpf] [varchar](12) NOT NULL,
	[rg] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fone] [varchar](50) NOT NULL,
	[endereco1] [varchar](50) NOT NULL,
	[endereco2] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[cep] [varchar](50) NOT NULL,
	[dataNasc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Despacho]    Script Date: 07/06/2019 12:10:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despacho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pedidoid] [int] NOT NULL,
	[transportadoraid] [int] NOT NULL,
	[clientid] [int] NOT NULL,
	[dataDespacho] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Despacho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalhesPedidos]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalhesPedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pedidoid] [int] NOT NULL,
	[produtoid] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precoUnitario] [float] NOT NULL,
	[desconto] [float] NOT NULL,
 CONSTRAINT [PK_DetalhesPedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[produtoid] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[local] [varchar](50) NOT NULL,
	[estoqueMinimo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estoque] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[id] [int] IDENTITY(500,1) NOT NULL,
	[CNPJ] [varchar](50) NOT NULL,
	[razaoSocial] [varchar](50) NOT NULL,
	[nomeFantasia] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fone] [varchar](50) NOT NULL,
	[contato] [varchar](50) NOT NULL,
	[endereco1] [varchar](50) NOT NULL,
	[endereco2] [varchar](50) NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[cep] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Fornecedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[id] [int] IDENTITY(200,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[sobrenome] [varchar](50) NOT NULL,
	[CPF] [varchar](20) NOT NULL,
	[RG] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[fone] [varchar](50) NOT NULL,
	[endereco1] [varchar](50) NOT NULL,
	[endereco2] [varchar](50) NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[cep] [varchar](50) NOT NULL,
	[dataNasc] [varchar](50) NOT NULL,
	[PIS] [varchar](50) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[salario] [float] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Funcionario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginCli]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginCli](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clienteid] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varbinary](50) NOT NULL,
	[old] [bit] NOT NULL,
 CONSTRAINT [PK_LoginCli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginFunc]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginFunc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[funcionarioid] [int] NOT NULL,
	[logName] [varchar](50) NOT NULL,
	[senha] [varchar](50) NOT NULL,
	[old] [bit] NOT NULL,
 CONSTRAINT [PK_LoginFunc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientid] [int] NOT NULL,
	[funcionarioid] [int] NOT NULL,
	[tipoPagid] [int] NOT NULL,
	[dataPedido] [varchar](50) NOT NULL,
	[dataPagamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[fornecedorid] [int] NOT NULL,
	[categoraid] [int] NOT NULL,
	[codigoProduto] [varchar](50) NOT NULL,
	[nomeProduto] [varchar](50) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[custo] [float] NOT NULL,
	[precoList] [float] NOT NULL,
	[unidade] [int] NOT NULL,
	[descontinuado] [bit] NOT NULL,
	[comentario] [varchar](50) NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPagamento]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPagamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoPag] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPagamento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportadora]    Script Date: 07/06/2019 12:10:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportadora](
	[id] [int] IDENTITY(600,1) NOT NULL,
	[fornecedorid] [int] NOT NULL,
	[cobertura] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transportadora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Despacho]  WITH CHECK ADD  CONSTRAINT [FK_Despacho_Client] FOREIGN KEY([clientid])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Despacho] CHECK CONSTRAINT [FK_Despacho_Client]
GO
ALTER TABLE [dbo].[Despacho]  WITH CHECK ADD  CONSTRAINT [FK_Despacho_Pedidos] FOREIGN KEY([pedidoid])
REFERENCES [dbo].[Pedidos] ([id])
GO
ALTER TABLE [dbo].[Despacho] CHECK CONSTRAINT [FK_Despacho_Pedidos]
GO
ALTER TABLE [dbo].[Despacho]  WITH CHECK ADD  CONSTRAINT [FK_Despacho_Transportadora] FOREIGN KEY([transportadoraid])
REFERENCES [dbo].[Transportadora] ([id])
GO
ALTER TABLE [dbo].[Despacho] CHECK CONSTRAINT [FK_Despacho_Transportadora]
GO
ALTER TABLE [dbo].[DetalhesPedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetalhesPedidos_Pedidos] FOREIGN KEY([pedidoid])
REFERENCES [dbo].[Pedidos] ([id])
GO
ALTER TABLE [dbo].[DetalhesPedidos] CHECK CONSTRAINT [FK_DetalhesPedidos_Pedidos]
GO
ALTER TABLE [dbo].[DetalhesPedidos]  WITH CHECK ADD  CONSTRAINT [FK_DetalhesPedidos_Produtos] FOREIGN KEY([pedidoid])
REFERENCES [dbo].[Produtos] ([id])
GO
ALTER TABLE [dbo].[DetalhesPedidos] CHECK CONSTRAINT [FK_DetalhesPedidos_Produtos]
GO
ALTER TABLE [dbo].[LoginCli]  WITH CHECK ADD  CONSTRAINT [FK_LoginCli_Client] FOREIGN KEY([clienteid])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[LoginCli] CHECK CONSTRAINT [FK_LoginCli_Client]
GO
ALTER TABLE [dbo].[LoginFunc]  WITH CHECK ADD  CONSTRAINT [FK_LoginFunc_Funcionario] FOREIGN KEY([funcionarioid])
REFERENCES [dbo].[Funcionario] ([id])
GO
ALTER TABLE [dbo].[LoginFunc] CHECK CONSTRAINT [FK_LoginFunc_Funcionario]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK_Produtos_Categoria] FOREIGN KEY([categoraid])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK_Produtos_Categoria]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK_Produtos_Fornecedores] FOREIGN KEY([fornecedorid])
REFERENCES [dbo].[Fornecedores] ([id])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK_Produtos_Fornecedores]
GO
ALTER TABLE [dbo].[Transportadora]  WITH CHECK ADD  CONSTRAINT [FK_Transportadora_Fornecedores] FOREIGN KEY([fornecedorid])
REFERENCES [dbo].[Fornecedores] ([id])
GO
ALTER TABLE [dbo].[Transportadora] CHECK CONSTRAINT [FK_Transportadora_Fornecedores]
GO
ALTER TABLE [dbo].[Estoque]  WITH CHECK ADD  CONSTRAINT [FK_Estoque_Produtos] FOREIGN KEY([Produtoid])
REFERENCES [dbo].[Produtos] ([id])
GO
ALTER TABLE [dbo].[Estoque] CHECK CONSTRAINT [FK_Estoque_Produtos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Client] FOREIGN KEY([Clientid])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Client]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Funcionario] FOREIGN KEY([funcionarioid])
REFERENCES [dbo].[Funcionario] ([id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Funcionario]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_TipoPagamento] FOREIGN KEY([tipoPagid])
REFERENCES [dbo].[TipoPagamento] ([id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_TipoPagamento]
GO
USE [master]
GO
ALTER DATABASE [Banco_Simplificado] SET  READ_WRITE 
GO
