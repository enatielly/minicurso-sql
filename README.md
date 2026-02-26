# Minicurso SQL — Código Fonte TV

Projeto desenvolvido durante o [Minicurso de SQL](https://www.youtube.com/@coaboradofonteTv) do canal **Código Fonte TV**.
Aprenda do zero até funções avançadas de SQL com exemplos práticos.

## Tópicos Abordados

- Histórico e estrutura da linguagem SQL
- Conceitos básicos de banco de dados relacional
- Chave primária, estrangeira e índices
- `CREATE`, `ALTER` e `DROP`
- `INSERT`, `UPDATE`, `DELETE`
- `INSERT` com `SELECT`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT` e operadores lógicos
- `JOIN` (`INNER`, `LEFT`, `RIGHT`, `FULL`)
- Operador `IN` e subqueries
- `GROUP BY`, `HAVING` e funções de agregação (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`)

## Estrutura do Banco

| Tabela | Descrição |
|---|---|
| `marcas` | Marcas de hardware (Intel, AMD, NVIDIA, ASUS, Corsair, Kingston) |
| `produtos` | Produtos de hardware com FK para marcas |
| `clientes` | Clientes com dados pessoais |
| `pedidos` | Pedidos realizados por clientes |
| `itens_pedido` | Itens de cada pedido (relação N:N entre pedidos e produtos) |

## Instalação do MySQL via Docker

```bash
# Baixar imagem do MySQL
docker pull mysql:latest

# Criar volume de dados (persistir mesmo depois de parar o container)
docker volume create mini-curso-sql-dados

# Criar e executar o container
docker run -d \
  --name mini-curso-sql \
  -e MYSQL_ROOT_PASSWORD=sql \
  -p 3306:3306 \
  -v mini-curso-sql-dados:/var/lib/mysql \
  mysql:latest
```

## Como Usar

1. Suba o container MySQL com os comandos acima
2. Conecte ao banco via VS Code com a extensão **Database Client** (host: `127.0.0.1`, porta: `3306`, usuário: `root`, senha: `sql`)
3. Crie o banco de dados: `CREATE DATABASE minicurso_sql;`
4. Execute os scripts da pasta `queries/` na ordem

## Tecnologias

- MySQL (Docker)
- VS Code + Database Client (extensão)
