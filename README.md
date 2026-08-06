# LCA Node.js Exercises - Week 3 Exercise 03

## Project Title

TechVibe REST API using Express, MySQL, and MVC

## Description

This project is a RESTful API developed for the Life Choices Academy Backend Web Development course.

The application uses the MVC (Model-View-Controller) architecture to manage products and employees stored in a MySQL database. The API is built with Express.js and connects to MySQL using the mysql2 package with environment variables managed by dotenv.

## Technologies Used

- Node.js
- Express.js
- MySQL
- mysql2
- dotenv
- Nodemon

## Project Structure

```
week3_ex03_nodejs_api/
│
├── config/
│   └── db.js
│
├── controllers/
│   ├── productController.js
│   └── employeeController.js
│
├── models/
│   ├── productModel.js
│   └── employeeModel.js
│
├── routes/
│   ├── productRoutes.js
│   └── employeeRoutes.js
│
├── .env
├── .gitignore
├── package.json
├── package-lock.json
└── server.js
```

## Features

### Products

- Get all products
- Get a product by ID
- Create a product
- Update a product
- Delete a product

### Employees

- Get all employees
- Get an employee by ID
- Create an employee
- Update an employee
- Delete an employee
- Get employees by department location using an INNER JOIN

## API Endpoints

### Products

| Method | Endpoint      |
| ------ | ------------- |
| GET    | /products     |
| GET    | /products/:id |
| POST   | /products     |
| PUT    | /products/:id |
| DELETE | /products/:id |

### Employees

| Method | Endpoint                        |
| ------ | ------------------------------- |
| GET    | /employees                      |
| GET    | /employees/:id                  |
| POST   | /employees                      |
| PUT    | /employees/:id                  |
| DELETE | /employees/:id                  |
| GET    | /employees/department/:location |

## Installation

Clone the repository:

```bash
git clone <repository-url>
```

Install dependencies:

```bash
npm install
```

Create a `.env` file:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=techvibe_db
DB_PORT=3307
```

Start the server:

```bash
node server.js
```

or

```bash
npm run dev
```

The API will run at:

```
http://localhost:3000
```

## Testing

The API was tested using Thunder Client/Postman.

All required CRUD endpoints were successfully tested.

## Author

Liam De Wet
