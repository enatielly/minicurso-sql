CREATE TABLE marcas (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    site VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco REAL,
    estoque INTEGER DEFAULT 0
);

ALTER TABLE produtos ADD COLUMN id_marca INTEGER NOT NULL;

ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(150);

ALTER TABLE produtos ADD FOREIGN KEY (id_marca) REFERENCES marcas(id);

CREATE TABLE controle(
    id INT PRIMARY KEY,
    data_entrada DATE
);

DROP TABLE IF EXISTS controle;

ALTER TABLE marcas MODIFY COLUMN telefone VARCHAR(30);

INSERT INTO marcas
    (nome, site, telefone)
VALUES
    ('Intel', 'https://www.intel.com', '+1-408-765-8080'),
    ('AMD', 'https://www.amd.com', '+1-408-749-4000'),
    ('NVIDIA', 'https://www.nvidia.com', '+1-408-486-2000'),
    ('ASUS', 'https://www.asus.com', '+886-2-2894-3447'),
    ('Corsair', 'https://www.corsair.com', '+1-888-222-4346'),
    ('Kingston', 'https://www.kingston.com', '+1-800-337-8410');


INSERT INTO produtos
    (nome, preco, estoque, id_marca)
VALUES
    ('Processador Core i9-14900K', 4200.00, 15, 1),
    ('Processador Core i5-13600K', 2100.00, 45, 1),
    ('Processador Ryzen 9 7950X', 3900.00, 20, 2),
    ('Processador Ryzen 7 7800X3D', 2800.00, 35, 2),
    ('Placa de Vídeo RTX 4090 24GB', 14500.00, 5, 3),
    ('Placa de Vídeo RTX 4070 12GB', 4800.00, 18, 3),
    ('Placa-Mãe ROG Strix B650E', 1950.00, 25, 4),
    ('Memória RAM Vengeance 32GB (2x16GB)', 850.00, 60, 5),
    ('SSD NVMe 2TB Fury Renegade', 1150.00, 80, 6),
    ('SSD SATA 1TB A400', 450.00, 120, 6);

SELECT * FROM marcas;

SELECT id, nome FROM marcas WHERE id = 1;

SELECT id, nome FROM marcas WHERE id > 2;

CREATE TABLE produtos_apple (
    nome VARCHAR (150) NOT NULL,
    estoque INT DEFAULT 0
);

INSERT INTO produtos_apple
SELECT nome, estoque FROM produtos WHERE id_marca = 1;

SELECT * FROM produtos_apple;

TRUNCATE TABLE produtos_apple;

UPDATE produtos
SET nome = 'Processador Core i9-14900K New'
WHERE id = 1;

SELECT * FROM produtos;

UPDATE produtos
SET estoque = estoque + 10;

UPDATE produtos
SET estoque = estoque + 1
WHERE id = 1;

DELETE FROM produtos
WHERE id = 1;

SELECT *
FROM produtos
WHERE estoque < 100;

SELECT *
FROM produtos
WHERE estoque <> 30;

SELECT *
FROM produtos
WHERE
    estoque < 80
    AND id_marca = 1;

SELECT *
FROM produtos
WHERE
    nome LIKE '%placa%'

SELECT *
FROM produtos
ORDER BY preco ASC;

SELECT *
FROM produtos
ORDER BY preco ASC
LIMIT 5;

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR (100) UNIQUE NOT NULL,
    cidade VARCHAR (200),
    data_nascimento DATE
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE DEFAULT (NOW()),
    id_cliente INTEGER,
    valor_total REAL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER,
    preco_unitario REAL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id),
    PRIMARY KEY (id_pedido, id_produto)
);

INSERT INTO clientes (nome, email, cidade, data_nascimento) VALUES
    ('Ana Costa', 'ana.costa@email.com', 'São Paulo', '1991-02-20'),
    ('Bruno Lima', 'bruno.lima@email.com', 'Rio de Janeiro', '1990-05-10'),
    ('Carla Mendes', 'carla.mendes@email.com', 'Belo Horizonte', '2001-12-22'),
    ('Diego Alves', 'diego.alves@email.com', 'Salvador', '1985-11-03'),
    ('Elena Rocha', 'elena.rocha@email.com', 'Curitiba', '1998-07-15'),
    ('Felipe Gomes', 'felipe.gomes@email.com', 'Porto Alegre', '1995-09-28');

INSERT INTO pedidos (data_pedido, id_cliente, valor_total) VALUES
    (1, 15650.00),
    (2, 5600.00),
    (4, 450.00),
    (3, 2100.00),
    (5, 4800.00),
    (1, 850.00);

INSERT INTO pedidos (id_cliente, valor_total) VALUES
    (1, 15650.00),
    (2, 5600.00),
    (4, 450.00),
    (3, 2100.00),
    (5, 4800.00),
    (1, 850.00);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
    (1, 5, 1, 14500.00),
    (1, 9, 1, 1150.00),
    (2, 4, 1, 2800.00),
    (2, 7, 1, 1950.00),
    (2, 8, 1, 850.00),
    (3, 10, 1, 450.00),
    (4, 2, 1, 2100.00),
    (5, 6, 1, 4800.00),
    (6, 8, 1, 850.00);

SELECT
    clientes.nome,
    pedidos.valor_total
FROM
    clientes
    INNER JOIN pedidos ON clientes.id = pedidos.id_cliente;

-- SUBQUERY
SELECT
    nome, preco
FROM
    produtos
WHERE
    id_marca IN (SELECT id FROM marcas WHERE nome = 'ASUS' OR nome = 'NVIDIA');

SELECT clientes.nome, pedidos.valor_total
FROM
    clientes
    LEFT JOIN pedidos ON
    clientes.id = pedidos.id_cliente;

SELECT clientes.nome, pedidos.valor_total
FROM
    clientes
    RIGHT JOIN pedidos ON
    clientes.id = pedidos.id_cliente;

SELECT clientes.nome, pedidos.valor_total
FROM
    clientes
    LEFT JOIN pedidos ON
    clientes.id = pedidos.id_cliente

UNION

SELECT clientes.nome, pedidos.valor_total
FROM
    clientes
    RIGHT JOIN pedidos ON
    clientes.id = pedidos.id_cliente


SELECT
    cidade,
    COUNT(1) as numero_clientes
FROM
    clientes
GROUP BY cidade;


SELECT
    DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
    AVG(valor_total) AS media_vendas
FROM
    pedidos
GROUP BY mes;

SELECT MAX (valor_total) AS maior_pedido FROM pedidos;

SELECT MIN (valor_total) AS maior_pedido FROM pedidos;

SELECT
    nome,
    estoque
FROM
    produtos
WHERE
    estoque < (SELECT AVG(estoque) FROM produtos);


SELECT
    c.cidade,
    SUM(p.valor_total) AS total_vendas
FROM
    clientes AS c
    INNER JOIN pedidos AS p ON c.id = p.id_cliente
WHERE
    c.cidade IN ('Salvador', 'São Paulo')
GROUP BY
    c.cidade

HAVING total_vendas < 7000;
