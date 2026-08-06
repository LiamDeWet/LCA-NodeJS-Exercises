const express = require("express");

const router = express.Router();

const {
  getEmployees,
  getEmployee,
  addEmployee,
  editEmployee,
  removeEmployee,
  employeesByLocation,
} = require("../controllers/employeeController");

router.get("/", getEmployees);

router.get("/department/:location", employeesByLocation);

router.get("/:id", getEmployee);

router.post("/", addEmployee);

router.put("/:id", editEmployee);

router.delete("/:id", removeEmployee);

module.exports = router;
