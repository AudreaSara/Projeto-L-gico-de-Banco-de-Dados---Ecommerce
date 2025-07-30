# 📦 Projeto Lógico de Banco de Dados - E-commerce

## 🛒 Resumo do Projeto

Este projeto implementa um banco de dados relacional completo para um sistema de **E-commerce**. O foco está na **modelagem lógica bem estruturada** e na criação de **consultas SQL robustas**, permitindo:

- Registro de clientes **Pessoa Física (PF)** e **Pessoa Jurídica (PJ)**
- Controle de **pedidos, produtos e seus respectivos itens**
- Relacionamento com **fornecedores e vendedores**
- **Gerenciamento de estoque** e localização de produtos
- Processamento de **pagamentos com múltiplas formas** (Pix, Cartão, Boleto, etc)
- **Rastreio e status de entregas**, com datas de envio e entrega

O projeto aplica princípios de **normalização**, **integridade referencial** e **refinamentos do modelo EER**. As consultas SQL demonstram domínio em:

- `SELECT`, `WHERE`, `JOIN`, `ORDER BY`, `GROUP BY`, `HAVING`
- Expressões derivadas, filtros complexos e análises por cliente ou produto

> Ideal para portfólios de quem deseja demonstrar habilidades em banco de dados voltado ao mundo real.

---

## 🧾 Descrição do Projeto

Este projeto apresenta a **modelagem lógica e implementação em SQL** de um banco de dados para um cenário de E-commerce. O objetivo é permitir o gerenciamento de:

- Clientes (Pessoa Física e Jurídica)
- Pedidos, Produtos e Estoque
- Fornecedores e Vendedores
- Formas de Pagamento
- Entregas com rastreamento

A modelagem é baseada no **modelo EER**, com refinamentos conforme boas práticas de bancos de dados relacionais.

---

## 🗂️ Estrutura do Projeto

- `BD-Ecommerce.sql` → Criação do banco de dados, tabelas, constraints, chaves primárias e estrangeiras  
- `Inserts- BD - Ecommerce.sql` → Inserções de dados de exemplo para testes  
- `Queries - BD - Ecommerce.sql` → Consultas SQL com filtros, junções, ordenações, expressões derivadas, agrupamentos e cláusulas complexas

---

## 🧱 Entidades e Relacionamentos Principais

### 👤 Cliente  
Pode ser Pessoa Física ou Jurídica (mutuamente exclusivos)  
**Atributos:** `id_cliente`, `t_cliente`, `email`, `telefone`

### 🧑 Pessoa_Física  
Herda de Cliente  
**Atributos:** `nome`, `cpf`

### 🏢 Pessoa_Jurídica  
Herda de Cliente  
**Atributos:** `razao_social`, `cnpj`

### 🛍️ Produto  
Relacionado a um Fornecedor  
**Atributos:** `nome`, `descricao`, `preco`

### 🏭 Fornecedor  
Fornece produtos  
**Atributos:** `nome`, `CNPJ`, `telefone`, `email`

### 🧑‍💼 Vendedor  
Pode ter relação com Fornecedor (verificável via CPF/CNPJ)  
**Atributos:** `nome`, `CPF`, `email`, `telefone`

### 📦 Estoque  
Relacionado ao Produto  
**Atributos:** `quantidade`, `localizacao`

### 📑 Pedido  
Relacionado ao Cliente  
**Atributos:** `data_pedido`, `statusP`

### 📦 Item_Pedido  
Relaciona Produtos a Pedidos  
**Atributos:** `quantidade`, `preco_uni`

### 💳 Pagamento  
Associado a Pedido e à Forma de Pagamento  
**Atributos:** `valor`, `data_pagamento`

### 🧾 Forma_Pagamento  
Exemplos: `Boleto`, `Cartão`, `Pix`

### 🚚 Entrega  
Associada a Pedido  
**Atributos:** `e_status`, `cod_rastreio`, `data_envio`, `data_entrega`

---

## ❓ Exemplos de Consultas Realizadas

- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos, fornecedores e estoques
- Valor total vendido por produto (atributo derivado)
- Pedidos com status e ordenação por data

---

## 🎯 Objetivos Atendidos

- Modelagem lógica completa com refinamentos do modelo conceitual
- Criação de tabelas com uso correto de **constraints**
- Aplicação de **normalização** e uso de **herança (PF/PJ)**
- Inclusão de **rastreio e status de entrega**
- Suporte a **múltiplas formas de pagamento**
- Consultas SQL que envolvem:
  - `SELECT`, `WHERE`, `JOIN`, `ORDER BY`, `GROUP BY`, `HAVING`
  - Expressões derivadas e agrupamentos analíticos
