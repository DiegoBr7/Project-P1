-- TABELA USUARIO
CREATE TABLE T_SIP_USUARIO(
nm_user         VARCHAR2(60)    NOT NULL ,
cd_usuario      NUMBER(3)       NOT NULL,
cpf             VARCHAR2(14)    NOT NULL,
dt_nascimento   DATE            NOT NULL,
sexo            CHAR(1)         NOT NULL,
ds_email        VARCHAR2(50)    NOT NULL,
ds_profissao    VARCHAR2(25)    NOT NULL,
vl_salario      NUMBER(10,2)    NOT NULL,
senha           VARCHAR2(20)    NOT NULL
);

ALTER TABLE T_SIP_USUARIO
ADD CONSTRAINT PK_SIP_USUARIO PRIMARY KEY(CD_USUARIO);

ALTER TABLE T_SIP_USUARIO
ADD CONSTRAINT CK_SIP_SEXO CHECK (sexo = 'M' OR sexo = 'F' OR sexo = 'I');
-- M:asculino , F:eminino , I:ndefinido

ALTER TABLE T_SIP_USUARIO
ADD CONSTRAINT UN_SIP_CPF UNIQUE(CPF);

ALTER TABLE T_SIP_USUARIO
ADD CONSTRAINT UN_EMAIL_USUARIO UNIQUE(ds_email);

-- TABELA ENDERECO
CREATE TABLE T_SIP_ENDERECO(
cd_endereco     NUMBER(3)       NOT NULL,
ds_logradouro   VARCHAR2(11)    NULL,
cep             VARCHAR2(9)     NOT NULL,
nm_rua          VARCHAR2(40)    NOT NULL,
nm_bairro       VARCHAR2(30)    NOT NULL,
nm_cidade       VARCHAR2(30)    NOT NULL,
nm_estado       VARCHAR2(2)     NOT NULL,
nr_imovel       VARCHAR(8)      NOT NULL,
cd_usuario      NUMBER(3)       NOT NULL
);

ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT PK_SIP_ENDERECO PRIMARY KEY(CD_ENDERECO);

ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT CK_SIP_END_LOGRADOURO CHECK (ds_logradouro = 'CASA' OR ds_logradouro = 'APARTAMENTO');

ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT CK_SIP_CEP CHECK (LENGTH(cep) = 9);

ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT CK_SIP_END_ESTADO CHECK (nm_estado IN ('AC','AL','AP','AM','BA','CE','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO','DF'));

ALTER TABLE T_SIP_ENDERECO
ADD CONSTRAINT FK_SIP_USUARIO_CD FOREIGN KEY (cd_usuario) 
REFERENCES T_SIP_USUARIO (cd_usuario);

-- TABELA TELEFONE
CREATE TABLE T_SIP_TELEFONE(
cd_telefone     INTEGER         NOT NULL,
ddd             INTEGER         NOT NULL,
nr_telefone     NUMBER(9)       NOT NULL,
cd_usuario      NUMBER(3)       NOT NULL
);

ALTER TABLE T_SIP_TELEFONE
ADD CONSTRAINT UQ_NR_TELEFONE UNIQUE (ddd, nr_telefone);

ALTER TABLE T_SIP_TELEFONE
ADD CONSTRAINT PK_ID_TELEFONE PRIMARY KEY(cd_telefone);


ALTER TABLE T_SIP_TELEFONE
ADD CONSTRAINT FK_SIP_USURIO_TEL FOREIGN KEY (cd_usuario) 
REFERENCES T_SIP_USUARIO (cd_usuario);

-- TABELA BANCO
CREATE TABLE T_SIP_ BANCO( 
cd_banco        NUMBER (3)      NOT NULL, 
id_banco        NUMBER (3)      NOT NULL,
nm_banco        VARCHAR2(15)    NOT NULL,
nr_agencia      VARCHAR2(5)     NOT NULL,
nr_conta        VARCHAR2(15)    NOT NULL,
saldo           NUMBER(10,2)    NOT NULL,
cd_usuario      NUMBER(3)       NOT NULL
);

ALTER TABLE T_SIP_BANCO
ADD CONSTRAINT UQ_NR_AGENCIA_NR_CONTA UNIQUE (nr_agencia, nr_conta);

