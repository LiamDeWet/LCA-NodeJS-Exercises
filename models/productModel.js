const pool = require("../config/db");

//after importing the connection these are the functions i would need to perform CRUD operations on the products table in the database
async function getAllProducts() {
  try {
    const [rows] = await pool.execute("SELECT * FROM products");

    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function getProductById(id) {
  try {
    const [rows] = await pool.execute("SELECT * FROM products WHERE id = ?", [
      id,
    ]);
    return rows;
  } catch (error) {
    console.error(error);
  }
}

async function addProduct(name, price, category) {
  try {
    const [result] = await pool.execute(
      `INSERT INTO products
      (name, price, category)
      VALUES (?, ?, ?)`,
      [name, price, category],
    );
    return result;
  } catch (error) {
    console.error(error);
  }
}

async function updateProduct(id, name, price, category) {
  try {
    const [result] = await pool.execute(
      `UPDATE products
      SET name = ?, price = ?, category = ?
      WHERE id =?`,
      [name, price, category, id],
    );

    return result;
  } catch (error) {
    console.error(error);
  }
}

async function deleteProduct(id) {
  try {
    const [result] = await pool.execute("DELETE FROM products WHERE id = ?", [
      id,
    ]);
    return result;
  } catch (error) {
    console.error(error);
  }
}

module.exports = {
  getAllProducts,
  getProductById,
  addProduct,
  updateProduct,
  deleteProduct,
};
