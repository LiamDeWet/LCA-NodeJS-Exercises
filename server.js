//calling the express library from node modules

const express = require("express");

//this will be the root app that the rest of the code uses
const app = express();

//now to enable JSON
app.use(express.json());

//the routes of the app
//GET Products
app.get("/products", (req, res) => {
  res.json({
    message: "This is the GET products route",
  });
});

//POST products
app.post("/products", (req, res) => {
  res.json({
    message: "This is the POST products route, a new product was added",
  });
});

//PUT products
app.put("/products", (req, res) => {
  res.json({
    message: "This is the PUT products route, a product was fully updated",
  });
});

//PATCH products
app.patch("/products", (req, res) => {
  res.json({
    message:
      "This is the PATCH products route, a product was partially updated",
  });
});

//DELETE products
app.delete("/products", (req, res) => {
  res.json({
    message: "This is the DELETE products route, a product was removed",
  });
});

//now for the other route of employees

// GET Employees
app.get("/employees", (req, res) => {
  res.json({
    message: "This is the GET employees route",
  });
});

// POST Employees
app.post("/employees", (req, res) => {
  res.json({
    message: "This is the POST employees route, a new employee was added",
  });
});

// PUT Employees
app.put("/employees", (req, res) => {
  res.json({
    message: "This is the PUT employees route, an employee was fully updated",
  });
});

// PATCH Employees
app.patch("/employees", (req, res) => {
  res.json({
    message:
      "This is the PATCH employees route, an employee was partially updated",
  });
});

// DELETE Employees
app.delete("/employees", (req, res) => {
  res.json({
    message: "This is the DELETE employees route, an employee was removed",
  });
});

//this will start the serrver
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
