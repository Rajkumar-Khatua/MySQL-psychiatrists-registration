const express = require("express");
const bodyParser = require("body-parser");
const sequelize = require("./config/db");
const route = require("./routes/route");

// Create an Express application
const app = express();
// Parse requests of content-type - application/json
app.use(bodyParser.json());
// Parse requests of content-type - application/x-www-form-urlencoded (form data)
app.use("/uploads", express.static("uploads"));
// Use the route middleware for handling routes
app.use("/api", route);

// Set the port for the server to listen on
const PORT = process.env.PORT || 3000;

// Sync database without dropping data
sequelize
  .sync({ force: false })
  .then((result) => {
    console.log("Database synchronized");
  })
  .catch((err) => {
    console.log("Error synchronizing database:", err);
  });

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
