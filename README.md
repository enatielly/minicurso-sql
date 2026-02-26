# Mini Curso SQL - Código Fonte TV

Projeto desenvolvido durante o minicurso de SQL do canal [Código Fonte TV](https://www.youtube.com/@coaboradofonteTv).

## Conteúdo

O curso aborda os principais conceitos de SQL usando MySQL:

- **DDL (Data Definition Language):** `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, `TRUNCATE`
- **DML (Data Manipulation Language):** `INSERT`, `UPDATE`, `DELETE`
- **DQL (Data Query Language):** `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `LIKE`
- **Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `UNION`
- **Funções de Agregação:** `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- **Agrupamento:** `GROUP BY`, `HAVING`
- **Subqueries**

## Estrutura do Banco

- `marcas` — Marcas de hardware (Intel, AMD, NVIDIA, etc.)
- `produtos` — Produtos de hardware com FK para marcas
- `clientes` — Clientes com dados pessoais
- `pedidos` — Pedidos realizados por clientes
- `itens_pedido` — Itens de cada pedido (relação N:N entre pedidos e produtos)

## Como Usar

1. Tenha um servidor MySQL rodando (local ou Docker)
2. Crie o banco de dados: `CREATE DATABASE minicurso_sql;`
3. Execute os scripts na pasta `queries/` na ordem

## Tecnologias

- MySQL
- VS Code + Database Client (extensão)
