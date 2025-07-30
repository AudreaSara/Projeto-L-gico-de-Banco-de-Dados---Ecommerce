-- criação do banco de dados - ecommerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criação tabela cliente
CREATE TABLE cliente(
	id_cliente int auto_increment primary key,
    t_cliente enum('PJ', 'PF') not null,
    email varchar(254) unique not null,
    telefone varchar(15),
    address varchar(100)
);

-- criação tabela pessoa física
CREATE TABLE p_fisica(
	id_cliente int primary key,
	fname varchar(10) not null,
    mname char(3),
    lname varchar(20) not null,
    CPF varchar(11) unique not null,
    foreign key (id_cliente) references cliente(id_cliente)
);

-- criação tabla pessoa jurídica
CREATE TABLE p_juridica(
	id_cliente int primary key,
    razao_social varchar(50) not null,
    CNPJ char(14) unique not null,
    foreign key (id_cliente) references cliente(id_cliente)
);

-- criação tabela fornecedor
CREATE TABLE fornecedor(
	id_fornecedor int auto_increment primary key,
    f_nome varchar(100) not null,
    cnpj varchar(14) unique not null,
    telefone varchar(14),
    email varchar(254) not null
);

-- criação tabela produto
CREATE TABLE produto(
	id_produto int auto_increment primary key,
    pname varchar(10) not null,
    classification_kids bool default false,
    categoria enum('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimento') not null,
    pro_descricao text,
    avaliacao float default 0,
    size varchar(10),
    valor decimal(10,2),
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

-- tabela vendedor
CREATE TABLE vendedor(
	id_vendedor int auto_increment primary key,
    nome varchar(100) not null,
    v_cpf varchar(11) unique not null,
    telefone varchar(15) not null,
    email varchar(254) not null
);

-- criação tabela estoque
CREATE TABLE estoque(
	id_estoque int auto_increment primary key,
    id_produto int not null,
    quantidade int not null,
    localizacao varchar(100),
    foreign key (id_produto) references produto(id_produto)
);
-- criação tabela pedido
CREATE TABLE pedido(
	id_pedido int auto_increment primary key,
    id_cliente int not null,
    statusP enum('Cancelado', 'Pago', 'Pendente') default 'Pendente',
    data_pedido datetime default current_timestamp,
    frete float default 0,
    foreign key (id_cliente) references cliente(id_cliente)
);

-- criação tabela item x pedido
CREATE TABLE item_pedido(
		id_item_pedido int auto_increment primary key,
        id_pedido int not null,
        id_cliente int not null,
        id_produto int not null,
        quantidade int not null,
        preco_uni decimal(10,2) not null,
        foreign key (id_pedido) references pedido(id_pedido),
        foreign key (id_produto) references produto(id_produto),
        foreign key (id_cliente) references cliente(id_cliente)
);

-- criação tabela tipo de pagamento
CREATE TABLE t_pagamento(
	id_t_pagamento int auto_increment primary key,
    t_pagamento enum('Boleto', 'Cartão', 'Pix'),
    pag_descricao varchar(100)
);
-- criação tabela pagamento
CREATE TABLE pagamento(
	id_pagamento int auto_increment not null,
	id_cliente int not null,
    id_pedido int not null,
    id_t_pagamento int not null,
    valor decimal(10,2) not null,
    data_pag datetime default current_timestamp,
    foreign key (id_pedido) references pedido(id_pedido),
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_t_pagamento) references t_pagamento(id_t_pagamento),
    unique (id_cliente, id_pedido)
);

-- criação da tabela entrega
CREATE TABLE entrega(
	id_entrega int auto_increment primary key,
    id_pedido int not null,
    e_status enum('Enviado', 'Entregue', 'A caminho') not null,
    cod_rastreio varchar(50),
    data_envio datetime,
    data_entrega datetime,
    foreign key (id_pedido) references pedido(id_pedido)
);

SHOW TABLES;
DESCRIBE pedido;
DESCRIBE cliente;