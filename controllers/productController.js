//the main controller to recieve http requests with status codes
//import first
const {
  getAllProducts,
  getProductById,
  createProduct,
  updateProduct,
  deleteProduct,
} = require("../models/productModel");

async function getProducts(req, res) {
  try {
    const products = await getAllProducts();
    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

async function getProduct(req, res) {
  try {
    const product = await getProductById(req.params.id);
    if (product.length === 0) {
      return res.status(404).json({ message: "Product not fount" });
    }

    res.status(200).json(product[0]);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

async function addProduct(req, res) {
  try {
    const { name, price, category } = req.body;
    const result = await createProduct(name, price, category);

    res.status(201).json({
      message: "Product created successfully",
      result,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

async function editProduct(req, res) {
  try {
    const { name, price, category } = req.body;
    const result = await updateProduct(req.params.id, name, price, category);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.status(200).json({
      message: "Product updated successfully",
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

async function removeProduct(req, res) {
  try {
    const result = await deleteProduct(req.params.id);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Product not found" });
    }

    res.status(200).json({ message: "Product deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  getProducts,
  getProduct,
  addProduct,
  editProduct,
  removeProduct,
};
