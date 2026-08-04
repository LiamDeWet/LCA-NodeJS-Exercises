//the same as the production model
const pool = require("../config/db");

//the functions to perform CRUD operations on the employees table in the database
async function getAllEmployees() {
  try {
    const [rows] = await pool.execute("SELECT * FROM employees");

    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function getEmployeeById(id) {
  try {
    const [rows] = await pool.execute("SELECT * FROM employees WHERE id =?", [
      id,
    ]);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function addEmployee(name, email, department) {
  try {
    const [result] = await pool.execute(
      `INSERT INTO employees
            (name, email, department)
            VALUES (?, ?, ?)`,
      [name, email, department],
    );

    return result;
  } catch (error) {
    console.error(error);
  }
}

async function deleteEmployee(id) {
  try {
    const [result] = await pool.execute("DELETE FROM employees WHERE id = ?", [
      id,
    ]);

    return result;
  } catch (error) {
    console.error(error);
  }
}

//lastly export the functions
module.exports = {
  getAllEmployees,
  getEmployeeById,
  addEmployee,
  deleteEmployee,
};
