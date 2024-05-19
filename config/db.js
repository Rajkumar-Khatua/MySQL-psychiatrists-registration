const { Sequelize } = require("sequelize");

// Database connection
const sequelize = new Sequelize(
  // Database name
  "psychiatry_db",
  // Database username
  "psychiatry_user",
  // Database password
  "Rajkumar@2024",
  {
    // Database host
    host: "localhost",
    // Database dialect
    dialect: "mysql",
  }
);

module.exports = sequelize;