ALTER TABLE T_SIP_BANCO
ADD CONSTRAINT PK_SIP_BANCO PRIMARY KEY(id_banco);

ALTER TABLE T_SIP_BANCO
ADD CONSTRAINT FK_SIP_USUARIO_BANCO FOREIGN KEY (cd_usuario) 
REFERENCES T_SIP_USUARIO (cd_usuario);

-- TABELA CONTA GERAL
CREATE TABLE T_CONTA(
id_conta         NUMBER(3)     NOT NULL,
id_banco         NUMBER(3)     NOT NULL,
tx_mensalidade   NUMBER(5,2)   NOT NULL,
tipo_conta       VARCHAR2(20)  NOT NULL
);

ALTER TABLE T_CONTA
ADD CONSTRAINT PK_T_CONTA PRIMARY KEY (id_conta);

ALTER TABLE T_CONTA
ADD CONSTRAINT FK_T_CONTA_BANCO FOREIGN KEY (id_banco)
REFERENCES T_SIP_BANCO (id_banco);

ALTER TABLE T_CONTA
ADD CONSTRAINT CK_T_CONTA_TIPO_CONTA CHECK (tipo_conta IN ('CORRENTE', 'POUPANCA', 'SALARIO', 'DIGITAL'));

-- TABELA CONTA INVESTIMENTOS
CREATE TABLE T_CONTA_INVESTIMENTOS(
id_investimento      NUMBER(3)       NOT NULL,
id_banco             NUMBER(3)       NOT NULL,
vl_investido         NUMBER(10,2)    NOT NULL,
rendimento_esperado  NUMBER(5,2)     NOT NULL,
tipo_investimento    VARCHAR2(30)    NOT NULL
);

ALTER TABLE T_CONTA_INVESTIMENTOS
ADD CONSTRAINT PK_T_CONTA_INVESTIMENTOS PRIMARY KEY (id_investimento);

ALTER TABLE T_CONTA_INVESTIMENTOS
ADD CONSTRAINT FK_T_CONTA_INVESTIMENTOS_BANCO FOREIGN KEY (id_banco)
REFERENCES T_SIP_BANCO (id_banco);

ALTER TABLE T_CONTA_INVESTIMENTOS
ADD CONSTRAINT CK_T_CONTA_INVESTIMENTOS_TIPO CHECK (tipo_investimento IN ('RENDA FIXA', 'RENDA VARIÁVEL', 'FUNDOS', 'TESOURO DIRETO'));

-- TABELA CARTAO
CREATE TABLE T_CARTAO_CC(
nr_cartao       VARCHAR2(30)    NOT NULL,
nm_cartao       VARCHAR2(20)    NOT NULL,
dt_exp          DATE            NOT NULL,
nr_seguranca    NUMBER(3)       NOT NULL,
ds_apelido      VARCHAR2(10)    NULL,    
cd_usuario      NUMBER(3)       NOT NULL
);

ALTER TABLE T_CARTAO_CC
ADD CONSTRAINT PK_T_CARTAO_CC PRIMARY KEY(NR_CARTAO);

ALTER TABLE T_CARTAO_CC
ADD CONSTRAINT FK_USUARIO_CARTAO_CC FOREIGN KEY (cd_usuario) 
REFERENCES T_SIP_USUARIO (cd_usuario);


-- TABELA CARTEIRA
CREATE TABLE T_SIP_CARTEIRA(
cd_carteira     NUMBER(3)       NOT NULL,
cd_usuario      NUMBER(3)       NOT NULL,
vl_saldo        NUMBER(10,2)    NOT NULL
);

ALTER TABLE T_SIP_CARTEIRA
ADD CONSTRAINT PK_SIP_CARTEIRA PRIMARY KEY(CD_CARTEIRA);

ALTER TABLE T_SIP_CARTEIRA
ADD CONSTRAINT FK_SIP_USUARIO_CARTEIRA FOREIGN KEY (cd_usuario) 
REFERENCES T_SIP_USUARIO (cd_usuario);

ALTER TABLE T_SIP_CARTEIRA
ADD CONSTRAINT UN_SIP_USUARIO_CARTEIRA UNIQUE(cd_usuario)

