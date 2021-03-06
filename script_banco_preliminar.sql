USE [master]
GO
/****** Object:  Database [OO_Banco_Preliminar]    Script Date: 05/06/2019 19:36:36 ******/
CREATE DATABASE [OO_Banco_Preliminar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OO_Banco_Preliminar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OO_Banco_Preliminar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OO_Banco_Preliminar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OO_Banco_Preliminar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OO_Banco_Preliminar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OO_Banco_Preliminar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ARITHABORT OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET  MULTI_USER 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OO_Banco_Preliminar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OO_Banco_Preliminar] SET QUERY_STORE = OFF
GO
USE [OO_Banco_Preliminar]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/06/2019 19:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] NOT NULL,
	[nomeCateg] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/06/2019 19:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pessoaid] [int] NOT NULL,
	[dataNasc] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContatoFornecedor]    Script Date: 05/06/2019 19:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContatoFornecedor](
	[id] [int] NOT NULL,
	[fornecedorId] [int] NOT NULL,
	[tipoFoneId] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[sobrenome] [varchar](50) NULL,
	[departamento] [varchar](50) NULL,
	[cargo] [varchar](50) NULL,
	[fone] [varchar](50) NOT NULL,
	[ramal] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Despacho]    Script Date: 05/06/2019 19:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despacho](
	[id] [int] NOT NULL,
	[pedidoId] [int] NOT NULL,
	[transportadoraId] [int] NOT NULL,
	[enderecoEntregaId] [int] NOT NULL,
	[dataDespacho] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalhesPedido]    Script Date: 05/06/2019 19:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalhesPedido](
	[id] [int] NOT NULL,
	[pedidoId] [int] NOT NULL,
	[produtoId] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precoUnitario] [real] NOT NULL,
	[desconto] [real] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnderecoEntrega]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnderecoEntrega](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientid] [int] NOT NULL,
	[endereco1] [varchar](255) NOT NULL,
	[endereco2] [varchar](255) NULL,
	[cidade] [varchar](15) NOT NULL,
	[estado] [varchar](15) NOT NULL,
	[pais] [varchar](10) NULL,
	[cep] [varchar](15) NULL,
	[horario] [varchar](10) NULL,
	[pontoReferencia] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[id] [int] NOT NULL,
	[produtoId] [int] NOT NULL,
	[quantidade] [int] NULL,
	[local] [nchar](10) NOT NULL,
	[estoqueMinimo] [int] NOT NULL,
 CONSTRAINT [PK_Estoque] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoneFornecedor]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoneFornecedor](
	[id] [int] NOT NULL,
	[fornecedorId] [int] NOT NULL,
	[tipoFoneId] [int] NOT NULL,
	[numero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FoneFornecedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FonePessoa]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FonePessoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pessoaid] [int] NOT NULL,
	[tipofoneid] [int] NOT NULL,
	[numero] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fornecedores]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
	[id] [int] NOT NULL,
	[CNPJ] [varchar](50) NOT NULL,
	[razaoSocial] [varchar](50) NOT NULL,
	[nomeFantasia] [varchar](50) NULL,
	[inscricaoEstadual] [varchar](50) NULL,
	[email] [varchar](50) NOT NULL,
	[endereco1] [varchar](256) NOT NULL,
	[endereco2] [varchar](256) NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[CEP] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Fornecedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pessoaid] [int] NOT NULL,
	[dataNasc] [varchar](10) NOT NULL,
	[CTPS] [varchar](50) NOT NULL,
	[PIS] [varchar](50) NOT NULL,
	[regimeContrato] [varchar](20) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[tipoSalario] [varchar](20) NOT NULL,
	[salario] [real] NOT NULL,
	[cargatrabalho] [varchar](10) NOT NULL,
	[horario] [varchar](5) NOT NULL,
	[_status] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginCli]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginCli](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clientid] [int] NOT NULL,
	[usuario] [varchar](15) NOT NULL,
	[senha] [varchar](10) NOT NULL,
	[old] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginFunc]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginFunc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[funcionarioid] [int] NOT NULL,
	[logName] [varchar](20) NOT NULL,
	[senha] [varchar](10) NOT NULL,
	[old] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 05/06/2019 19:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NOT NULL,
	[funcionarioId] [int] NOT NULL,
	[tipoPagId] [int] NOT NULL,
	[dataPedido] [date] NOT NULL,
	[dataPagamento] [date] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 05/06/2019 19:36:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
	[rg] [varchar](10) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[endereco1] [varchar](255) NOT NULL,
	[endereco2] [varchar](255) NULL,
	[cidade] [varchar](50) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[cep] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 05/06/2019 19:36:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[id] [int] NOT NULL,
	[fornecedorId] [int] NOT NULL,
	[categoriaId] [int] NOT NULL,
	[codigoProduto] [nvarchar](50) NULL,
	[nomeProduto] [nvarchar](50) NOT NULL,
	[descricao] [nvarchar](50) NULL,
	[custo] [real] NOT NULL,
	[precoLista] [real] NULL,
	[unidade] [nchar](2) NOT NULL,
	[discontinuado] [bit] NOT NULL,
	[quantMinima] [real] NOT NULL,
	[comentario] [text] NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoFone]    Script Date: 05/06/2019 19:36:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoFone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPagamento]    Script Date: 05/06/2019 19:36:40 ******/
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
/****** Object:  Table [dbo].[Transportadoras]    Script Date: 05/06/2019 19:36:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportadoras](
	[id] [int] NOT NULL,
	[foenecedorId] [int] NOT NULL,
	[cobertura] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transportadoras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [OO_Banco_Preliminar] SET  READ_WRITE 
GO
