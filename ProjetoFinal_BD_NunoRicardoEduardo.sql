CREATE SCHEMA PF
GO

CREATE TABLE PF.Fornecedores
(
    CodigoFornecedor  int NOT NULL,
    Nome varchar(50) NOT NULL,
	CodigoEncomenda int NOT NULL,
	Telefone varchar(9) NOT NULL,
	PRIMARY KEY(CodigoEncomenda)
);
GO


CREATE TABLE PF.Categoria
(
	CodigoCategoria int NOT NULL,
    Designacao varchar(50) NOT NULL,
	PRIMARY KEY(CodigoCategoria)
);
GO

CREATE TABLE PF.Produtos
(
    CodigoProduto int NOT NULL,
    Designacao varchar(50) NOT NULL,
	CodigoEncomenda int NOT NULL,
	CodigoCategoria int NOT NULL,
	Preço int NOT NULL,
	CodigoOrigem int NOT NULL,
	PRIMARY KEY(CodigoProduto),
	FOREIGN KEY(CodigoCategoria) REFERENCES PF.Categoria(CodigoCategoria),
	FOREIGN KEY(CodigoEncomenda) REFERENCES PF.Fornecedores(CodigoEncomenda),
	FOREIGN KEY(CodigoOrigem) REFERENCES PF.Origem(CodigoOrigem)

);
GO

CREATE TABLE PF.Funcao
(
	CodigoFuncao int NOT NULL,
	Designacao varchar(50) NOT NULL,
	PRIMARY KEY(CodigoFuncao)
)
GO

CREATE TABLE PF.Colaboradores
(
	NumID int NOT NULL,
	Nome varchar(50) NOT NULL,
	Telefone varchar(9) NOT NULL,
	CodigoFuncao int NOT NULL
	PRIMARY KEY(NumID), 
	FOREIGN KEY(CodigoFuncao) REFERENCES PF.Funcao(CodigoFuncao)
);
GO

CREATE TABLE PF.Clientes
(
	NIF varchar(8) NOT NULL,
	Nome varchar(50) NOT NULL,
	PRIMARY KEY(NIF)
)
GO

CREATE TABLE PF.Fatura
(
	CodigoFatura int NOT NULL,
	NIF varchar(8) NOT NULL,
	DataFatura date NOT NULL,
	PRIMARY KEY(CodigoFatura)
)
GO

CREATE TABLE PF.Venda
(
	CodigoVenda int NOT NULL,
	CodigoFatura int NOT NULL,
	CodigoProduto int NOT NULL,
	NIF varchar(8) NOT NULL,
	NumID int NOT NULL,
	Valor decimal NOT NULL,
	CodigoTipoPag int NOT NULL,
	PRIMARY KEY(CodigoVenda),
	FOREIGN KEY(CodigoFatura) REFERENCES PF.Fatura(CodigoFatura),
	FOREIGN KEY(CodigoProduto) REFERENCES PF.Produtos(CodigoProduto),
	FOREIGN KEY(NIF) REFERENCES PF.Clientes(NIF),
	FOREIGN KEY(NumID) REFERENCES PF.Colaboradores(NumID),
	FOREIGN KEY(CodigoTipoPag) REFERENCES PF.TipoPagamento(CodigoTipoPag)

)
GO

CREATE TABLE PF.Origem
	(
	CodigoOrigem int,
	País varchar(30)
	PRIMARY KEY(CodigoOrigem) 
)
GO


CREATE TABLE PF.TipoPagamento
(	CodigoTipoPag int,
	TipoPag varchar(50)
	PRIMARY KEY(CodigoTipoPag)
)
GO

INSERT INTO PF.Produtos(CodigoProduto, Designacao, CodigoEncomenda, CodigoCategoria, Preço, CodigoOrigem)
VALUES
	('1','Pão',1,1, '1',1),        
	('2','Arroz',2,1, '2',1),
	('3','Massa',3,1, '2',1),
	('4','Detergente para Roupa', 4,2, '7',1),
	('5','Champô', 4,3, '5',2),
	('6','Laranja',1,4, '1',3),
	('7','Tomate', 1,4, '1',1),
	('8','Alface',1, 4, '2',1),
	('9','Manteiga',2,6, '3',4),
	('10','Vinho',3, 7, '10',1),
	('11','Sumo',3, 7, '2',4),
	('12','Melancia',1, 4, '3',1),
	('13','Água',3, 7, '1',1),
	('14','Sabão',4, 3, '2',1),
	('15','Fiambre',1, 6, '3',1),
	('16','Leite',2, 1, '4',1),
	('17','Cerveja',3, 7, '9',4),
	('18','Gelados',2, 5, '3',1),
	('19','Queijo',2, 6, '6',1),
	('20','Kiwi',1, 4, '3',2),
	('21','Batatas',1,1,'3',7)
