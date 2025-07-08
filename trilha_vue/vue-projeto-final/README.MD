# Sistema de Gestão de Produtos

![Node.js](https://img.shields.io/badge/Node.js-18.x-green)
![Vue.js](https://img.shields.io/badge/Vue.js-3.x-brightgreen)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)

Sistema completo para gestão de produtos com autenticação JWT, CRUD de produtos e integração com APIs externas.

## Estrutura do Projeto

.
├── backend/
│ ├── controllers/ # Lógica das rotas
│ ├── models/ # Modelos do banco
│ ├── routes/ # Definição de rotas
│ ├── middleware/ # Autenticação JWT
│ ├── config/ # Configurações
│ ├── app.js # App principal
│ └── server.js # Servidor
└── frontend/
├── src/
│ ├── components/ # Componentes Vue
│ ├── views/ # Páginas
│ ├── store/ # Pinia
│ └── router/ # Rotas
└── public/ # Assets


## Tecnologias

### Backend
- **Node.js 18+**
- **Express** (Framework web)
- **Sequelize** (ORM para MySQL)
- **JWT** (Autenticação)
- **MySQL 8.0+**

### Frontend
- **Vue.js 3** (Composition API)
- **Pinia** (Gerenciamento de estado)
- **Vuetify** (Componentes UI)
- **Axios** (HTTP Client)

## Pré-requisitos

- **Node.js 18+**
- **MySQL 8.0+**
- **Yarn ou npm**

## Configuração

### 1. Banco de Dados

CREATE DATABASE produto_db;
CREATE USER 'produto_user'@'localhost' IDENTIFIED BY 'senha_segura';
GRANT ALL PRIVILEGES ON produto_db.* TO 'produto_user'@'localhost';
FLUSH PRIVILEGES;

cd backend
cp .env.example .env  # Configure suas variáveis
yarn install
yarn migrate
yarn start

cd frontend
cp .env.example .env  # Configure a API URL
yarn install
yarn dev

#### Endpoints da API
Método	Endpoint	Descrição
**POST**	/api/auth/register	**Registrar usuário**
**POST**	/api/auth/login	**Login**
**GET**	/api/products	**Listar produtos**
**POST**	/api/products	**Criar produto**
**PUT**	/api/products/:id	**Atualizar produto**
DELETE	/api/products/:id	**Remover produto**

## Modelos de Dados
Usuário (users)
javascript
{
  id: Integer,
  name: String,
  email: String,
  password: String (bcrypt),
  role: ['admin', 'user'],
  createdAt: DateTime,
  updatedAt: DateTime
}

## Produto (products)

{
  id: Integer,
  name: String,
  price: Decimal(10,2),
  category: String,
  description: Text,
  userId: Integer (FK),
  createdAt: DateTime,
  updatedAt: DateTime
}

## Autenticação JWT
**Fluxo de autenticação:**

Cliente envia credenciais para /api/auth/login

Servidor valida e retorna token JWT

Cliente armazena token (localStorage/cookies)

Token é enviado no header Authorization para rotas protegidas


// Exemplo de middleware de autenticação
const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');
  if (!token) return res.status(401).send('Acesso negado');

  try {
    const verified = jwt.verify(token, process.env.JWT_SECRET);
    req.user = verified;
    next();
  } catch (err) {
    res.status(400).send('Token inválido');
  }
};
## Componentes Frontend
**Principais Componentes Vue**

**AuthGuard** - Proteção de rotas

**ProductList** - Listagem com paginação

**ProductForm** - Formulário CRUD

**WeatherWidget** - Integração com OpenWeatherMap

**Exemplo de Chamada API**
javascript
// Store Pinia (products.js)
import { defineStore } from 'pinia';
import axios from 'axios';

export const useProductStore = defineStore('products', {
  state: () => ({
    products: [],
    loading: false
  }),
  actions: {
    async fetchProducts() {
      this.loading = true;
      try {
        const { data } = await axios.get('/api/products');
        this.products = data;
      } catch (error) {
        console.error('Erro ao buscar produtos:', error);
      } finally {
        this.loading = false;
      }
    }
  }
});