-- TABELA TRANSACOES
CREATE TABLE T_SIP_TRANSACOES(
id_transacao     NUMBER(3)      NOT NULL,    
ds_transacao     VARCHAR2(20)   NOT NULL,
cd_carteira      NUMBER(3)      NOT NULL
);

ALTER TABLE T_SIP_TRANSACOES
ADD CONSTRAINT PK_SIP_TRANSACOES PRIMARY KEY(ID_TRANSACAO);

ALTER TABLE T_SIP_TRANSACOES
ADD CONSTRAINT FK_SIP_CARTEIRA_TRANSACOES FOREIGN KEY (cd_carteira) 
REFERENCES T_SIP_CARTEIRA (cd_carteira);

-- TABELA RECEITA
CREATE TABLE T_SIP_RECEITA(
id_receita      INTEGER         NOT NULL,
vl_recebido     NUMBER(10,2)    NOT NULL,
id_transacao    NUMBER(3)       NOT NULL
);

ALTER TABLE T_SIP_RECEITA
ADD CONSTRAINT PK_SIP_RECEITA PRIMARY KEY(ID_RECEITA);

ALTER TABLE T_SIP_RECEITA
ADD CONSTRAINT FK_SIP_TRANSACOES_RECEITA FOREIGN KEY (ID_TRANSACAO) 
REFERENCES T_SIP_TRANSACOES (ID_TRANSACAO);

ALTER TABLE T_SIP_RECEITA
ADD CONSTRAINT UN_SIP_TRANSACAO UNIQUE(ID_TRANSACAO)

ALTER TABLE T_SIP_RECEITA
ADD CONSTRAINT CK_VL_RECEBIDO CHECK(vl_recebido >= 0);

-- TABELA DESPESA
CREATE TABLE T_SIP_DESPESA(
id_despesa      INTEGER         NOT NULL,
vl_retirado     NUMBER(10,2)    NOT NULL,
id_transacao    NUMBER(3)       NOT NULL
);

ALTER TABLE T_SIP_DESPESA
ADD CONSTRAINT PK_SIP_DESPESA PRIMARY KEY(ID_DESPESA);

ALTER TABLE T_SIP_DESPESA
ADD CONSTRAINT FK_SIP_TRANSACOES_DESPESA FOREIGN KEY (ID_TRANSACAO) 
REFERENCES T_SIP_TRANSACOES (ID_TRANSACAO);

ALTER TABLE T_SIP_DESPESA
ADD CONSTRAINT UN_SIP_TRANSACAO_DESPESA UNIQUE(ID_TRANSACAO)

ALTER TABLE T_SIP_DESPESA
ADD CONSTRAINT CK_VL_RETIRADO CHECK(vl_retirado <= 0);


-- Sequência para a tabela de Usuários
CREATE SEQUENCE SQ_T_USUARIO
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Endereços
CREATE SEQUENCE SQ_T_ENDERECO
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Telefone
CREATE SEQUENCE SQ_T_TELEFONE
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Banco
CREATE SEQUENCE SQ_T_BANCO
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela da Conta
CREATE SEQUENCE SQ_T_CONTA
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Carteira
CREATE SEQUENCE SQ_T_CARTEIRA
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Transações
CREATE SEQUENCE SQ_T_TRANSACOES
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Despesa
CREATE SEQUENCE SQ_T_DESPESA
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Receita
CREATE SEQUENCE SQ_T_RECEITA
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- Sequência para a tabela de Investimentos
CREATE SEQUENCE SQ_T_INVESTIMENTOS
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;


-- Drop de Sequencias
DROP SEQUENCE SQ_T_USUARIO
DROP SEQUENCE SQ_T_ENDERECO
DROP SEQUENCE SQ_T_TELEFONE
DROP SEQUENCE SQ_T_BANCO
DROP SEQUENCE SQ_T_CONTA
DROP SEQUENCE SQ_T_CARTEIRA
DROP SEQUENCE SQ_T_TRANSACOES
DROP SEQUENCE SQ_T_DESPESA
DROP SEQUENCE SQ_T_RECEITA
DROP SEQUENCE SQ_T_INVESTIMENTOS
DROP SEQUENCE SQ_T_CARTAO_CC


