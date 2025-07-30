SELECT * FROM cliente;
SELECT * FROM pedido;
SELECT * FROM item_pedido;
SELECT * FROM pagamento;
SELECT * FROM entrega;

-- Buscar produtos da categoria 'Brinquedos' com avaliação >= 4
SELECT pname, categoria, avaliacao, valor
FROM produto
WHERE categoria = 'Brinquedos' AND avaliacao >= 4;

-- Mostrar o valor total do item no pedido (quantidade * preço unitário)
SELECT id_item_pedido, quantidade, preco_uni, (quantidade * preco_uni) AS total_item
FROM item_pedido;

-- Listar clientes ordenados pelo email de forma alfabética
SELECT id_cliente, email
FROM cliente
ORDER BY email ASC;