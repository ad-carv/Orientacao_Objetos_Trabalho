CREATE TABLE Pessoa
	(
	id int NOT NULL primary key IDENTITY(1,1),
	nome varchar(50) NOT NULL,
	cpf varchar(11) NOT NULL,
	rg varchar(10) NOT NULL,
	email varchar(100) NOT NULL,
	endereco1 varchar(255) NOT NULL,
	endereco2 varchar(255) NULL,
	cidade varchar(50) NOT NULL,
	estado varchar(50) NOT NULL,
	pais varchar(50) NOT NULL,
	cep varchar(50) NOT NULL
	);

create table FonePessoa
(
id int NOT NULL primary key IDENTITY(1,1),
pessoaid int not null,
tipofoneid int not null,
numero varchar(50)
);

create table TipoFone
(
id int NOT NULL primary key IDENTITY(1,1),
tipo varchar(20)
);

Create table Funcionario
(
id int NOT NULL primary key IDENTITY(1,1),
pessoaid int not null,
dataNasc varchar(10) not null,
CTPS varchar(50) not null,
PIS varchar(50) not null,
regimeContrato varchar(20) not null,
cargo varchar(50) not null,
tipoSalario varchar(20) not null,
salario real not null,
cargatrabalho varchar(10) not null,
horario varchar(5) not null,
_status varchar(15) not null
)
create table LoginFunc
(
id int NOT NULL primary key IDENTITY(1,1),
funcionarioid int not null,
logName varchar(20) not null,
senha varchar(10) not null,
old bit not null
)

create table Cliente 
(
id int NOT NULL primary key IDENTITY(1,1),
pessoaid int not null,
dataNasc varchar(10)
);

create table LoginCli
(
id int NOT NULL primary key IDENTITY(1,1),
clientid int not null,
usuario varchar(15) not null,
senha varchar(10) not null,
old bit not null
);

create table EnderecoEntrega
(
id int NOT NULL primary key IDENTITY(1,1),
clientid int not null,
endereco1 varchar(255) not null,
endereco2 varchar(255),
cidade varchar(15) not null,
estado varchar(15) not null,
pais varchar(10),
cep varchar(15),
horario varchar(10),
pontoReferencia varchar(15)
);





