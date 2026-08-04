//this will connect us to MySQL
const mysql = require("mysql2/promise");

//this will load the environment variables from the .env file
require("dotenv").config();

//this is the connection pool
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

//export the pool
module.exports = pool;
