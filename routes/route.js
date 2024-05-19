const express = require("express");
const router = express.Router();
const patientController = require("../controllers/patientController");
const hospitalController = require("../controllers/hospitalController");

// Multer middleware for file upload
const multer = require("multer");
// Multer disk storage configuration for file upload (destination and filename)
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  // Set the filename of the uploaded file to be saved in the uploads folder with a unique name using the Date.now() function
  filename: function (req, file, cb) {
    // cb(null,  + "-" + file.originalname);
    cb(null, Date.now() + "-" + file.originalname);
  },
});
// Multer middleware for file upload with the specified storage configuration
const upload = multer({ storage });

// Routes for patient registration
router.post(
  "/register-patient",
  upload.single("photo"),
  patientController.registerPatient
);
// Routes for getting hospital details with associated psychiatrists and patients count
router.get("/hospital-details", hospitalController.getHospitalDetails);
// Routes for creating a new hospital in the database
router.post("/create-hospital", hospitalController.createHospital);

module.exports = router;
