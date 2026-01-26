# Desafio Elixir - Sistema de Gestão de Estoque

Este é um desafio técnico para desenvolvedores **júnior** com o objetivo de avaliar suas habilidades em **Elixir** e **Phoenix Framework**.

> **Importante:** Não esperamos perfeição! O que queremos observar é **seu processo de aprendizado**, **sua curiosidade**, **capacidade de resolver problemas** e **persistência**.

---

## Sobre o Desafio

Você irá construir um **Sistema de Gestão de Estoque** que permite gerenciar produtos e suas movimentações (entradas e saídas). Este é um problema real que empresas enfrentam diariamente!

---

## Requisitos Técnicos

- **Elixir** (versão 1.14+)
- **Phoenix Framework** (versão 1.7+)
- **PostgreSQL** como banco de dados
- **Git** para versionamento

---

## Níveis de Entrega

Escolha o nível que melhor se adequa ao seu momento. **Não há problema em entregar apenas o nível básico** - o importante é a qualidade do que você entregar!

---

### Nível 1: Básico (Obrigatório)

**Objetivo:** Demonstrar que você consegue criar uma aplicação funcional com Elixir/Phoenix.

#### 1.1 Cadastro de Produtos

- [x] Nome (obrigatório, mínimo 3 caracteres)
- [x] Descrição (opcional)
- [x] Quantidade em estoque (obrigatório, número inteiro >= 0)
- [x] Preço unitário (opcional, decimal >= 0)

#### 1.2 Listagem de Produtos

- [x] Exibir todos os produtos cadastrados
- [x] Mostrar: Nome, Descrição, Quantidade em estoque, Preço

#### 1.3 Edição e Exclusão

- [x] Permitir editar dados do produto
- [x] Permitir excluir produto

#### 1.4 Validações Básicas

- [x] Validar campos obrigatórios
- [x] Não permitir quantidade negativa
- [x] Exibir mensagens de erro amigáveis

**Entregáveis do Nível 1:**

- CRUD completo de produtos funcionando
- Validações implementadas
- Interface web básica (pode usar os generators do Phoenix)

---

### Nível 2: Intermediário (Opcional)

**Objetivo:** Demonstrar entendimento de relacionamentos e lógica de negócio.

#### 2.1 Movimentações de Estoque

- [x] Registrar movimentações de **Entrada** e **Saída**
- [x] Cada movimentação deve conter:
  - Produto relacionado
  - Tipo (`:entrada` ou `:saida`)
  - Quantidade (inteiro positivo)
  - Data/hora (automática)
  - Observação (opcional)

#### 2.2 Lógica de Estoque

- [x] **Entrada:** aumenta quantidade em estoque
- [x] **Saída:** diminui quantidade em estoque
- [x] **Bloquear** saída se quantidade for maior que estoque disponível
- [x] Atualizar estoque automaticamente após movimentação

#### 2.3 Histórico de Movimentações

- [x] Listar todas as movimentações de um produto
- [x] Mostrar: Data, Tipo, Quantidade, Observação
- [x] Ordenar por data (mais recente primeiro)

**Entregáveis do Nível 2:**

- Relacionamento Product -> Movements funcionando
- Lógica de estoque implementada
- Histórico de movimentações por produto

---

### Nível 3: Avançado (Opcional - Para se destacar!)

**Objetivo:** Demonstrar conhecimento de boas práticas e features avançadas.

Escolha **pelo menos 2** das funcionalidades abaixo:

#### 3.1 API REST

- [x] Criar endpoints JSON para produtos e movimentações
- [x] Documentar os endpoints no README
- [x] Implementar respostas de erro padronizadas

#### 3.2 Testes Automatizados

- [ ] Testes unitários para o contexto de Estoque
- [ ] Testes para validações
- [ ] Testes para lógica de movimentação

#### 3.3 Filtros e Busca

- [ ] Buscar produtos por nome
- [ ] Filtrar produtos com estoque baixo (< 10 unidades)
- [ ] Filtrar movimentações por período (data inicial e final)

#### 3.4 Dashboard Simples

- [ ] Total de produtos cadastrados
- [ ] Produtos com estoque zerado
- [ ] Valor total em estoque (quantidade × preço)
- [ ] Últimas 5 movimentações

#### 3.5 LiveView (Diferencial)

- [ ] Atualização em tempo real da listagem de produtos
- [ ] Formulário de movimentação sem reload da página

**Entregáveis do Nível 3:**

- Funcionalidades escolhidas implementadas e funcionando
- Código bem organizado e documentado

---

## Estrutura Esperada do Banco de Dados

### Tabela `products`

| Campo       | Tipo     | Obrigatório      |
| ----------- | -------- | ---------------- |
| id          | integer  | auto             |
| name        | string   | sim              |
| description | text     | não              |
| quantity    | integer  | sim (default: 0) |
| price       | decimal  | não              |
| inserted_at | datetime | auto             |
| updated_at  | datetime | auto             |

