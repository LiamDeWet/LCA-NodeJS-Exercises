# LCA Node.js Exercises

## Week 3 – Exercise 02: Node.js and MySQL

### Project Overview

This project demonstrates how to connect a Node.js application to a MySQL database using the `mysql2` package and environment variables managed with `dotenv`. The application performs CRUD (Create, Read, Update, Delete) operations on two database tables: **products** and **employees**.

### Technologies Used

* Node.js
* MySQL
* mysql2
* dotenv
* JavaScript (ES6)
* SQL

### Project Structure

```text
week3_ex02_nodejs_mysql/
│
├── config/
│   └── db.js
├── models/
│   ├── productModel.js
│   └── employeeModel.js
├── .gitignore
├── index.js
├── package.json
├── package-lock.json
├── seed.js
├── setup.sql
└── README.md
```

### Features

* Connects to a MySQL database using a connection pool.
* Uses environment variables to securely store database credentials.
* Creates and seeds the database with sample South African data.
* Performs CRUD operations on the **products** table:

  * Get all products
  * Get product by ID
  * Add a product
  * Update a product
  * Delete a product
* Performs CRUD operations on the **employees** table:

  * Get all employees
  * Get employee by ID
  * Add an employee
  * Delete an employee
* Uses asynchronous programming with `async`/`await`.
* Includes error handling using `try...catch`.

### Installation

1. Clone the repository.

2. Install dependencies:

```bash
npm install
```

3. Create a `.env` file in the project root:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=techvibe_db
DB_PORT=3307
```

4. Run the SQL setup script:

```bash
setup.sql
```

5. Seed the database:

```bash
node seed.js
```

6. Test the application:

```bash
node index.js
```

### Author

**Liam De Wet**

