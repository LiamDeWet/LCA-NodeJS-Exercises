//import all functions
const {
  getAllProducts,
  getProductById,
  addProduct,
  updateProduct,
  deleteProduct,
} = require("./models/productModel");

const {
  getAllEmployees,
  getEmployeeById,
  addEmployee,
  deleteEmployee,
} = require("./models/employeeModel");

//test
async function testDatabase() {
  try {
    console.log("PRODUCTS");
    console.log(await getAllProducts());
    console.log(await getProductById(1));
    console.log(await addProduct("Laptop", 15999.99, "Electronics"));
    console.log(await getAllProducts());
    console.log(await updateProduct(1, "Spicy Boerewors", 99.99, "Food"));
    console.log(await getProductById(1));
    console.log(await deleteProduct(6));
    console.log(await getAllProducts());

    console.log("EMPLOYEES");
    console.log(await getAllEmployees());

    console.log(await getEmployeeById(1));

    console.log(
      await addEmployee("Amy Lee", "amy@techvibe.co.za", "Management"),
    );
    console.log(await getAllEmployees());

    console.log(await deleteEmployee(6));

    console.log(await getAllEmployees());
  } catch (error) {
    console.error(error);
  }
}

testDatabase();
