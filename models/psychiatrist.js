const { DataTypes } = require("sequelize");
const sequelize = require("../config/db");
const Hospital = require("./hospital");

const Psychiatrist = sequelize.define("Psychiatrist", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  hospitalId: {
    type: DataTypes.INTEGER,
    references: {
      model: Hospital,
      key: "id",
    },
  },
});

// The Hospital and Psychiatrist models have a one-to-many relationship where a hospital can have multiple psychiatrists, but a psychiatrist belongs to only one hospital.
Hospital.hasMany(Psychiatrist, { foreignKey: "hospitalId" });
// The association between the Hospital and Psychiatrist models is defined using the foreign key hospitalId in the Psychiatrist model to associate psychiatrists with hospitals in the database.
Psychiatrist.belongsTo(Hospital, { foreignKey: "hospitalId" });

module.exports = Psychiatrist;