-- Inserção na tabela T_SIP_USUARIO
DESC T_SIP_USUARIO
INSERT INTO T_SIP_USUARIO (nm_user, cd_usuario, cpf, dt_nascimento, sexo, ds_email, ds_profissao, vl_salario, senha)
VALUES ('Gabriel', SQ_T_USUARIO.NEXTVAL, '481.009.485-23', TO_DATE('03/09/98', 'DD/MM/YY'), 'M', 'gabriel.afm81@gmail.com', 'Uber', 1740.00, 'AmoMinhaMulher'); -- O pós faculdade sempre é virar Uber, principalmente Engenharia

INSERT INTO T_SIP_USUARIO (nm_user, cd_usuario, cpf, dt_nascimento, sexo, ds_email, ds_profissao, vl_salario, senha)
VALUES ('Danilo', SQ_T_USUARIO.NEXTVAL, '480.345.672-09', TO_DATE('07/03/86', 'DD/MM/YY'), 'M', 'danilo.ti@amed.com', 'GarotodePrograma', 1200.00, 'ABCD1234');

SELECT * FROM T_SIP_USUARIO WHERE cd_usuario = 1;
DELETE FROM T_SIP_USUARIO WHERE cd_usuario = 1;


-- Inserção na tabela T_SIP_ENDERECO
DESC T_SIP_ENDERECO
INSERT INTO T_SIP_ENDERECO (cd_endereco, ds_logradouro, cep, nm_rua, nm_bairro, nm_cidade, nm_estado, nr_imovel, cd_usuario)
VALUES (SQ_T_ENDERECO.NEXTVAL, 'CASA', '12345-679', 'Av. Juscelino Kubitschek', 'Assunção', 'São Bernardo', 'SP', '275', 1);

INSERT INTO T_SIP_ENDERECO (cd_endereco, ds_logradouro, cep, nm_rua, nm_bairro, nm_cidade, nm_estado, nr_imovel, cd_usuario)
VALUES (SQ_T_ENDERECO.NEXTVAL, 'APARTAMENTO', '09654-000', 'Av. Robert Kennedy', 'Kennedy', 'São Gonçalo', 'SP', '970', 1);

SELECT * FROM T_SIP_ENDERECO WHERE cd_usuario = 1;
DELETE FROM T_SIP_ENDERECO WHERE cd_endereco = 1;

-- Inserção na tabela T_SIP_TELEFONE
DESC T_SIP_TELEFONE
INSERT INTO T_SIP_TELEFONE (cd_usuario, cd_telefone, ddd, nr_telefone)
VALUES (1, SQ_T_TELEFONE.NEXTVAL, 11, 945074106);

INSERT INTO T_SIP_TELEFONE (cd_usuario, cd_telefone, ddd, nr_telefone)
VALUES (2, SQ_T_TELEFONE.NEXTVAL, 11, 920077201);

SELECT * FROM T_SIP_TELEFONE WHERE cd_usuario = 2;
DELETE FROM T_SIP_TELEFONE WHERE cd_usuario = 1;

-- Inserção na tabela T_SIP_BANCO
DESC T_SIP_BANCO
INSERT INTO T_SIP_BANCO (id_banco, cd_banco, nm_banco, nr_agencia, nr_conta, saldo, cd_usuario)
VALUES (SQ_T_BANCO.NEXTVAL, 2, 'Bradesco', '1', '32340678-0', 1500.00, 15);

INSERT INTO T_SIP_BANCO (id_banco, cd_banco, nm_banco, nr_agencia, nr_conta, saldo, cd_usuario)
VALUES (SQ_T_BANCO.NEXTVAL, 1, 'Nubank', '10', '56345570-1', 1700.00, 2);

SELECT * FROM T_SIP_BANCO WHERE id_banco = 1;
DELETE FROM T_SIP_BANCO WHERE id_banco = 1;

-- Inserção na tabela T_CONTA
DESC T_CONTA
INSERT INTO T_CONTA (id_conta, id_banco, tx_mensalidade, tipo_conta)
VALUES (SQ_T_CONTA.NEXTVAL, 1, 5.00, 'CORRENTE');

