const express = require("express");

require("dotenv").config();
const productRoutes = require("./routes/productRoutes");
const employeeRoutes = require("./routes/employeeRoutes");

const app = express();
app.use(express.json());

app.use("/products", productRoutes);
app.use("/employees", employeeRoutes);

app.get("/", (req, res) => {
  res.json({
    message: "TechVibe REST API is running",
  });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
