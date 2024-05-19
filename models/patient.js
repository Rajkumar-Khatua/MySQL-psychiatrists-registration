const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Psychiatrist = require("./psychiatrist");

// Define the Patient model and specify its attributes (fields) and data types using the Sequelize library
const Patient = sequelize.define("Patient", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  address: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      len: [10, 255],
    },
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      isEmail: true,
    },
  },
  phone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  photo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  psychiatristId: {
    type: DataTypes.INTEGER,
    references: {
      model: Psychiatrist,
      key: "id",
    },
  },
});

// The Psychiatrist and Patient models have a one-to-many relationship where a psychiatrist can have multiple patients, but a patient belongs to only one psychiatrist.
Psychiatrist.hasMany(Patient, { foreignKey: "psychiatristId" });
// The association between the Psychiatrist and Patient models is defined using the foreign key psychiatristId in the Patient model to associate patients with psychiatrists in the database.
Patient.belongsTo(Psychiatrist, { foreignKey: "psychiatristId" });

module.exports = Patient;