GO
	
INSERT INTO PF.Categoria(CodigoCategoria, Designacao)
VALUES
	('1','Produtos Básicos'),
	('2','Produtos de Limpeza'),
	('3','Produtos Higiene Pessoal'),
	('4','Frutas e Legumes'),
	('5','Congelados'),
	('6','Charcutaria'),
	('7','Bebidas')
GO


INSERT INTO PF.Fornecedores(CodigoFornecedor, Nome, CodigoEncomenda, Telefone)
VALUES
	('1','José Manuel','1','913456789'),
	('2','André Eduardo','2','913321049'),
	('3','Fernando Gomes','3','913498749'),
	('4','Clara Castro','4','913006789')
GO


INSERT INTO PF.Funcao(CodigoFuncao,	Designacao)
VALUES 
	('1', 'Atendimento ao público'),
	('2', 'Manutenção'),
	('3', 'Reposição dos produtos'),
	('4', 'Encomendas')
GO

INSERT INTO PF.Colaboradores(NumID,	Nome, Telefone,	CodigoFuncao)
VALUES 
	('1', 'Nuno', '912342342', 4),
	('2', 'Eduardo', '910123234', 1),
	('3', 'Ricardo', '912987321', 2),
	('4', 'Maria', '939890760', 3)
GO

INSERT INTO PF.Fatura(CodigoFatura, NIF, DataFatura)
VALUES 
	('1', 12345678, ''),
	('2', 87654321, ''),
	('3', 32165490, ''),
	('4', 90845673, '')
GO

INSERT INTO PF.Clientes(NIF, Nome)
VALUES 
	('12345678', 'Pierre'),
	('87654321', 'Gustavo'),
	('32165490', 'Telma'),
	('90845673', 'Raquel')
GO

INSERT INTO PF.Venda(CodigoVenda, CodigoFatura, CodigoProduto, NIF, NumID, Valor, CodigoTipoPag)
VALUES
	('1',1, 2, 12345678, 2, 0,1),
	('2',1, 15, 12345678, 2, 0,1),
	('3',1, 4, 12345678, 2, 0,1),
	('4',1, 5, 12345678, 2, 0,1),
	('5',1, 10, 12345678, 2, 0,1),
	('6',2, 10, 87654321, 1, 0,3),
	('7',3, 17, 32165490, 3, 0,4),
	('8',3, 9, 32165490, 3, 0,4),
	('9',4, 12, 90845673, 3, 0,2)

	
GO




INSERT INTO PF.TipoPagamento
VALUES
	('1','Numerário'),
	('2','Multibanco'),
	('3','MBWay'),
	('4','Cheque')
GO


INSERT INTO PF.Origem
VALUES
	('1','Portugal'),
	('2','México'),
	('3','Espanha'),
	('4','Inglaterra')
GO

/*Criámos uma vista para saber quantas vezes cada cliente comprou produtos do minimercado*/

CREATE VIEW ClientesVezesLoja
AS
SELECT 
	count(DISTINCT V.NIF) AS [Número de Idas],
	C.Nome AS Nome

FROM PF.Venda AS V
INNER JOIN PF.Clientes AS C ON C.NIF = V.NIF
GROUP BY Nome
GO

/*Criámos uma vista para ver o preço dos produtos por ordem crescente de custo*/

CREATE VIEW VerProdutoPreço
AS
SELECT 
	P.Designacao AS Produto,
	P.Preço AS Preço
	
FROM PF.Produtos AS P
GO

/*Criámos uma vista para saber quantos produtos foram comprados em cada venda*/

CREATE VIEW NrProdutosVenda
AS
SELECT 
	V.CodigoFatura AS [Número de Venda],
	count(CodigoVenda) AS [Número de Produtos],
	C.Nome AS Nome

FROM PF.Venda AS V
INNER JOIN PF.Clientes AS C ON C.NIF = V.NIF
GROUP BY CodigoFatura, Nome
GO

/*Criámos uma vista para saber o número de produto por encomendas com nome do fornecedor  */