INSERT INTO T_CONTA (id_conta, id_banco, tx_mensalidade, tipo_conta)
VALUES (SQ_T_CONTA.NEXTVAL, 2, 5.00, 'SALARIO');

SELECT * FROM T_CONTA WHERE id_banco = 1;
DELETE FROM T_CONTA WHERE id_banco = 1;

-- Inserção na tabela T_CONTA_INVESTIMENTOS
DESC T_CONTA_INVESTIMENTOS
INSERT INTO T_CONTA_INVESTIMENTOS (id_investimento, id_banco, vl_investido, rendimento_esperado, tipo_investimento)
VALUES (SQ_T_INVESTIMENTOS.NEXTVAL, 1, 100, 2.5, 'RENDA FIXA');

INSERT INTO T_CONTA_INVESTIMENTOS (id_investimento, id_banco, vl_investido, rendimento_esperado, tipo_investimento)
VALUES (SQ_T_INVESTIMENTOS.NEXTVAL, 2, 1300, 6.5, 'FUNDOS');

SELECT * FROM T_CONTA_INVESTIMENTOS WHERE id_banco = 1;
DELETE FROM T_CONTA_INVESTIMENTOS WHERE id_banco = 1;

-- Inserção na tabela T_SIP_CARTEIRA
DESC T_SIP_CARTEIRA
INSERT INTO T_SIP_CARTEIRA (cd_carteira, vl_saldo, cd_usuario)
VALUES (SQ_T_CARTEIRA.NEXTVAL, 1000.00, 1);

INSERT INTO T_SIP_CARTEIRA (cd_carteira, vl_saldo, cd_usuario)
VALUES (SQ_T_CARTEIRA.NEXTVAL, 1200.00, 2);

SELECT * FROM T_SIP_CARTEIRA WHERE cd_carteira = 1;
DELETE FROM T_SIP_CARTEIRA WHERE cd_carteira = 1;

-- Inserção na tabela T_SIP_TRANSACOES
DESC T_SIP_TRANSACOES
INSERT INTO T_SIP_TRANSACOES (id_transacao, ds_transacao, cd_carteira)
VALUES (SQ_T_TRANSACOES.NEXTVAL, 'Salario', 1);
INSERT INTO T_SIP_TRANSACOES (id_transacao, ds_transacao, cd_carteira)
VALUES (SQ_T_TRANSACOES.NEXTVAL, 'Conta Luz', 1);
INSERT INTO T_SIP_TRANSACOES (id_transacao, ds_transacao, cd_carteira)
VALUES (SQ_T_TRANSACOES.NEXTVAL, 'Agiotagem', 2);
INSERT INTO T_SIP_TRANSACOES (id_transacao, ds_transacao, cd_carteira)
VALUES (SQ_T_TRANSACOES.NEXTVAL, 'Presentes', 2);
INSERT INTO T_SIP_TRANSACOES (id_transacao, ds_transacao, cd_carteira)
VALUES (SQ_T_TRANSACOES.NEXTVAL, 'Perfume', 2);

SELECT * FROM T_SIP_TRANSACOES WHERE cd_carteira = 1;
DELETE FROM T_SIP_TRANSACOES WHERE cd_carteira = 1;

-- Inserção na tabela T_SIP_RECEITA
DESC T_SIP_RECEITA
INSERT INTO T_SIP_RECEITA (id_receita, vl_recebido, id_transacao) 
VALUES (SQ_T_RECEITA.NEXTVAL, 1740.00, 1);

INSERT INTO T_SIP_RECEITA (id_receita, vl_recebido, id_transacao) 
VALUES (SQ_T_RECEITA.NEXTVAL, 250.00, 3);

SELECT * FROM T_SIP_RECEITA WHERE id_receita = 1;
DELETE FROM T_SIP_RECEITA WHERE id_receita = 6;

-- Inserção na tabela T_SIP_DESPESA
DESC T_SIP_DESPESA
INSERT INTO T_SIP_DESPESA (id_despesa, vl_retirado, id_transacao) -- TRANSACAO FK
VALUES (SQ_T_DESPESA.NEXTVAL, -1750.00, 3);

