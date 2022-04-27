-- Seleções de dados

-- 1)
SELECT
	pe.id,
	pe.status,
    pe.cliente_id,
    pr.id,
    pr.nome,
    pr.tipo,
    pr.preço,
    pr.pts_de_lealdade
FROM 
    produtos_pedidos pp
    INNER JOIN produtos pr ON pr.id = pp.produto_id
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id;

-- 2)
SELECT
	pe.id
FROM
 	pedidos pe
    INNER JOIN produtos_pedidos pp ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
WHERE
 	pr.nome = 'Fritas';

-- 3)
SELECT
	cl.nome AS gostam_de_fritas
FROM
 	clientes cl
    INNER JOIN pedidos pe ON pe.cliente_id = cl.id
    INNER JOIN produtos_pedidos pp ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
WHERE
 	pr.nome = 'Fritas';

-- 4)
 SELECT
 	SUM(preço)
FROM
  	produtos pr
    INNER JOIN produtos_pedidos pp ON pr.id = pp.produto_id
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN clientes cl ON cl.id = pe.cliente_id
WHERE
   	cl.nome = 'Laura';

-- 5)
SELECT
	pr.nome,
	COUNT(produto_id)
FROM
	produtos_pedidos pp
    INNER JOIN produtos pr ON pr.id = pp.produto_id
GROUP BY
	pr.nome;
