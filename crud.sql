-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO
	clientes(nome, lealdade)
VALUES
	('Georgia', 0)
RETURNING *;

-- 2)
INSERT INTO
	pedidos(status, cliente_id)
VALUES
	('Recebido', 6)
RETURNING *;

-- 3)
INSERT INTO
	produtos_pedidos(pedido_id, produto_id)
VALUES
	(6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8)
RETURNING *;

-- Leitura

-- 1)
SELECT
	cl.id,
    cl.nome,
    cl.lealdade,
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
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN clientes cl ON cl.id = pe.cliente_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
WHERE
	cl.nome = 'Georgia';

-- Atualização

-- 1)
UPDATE clientes
SET lealdade = 48
WHERE nome = 'Georgia';


-- Deleção

-- 1)
DELETE FROM clientes
WHERE nome = 'Marcelo';