INSERT INTO T_SIP_DESPESA (id_despesa, vl_retirado, id_transacao) 
VALUES (SQ_T_DESPESA.NEXTVAL, -200.00, 4);

INSERT INTO T_SIP_DESPESA (id_despesa, vl_retirado, id_transacao) 
VALUES (SQ_T_DESPESA.NEXTVAL, -1000.00, 5);

SELECT * FROM T_SIP_DESPESA WHERE id_despesa = 1; -- Consulta do código do usuario e da despesa
DELETE FROM T_SIP_DESPESA WHERE id_despesa = 1;

-- Inserção na tabela T_CARTAO_CC
DESC T_CARTAO_CC
INSERT INTO T_CARTAO_CC (nr_cartao, nm_cartao, dt_exp, nr_seguranca, ds_apelido, cd_usuario)
VALUES ('22385193486', 'Gabriel Araujo F', TO_DATE('03/29', 'MM/YY'), 407, 'Pessoal', 1);

INSERT INTO T_CARTAO_CC (nr_cartao, nm_cartao, dt_exp, nr_seguranca, ds_apelido, cd_usuario)
VALUES ('92341133450', 'Danilo Fedder', TO_DATE('05/28', 'MM/YY'), 223, 'VR', 2);

SELECT * FROM T_CARTAO_CC WHERE cd_usuario = 1;
DELETE FROM T_CARTAO_CC WHERE cd_usuario = 1;

--Alterar todos os dados do usuário.
UPDATE T_SIP_USUARIO
SET 
nm_user = 'Danilo',
cpf = '480.345.672-09',
dt_nascimento = TO_DATE('07/03/86', 'DD/MM/YY'),
sexo = 'M',
ds_email = 'danilo.ti@amed.com',
ds_profissao = 'GarotodeProgramaJunior', --Agora sim
vl_salario = 1450.00,  
senha = 'ABCD1234'
WHERE cd_usuario = 2; 



-- Alterar todos os dados das receitas do usuário.
UPDATE T_SIP_RECEITA
SET vl_recebido = 1740 
WHERE id_receita = 1
AND id_transacao IN (
SELECT id_transacao FROM T_SIP_TRANSACOES 
WHERE cd_carteira IN (
SELECT cd_carteira FROM T_SIP_CARTEIRA 
WHERE cd_usuario = 1
)
);

-- Alterar todos os dados das despesa do usuário.
UPDATE T_SIP_DESPESA
SET vl_retirado = -300 
WHERE id_despesa = 1
AND id_transacao IN (
SELECT id_transacao FROM T_SIP_TRANSACOES 
WHERE cd_carteira IN (
SELECT cd_carteira FROM T_SIP_CARTEIRA 
WHERE cd_usuario = 1
)
);

--Alterar todos os dados para investimentos do usuário.
UPDATE T_CONTA_INVESTIMENTOS
SET
vl_investido = 400,  -- Novo valor investido
rendimento_esperado = 2.5,  -- Novo rendimento esperado em percentual
tipo_investimento = 'RENDA FIXA'  -- Novo tipo de investimento
WHERE id_banco IN (
SELECT id_banco FROM T_SIP_BANCO
WHERE cd_usuario = 1  -- Código do usuário como referência
);

--Consultar os dados de um usuário
SELECT * FROM T_SIP_USUARIO;

--Tem acesso a uma única despesa
SELECT
u.cd_usuario,
c.cd_carteira,
t.id_transacao,
d.id_despesa,
t.ds_transacao,
d.vl_retirado
FROM T_SIP_USUARIO u
JOIN T_SIP_CARTEIRA c ON u.cd_usuario = c.cd_usuario 
JOIN T_SIP_TRANSACOES t ON c.cd_carteira = t.cd_carteira
JOIN T_SIP_DESPESA d ON t.id_transacao = d.id_transacao
WHERE u.cd_usuario = 2
AND   d.id_despesa = 2;


