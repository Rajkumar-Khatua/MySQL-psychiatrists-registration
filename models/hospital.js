const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");

// Define the Hospital model and specify its attributes (fields) and data types using the Sequelize library
const Hospital = sequelize.define("Hospital", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = Hospital;