### Tabela `movements` (Nível 2+)

| Campo       | Tipo        | Obrigatório |
| ----------- | ----------- | ----------- |
| id          | integer     | auto        |
| product_id  | references  | sim         |
| type        | string/enum | sim         |
| quantity    | integer     | sim         |
| notes       | text        | não         |
| inserted_at | datetime    | auto        |

---

## Entrega

### Repositório

- [x] Projeto publicado no **GitHub**
- [ ] Código limpo e organizado
- [ ] Commits frequentes e com mensagens descritivas

### README (Atualize este arquivo!)

Ao final do desafio, adicione uma seção com:

- [x] **Como rodar a aplicação** (comandos necessários)
- [x] **Nível entregue** (1, 2 ou 3)
- [x] **O que você aprendeu**
- [x] **Principais desafios enfrentados**
- [x] **O que faria diferente com mais tempo**

---

## Recursos para Aprendizado

### Elixir - Primeiros Passos

- [Elixir School (PT-BR)](https://elixirschool.com/pt) - Tutorial completo em português
- [Elixir Getting Started](https://elixir-lang.org/getting-started/introduction.html) - Documentação oficial
- [Exercism Elixir Track](https://exercism.org/tracks/elixir) - Exercícios práticos

### Phoenix Framework

- [Phoenix Guides](https://hexdocs.pm/phoenix/overview.html) - Documentação oficial
- [Phoenix Tutorial](https://www.phoenixframework.org/) - Site oficial
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/welcome.html) - Para o nível avançado

### Comandos Úteis

```bash
# Criar novo projeto Phoenix
mix phx.new stock_management --database postgres

# Entrar no diretório
cd stock_management

# Criar banco de dados
mix ecto.create

# Gerar CRUD completo (scaffold)
mix phx.gen.html Stock Product products name:string description:text quantity:integer price:decimal

# Rodar migrations
mix ecto.migrate

# Iniciar servidor
mix phx.server

# Rodar testes
mix test
```

### Dicas de Ouro

1. **Use os generators!** O Phoenix tem excelentes geradores de código
2. **Leia os erros** - Elixir tem mensagens de erro muito claras
3. **IEx é seu amigo** - Use `iex -S mix` para testar código no terminal
4. **Commits frequentes** - Ajuda a voltar atrás se algo der errado

---

## Prazo

**7 dias corridos** após o recebimento deste desafio

---

## Critérios de Avaliação

| Critério                        | Peso                |
| ------------------------------- | ------------------- |
| Código funcionando              | Alto                |
| Organização e clareza do código | Alto                |
| README bem escrito              | Médio               |
| Commits organizados             | Médio               |
| Boas práticas Elixir            | Médio               |
| Funcionalidades extras          | Baixo (diferencial) |

---

## Dúvidas?

Não hesite em perguntar! Saber fazer perguntas é uma habilidade importante.

---

**Boa sorte! Estamos ansiosos para ver sua solução!**

---

## Sua Solução

### Como Rodar

Certifique-se de possuir Postgresql instalado na sua máquina.
Em `config/dev.exs` configure os dados necessários para se conectar com o banco de dados

```
config :stock_management, StockManagement.Repo,
  username: "seu_username", <- alterar aqui
  password: "sua_senha", <- alterar aqui
  hostname: "localhost",
  database: "stock_management_dev",
  [...]
```

Rode os seguintes comandos:

```
cd stock_management
mix deps.get
mix ecto.create
mix ecto.migrate
mix phx.server
```

A aplicação pode ser acessada no navegador visitando [`localhost:4000`](http://localhost:4000).

### Endpoints

> Base URL: `http://localhost:4000`

#### API Rest

---

#### Products `(/api/products)`

**Listar Produtos**

**GET** `/api/products`

> **Resposta - 200 OK**

```json
{
  "data": [
    {
      "id": 1,
      "name": "Teclado Razer",
      "description": "Com rgb",
      "quantity": 10,
      "price": 1000
    }
  ]
}
```

---

**Buscar produto por ID**

**GET** `api/products/:id`

> **Resposta - 200 OK**

```json
{
  "data": {
    "id": 1,
    "name": "Teclado Razer",
    "description": "Com rgb",
    "quantity": 10,
    "price": 1000
  }
}
```

> **Erro - 404 Not Found**

```json
{
  "errors": {
    "detail": "Not Found"
  }
}
```

---

**Criar Produto**

**POST** `api/products`

**Body**

```json
{
  "name": "Teclado Razer",
  "description": "com rgb",
  "quantity": 10,
  "price": 1000
}
```

> **Resposta - 201 CREATED**

```json
{
  "data": {
    "id": 1,
    "name": "Teclado Razer",
    "description": "Com rgb",
    "quantity": 10,
    "price": 1000
  }
}
```

> **Erro - 422 Unprocessable Entity**

```json
{
  "errors": {
    "name": ["Campo [name, quantity] obrigatório"]
  }
}
```

---

**Atualizar Produto**

**PATCH** `api/products`

**Body**

```json
{
  "name": "Teclado Logitech"
}
```

> **Resposta - 200 OK**

```json
{
  "data": {
    "id": 1,
    "name": "Teclado Logitech",
    "description": "Com rgb",
    "quantity": 10,
    "price": 1000
  }
}
```

> **Erro - 404 Not Found**

```json
{
  "errors": {
    "detail": "Not Found"
  }
}
```

> **Erro - 422 Unprocessable Entity**

```json
{
  "errors": {
    "name": ["Campo [name, quantity] obrigatório"]
  }
}
```

---

**Deletar Produto**

**DELETE** `api/products`

> **Resposta - 204 No Content**

> **Erro - 404 Not Found**

```json
{
  "errors": {
    "detail": "Not Found"
  }
}
```

---

#### Moviments `(/api/movements)`

**Listar Movements**

**GET** `/api/moviments`

> **Resposta - 200 OK**

```json
{
  "data": [
    {
      "id": 1,
      "type": "entrada",
      "quantity": 10,
      "notes": "Compra inicial",
      "product_id": 1,
      "inserted_at": "2026-01-26T02:38:31Z",
      "updated_at": "2026-01-26T02:38:31Z"
    }
  ]
}
```

**Buscar movimentos por ID**

**GET** `/api/moviments/:id`

> **Resposta - 200 OK**

```json
{
  "data": {
    "id": 1,
    "type": "saida",
    "quantity": 5,
    "notes": "Venda",
    "product_id": 1,
    "inserted_at": "2026-01-26T02:38:31Z",
    "updated_at": "2026-01-26T02:38:31Z"
  }
}
```

> **Erro - 404 Not Found**

```json
{
  "errors": {
    "detail": "Not Found"
  }
}
```

**Criar Movement**

**POST** `api/movements`

**Body**

```json
{
  "product_id": 1,
  "type": "saida",
  "quantity": 5,
  "notes": "Venda balcão"
}
```

> **Resposta - 201 CREATED**

```json
{
  "data": {
    "id": 2,
    "type": "saida",
    "quantity": 5,
    "notes": "Venda balcão",
    "product_id": 1
  }
}
```

> **Erro - 422 Unprocessable Entity**

```json
{
  "errors": {
    "quantity": ["Estoque insuficiente"]
  }
}
```

> **Erro - 422 Unprocessable Entity**

```json
{
  "errors": {
    "quantity": ["A quantidade deve ser maior que zero"]
  }
}
```

### Nível Entregue

- [ ] Nível 1 (Básico)
- [x] Nível 2 (Intermediário)
- [ ] Nível 3 (Avançado) -> nível 3 foi iniciado com a API REST, mas foi o único item desse nível que pude finalizar.

### O que achei de trabalhar com Elixir

> Divertido. Apesar de seguir um paradigma funcional, fiquei surpreso pelo quanto programar nele me pareceu OOP. Talvez isso se dê pela minha visão e hábitos com linguagens OOP e/ou pelo padrão MVC adotado, mas achei isso surpreendente. Esperava que fosse parecer algo de "outro mundo".

### O que Aprendi

> Elixir como um todo (tanto a linguagem em sí como todo seu ecossistema) são coisas completamente novas para mim, aprendi muitas coisas sobre a própria linguagem. Suas convenções de escrita, sintaxe, roteamento. Terminologia de funções "render/3", "render/4"
> Fluxo de dados: a maneira que o Elixir manipula e recebe dados em diferentes camadas. Controller -> Context -> Repo.
> Manipulação e validações de formulários com changeset
> Tratamento de erros centralizados com FallbackController

### Principais Desafios

> O tratamento de erros e as condicionais foram pra mim os pontos de mais dificuldade.
> Implementar e entender o padrão/esquema da utilização de um fallback centralizado para tratamento de erros foi mais dificil do que eu esperava. O módulo FallbackController e como funciona em si não foi tão complicado, mas entender a maneira de jogar a exceção, sim. Principalmente porque isso acabou se misturando bastante com o uso de condicionais em Elixir que acabam sendo diferentes de como era em JS. A utilização de Cond, With, Case, acabou deixando um pouco confuso para mim até conseguir entender melhor.

### O que faria diferente com mais tempo

> Sendo algo novo para mim, achei mais importante deixar a aplicação o mais funcional e utilizavel possível, focando nas regras de negócio, banco de dados, relacionamentos.
> Conhecendo melhor agora, gostaria de poder dar mais atenção ao frontend e finalizar o nível 3 do teste.
> Padronizaria melhor o código. Em alguns momentos eu estava lendo nomes do teste em ingles (type, product, etc) e passando os para o código, mas outros momentos me peguei confuso com a utilização de ingles ou portugues (com algumas mensagens estando em portgues, outras em ingles.)

---