--Tem acesso a todas as despesas.
SELECT
u.cd_usuario,
c.cd_carteira,
t.id_transacao,
d.id_despesa,
t.ds_transacao,
d.vl_retirado
FROM T_SIP_USUARIO u
JOIN T_SIP_CARTEIRA c ON u.cd_usuario = c.cd_usuario
JOIN T_SIP_TRANSACOES t ON c.cd_carteira = t.cd_carteira
JOIN T_SIP_DESPESA d ON t.id_transacao = d.id_transacao
WHERE u.cd_usuario = 2;

--Consultar os dados de um único registro de investimento de um  usuário.
SELECT
a.cd_usuario,
e.id_investimento,
e.vl_investido,
e.TIPO_INVESTIMENTO
FROM T_SIP_USUARIO a
JOIN T_SIP_BANCO g ON a.cd_usuario = a.cd_usuario
JOIN T_CONTA_INVESTIMENTOS e ON g.id_banco = e.id_banco
WHERE a.cd_usuario = 1
AND   e.id_investimento = 1;

--Consultar os dados de todos os registros de investimentos de um  usuário, ordenando-os dos registros mais recentes para os mais antigos.
SELECT
a.cd_usuario,
e.id_investimento,
e.vl_investido,
e.TIPO_INVESTIMENTO
FROM T_SIP_USUARIO a
JOIN T_SIP_BANCO g ON a.cd_usuario = a.cd_usuario
JOIN T_CONTA_INVESTIMENTOS e ON g.id_banco = e.id_banco
WHERE a.cd_usuario = 1;

--Consulta de dados de investimento e de despesa de um úsuario especifico
SELECT 
a.cd_usuario,
b.cd_carteira,
d.id_despesa,
c.ds_transacao,
d.vl_retirado,
e.id_investimento,
e.vl_investido,
e.TIPO_INVESTIMENTO
FROM T_SIP_USUARIO a
JOIN T_SIP_BANCO g ON a.cd_usuario = a.cd_usuario
JOIN T_CONTA_INVESTIMENTOS e ON g.id_banco = e.id_banco
JOIN T_SIP_CARTEIRA b ON a.cd_usuario = b.cd_usuario
JOIN T_SIP_TRANSACOES c ON b.cd_carteira = c.cd_carteira
JOIN T_SIP_DESPESA d ON c.id_transacao = d.id_transacao
WHERE a.cd_usuario = 2
AND d.id_despesa = 6
AND e.id_investimento = 1;

SELECT ROWNUM as RANK,
    a.cd_usuario,
    d.id_despesa,
    c.ds_transacao,
    d.vl_retirado,
    e.id_investimento,
    e.vl_investido,
    e.TIPO_INVESTIMENTO
FROM T_SIP_USUARIO a
JOIN T_SIP_BANCO g ON a.cd_usuario = g.cd_usuario
JOIN T_CONTA_INVESTIMENTOS e ON g.id_banco = e.id_banco
JOIN T_SIP_CARTEIRA b ON a.cd_usuario = b.cd_usuario
JOIN T_SIP_TRANSACOES c ON b.cd_carteira = c.cd_carteira
JOIN T_SIP_DESPESA d ON c.id_transacao = d.id_transacao
ORDER BY d.id_despesa DESC, e.id_investimento DESC
WHERE ROWNUM <=1 AND a.cd.usuario = 1;


commit;


/*

-- ELIMINA AS TABELAS
DROP TABLE T_SIP_ENDERECO CASCADE CONSTRAINTS; 
DROP TABLE T_SIP_USUARIO CASCADE CONSTRAINTS;
DROP TABLE T_SIP_TELEFONE CASCADE CONSTRAINTS; 
DROP TABLE T_SIP_BANCO CASCADE CONSTRAINTS;    
DROP TABLE T_CONTA CASCADE CONSTRAINTS;     
DROP TABLE T_CONTA_INVESTIMENTOS CASCADE CONSTRAINTS;     
DROP TABLE T_CARTAO_CC CASCADE CONSTRAINTS;
DROP TABLE T_SIP_CARTEIRA CASCADE CONSTRAINTS; 
DROP TABLE T_SIP_TRANSACOES CASCADE CONSTRAINTS
DROP TABLE T_SIP_RECEITA CASCADE CONSTRAINTS;  
DROP TABLE T_SIP_DESPESA CASCADE CONSTRAINTS;


*/