CREATE VIEW NrProdutosEncomenda
AS
SELECT 
	P.CodigoEncomenda AS [Número da Encomenda],
	count(P.CodigoEncomenda) AS [Número de Produtos],
	F.Nome AS Nome
FROM PF.Produtos AS P
INNER JOIN PF.Fornecedores AS F ON F.CodigoEncomenda = P.CodigoEncomenda
GROUP BY Nome, P.CodigoEncomenda
GO

/*Criámos uma vista para mostrar as funções de cada colaborador  */

CREATE VIEW FuncoesColaborador
AS
SELECT 
	C.Nome AS Nome,
	F.Designacao AS Função
	
FROM PF.Funcao AS F
INNER JOIN PF.Colaboradores AS C ON C.CodigoFuncao = F.CodigoFuncao
GO


/*Criámos um trigger para adicionar a data à fatura */

CREATE TRIGGER PF.[TRG_LogData]  ON PF.Fatura FOR UPDATE
AS
BEGIN
	DECLARE @Data datetime2(7)
	SET @Data = GETDATE()
	INSERT INTO PF.Fatura(DataFatura)
	VALUES (@Data)
END
GO


/*Criámos um trigger para adicionar mais um produto */
CREATE TRIGGER PF.[TRG_AdicionaMaisUm] ON PF.Produtos FOR Insert
AS
BEGIN
	DECLARE
	@CodigoProduto int,
	@CodigoEncomenda int,
	@Descricao varchar(30),
	@CodigoCategoria int,
	@CodigoOrigem int,
	@Preço int,
	@NumeroProdutos int

	SELECT 
		@CodigoProduto = CodigoProduto
		,@CodigoEncomenda= CodigoEncomenda
		,@Descricao = Designacao
		,@CodigoCategoria = CodigoCategoria
		,@CodigoOrigem = CodigoOrigem
		,@Preço = Preço
	FROM INSERTED

	SELECT @NumeroProdutos = COUNT(CodigoProduto) FROM pf.Produtos
	WHERE CodigoProduto = @CodigoProduto AND  @CodigoEncomenda= CodigoEncomenda AND @Descricao = Designacao
		AND @CodigoCategoria = CodigoCategoria	AND @CodigoOrigem = CodigoOrigem AND @Preço = Preço

	UPDATE PF.Produtos 
	SET CodigoProduto = @NumeroProdutos + 1
	WHERE CodigoProduto = @CodigoProduto AND  @CodigoEncomenda= CodigoEncomenda AND @Descricao = Designacao
		AND @CodigoCategoria = CodigoCategoria	AND @CodigoOrigem = CodigoOrigem AND @Preço = Preço 
END
GO

/*Criámos um trigger para validar uma categoria */

CREATE TRIGGER PF.TRG__Validar ON PF.Categoria INSTEAD OF INSERT
AS
BEGIN
	/*tenho a informação introduzida na tabela inserted*/
	DECLARE @Designacao varchar(20)

	SELECT @Designacao = Designacao FROM inserted

	/*verificar se o valor de designação é válida*/	
	IF @Designacao IN ('Produtos Básicos','Produtos de Limpeza','Produtos Higiene Pessoal',
	'Frutas e Legumes','Congelados','Charcutaria','Bebidas')
	/* se a designação for válida, fazer o insert*/
		INSERT INTO PF.Categoria(Designacao)
			SELECT @Designacao FROM inserted
	ELSE
		/*apresentar o erro */
		PRINT 'A designação inserida não é válida'
END
GO

/*Criámos um stored procedure para colocar o valor do produto na venda */

CREATE PROCEDURE PF.Valor
AS 
UPDATE PF.Venda 
SET Valor = P.Preço
FROM PF.Venda AS V
INNER JOIN PF.Produtos AS P ON P.CodigoProduto = V.CodigoProduto
GO

/*Criámos um stored procedure para saber o valor total da venda */


CREATE PROCEDURE PF.ValorTotal   
AS
    SELECT SUM(Valor) AS [Preço Total], CodigoFatura

	FROM PF.Venda
	GROUP BY CodigoFatura
RETURN 0
GO

/*Criámos um stored procedure para saber o valor mais alto da venda de cada cliente */

CREATE PROCEDURE PF.ProdutoMaisCaro
AS
SELECT MAX(Valor) AS [Preço mais alto], C.Nome , CodigoFatura AS Venda
FROM PF.Venda AS V
INNER JOIN PF.Clientes AS C ON C.NIF = V.NIF
GROUP BY C.Nome, CodigoFatura
GO

