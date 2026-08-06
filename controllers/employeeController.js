const {
  getAllEmployees,
  getEmployeeById,
  createEmployee,
  updateEmployee,
  deleteEmployee,
  getEmployeesByLocation,
} = require("../models/employeeModel");

// GET all
async function getEmployees(req, res) {
  try {
    const employees = await getAllEmployees();
    res.status(200).json(employees);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// GET one
async function getEmployee(req, res) {
  try {
    const employee = await getEmployeeById(req.params.id);

    if (employee.length === 0) {
      return res.status(404).json({ message: "Employee not found" });
    }

    res.status(200).json(employee[0]);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// POST
async function addEmployee(req, res) {
  try {
    const { name, email, department } = req.body;

    const result = await createEmployee(name, email, department);

    res.status(201).json({
      message: "Employee created successfully",
      result,
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// PUT
async function editEmployee(req, res) {
  try {
    const { name, email, department, department_id } = req.body;

    const result = await updateEmployee(
      req.params.id,
      name,
      email,
      department,
      department_id,
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        message: "Employee not found",
      });
    }

    res.status(200).json({
      message: "Employee updated successfully",
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// DELETE
async function removeEmployee(req, res) {
  try {
    const result = await deleteEmployee(req.params.id);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        message: "Employee not found",
      });
    }

    res.status(200).json({
      message: "Employee deleted successfully",
    });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// JOIN endpoint
async function employeesByLocation(req, res) {
  try {
    const employees = await getEmployeesByLocation(req.params.location);

    res.status(200).json(employees);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  getEmployees,
  getEmployee,
  addEmployee,
  editEmployee,
  removeEmployee,
  employeesByLocation,
};
