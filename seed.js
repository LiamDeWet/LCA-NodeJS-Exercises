//import the connection pool
const pool = require("./config/db");

async function seedDatabase() {
  try {
    await pool.execute(`
      INSERT INTO products (name, price, category)
      VALUES
      ('Boerewors', 89.99, 'Food'),
      ('Rooibos Tea', 45.50, 'Beverages'),
      ('Biltong', 129.99, 'Food'),
      ('Milk Tart', 65.00, 'Deserts'),
      ('Koeksisters', 39.99, 'Deserts')
    `);

    await pool.execute(`
      INSERT INTO employees (name, email, department)
      VALUES
      ('Sipho Dlamini', 'sipho@techvibe.co.za', 'Sales'),
      ('Liam De Wet', 'liam@techvibe.co.za', 'IT Support'),
      ('Emily Daniels ', 'emily@techvibe.co.za', 'Marketing'),
      ('Lyran Booys', 'lyran@techvibe.co.za', 'Finance'),
      ('Curwin Brown', 'curwin@techvibe.co.za', 'Human Resources')
    `);

    console.log("Database seeded successfully");
  } catch (error) {
    console.error("Error seeding the database:", error);
  } finally {
    await pool.end();
  }
}

seedDatabase();
