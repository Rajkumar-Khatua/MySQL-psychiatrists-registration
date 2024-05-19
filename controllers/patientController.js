const bcrypt = require("bcryptjs");
const Patient = require("../models/patient");
const Psychiatrist = require("../models/psychiatrist");

// Register a new patient in the database and return the created patient as a JSON response to the client
exports.registerPatient = async (req, res) => {
  try {
    // Log the request body and file details to the console
    console.log("Request Body:", req.body);
    console.log("Request File:", req.file);

    // Extract the required fields from the request body
    const { name, address, email, password, phone, psychiatristId } = req.body;

    // Check if any of the required fields are missing
    if (!name || !address || !email || !password || !req.file) {
      return res.status(400).json({ message: "All fields are required!" });
    }

    // Extract the file path of the uploaded photo
    const photo = req.file.path;

    // Find the psychiatrist with the given ID from the database
    const psychiatrist = await Psychiatrist.findByPk(psychiatristId);
    // If the psychiatrist with the given ID is not found, return a 404 Not Found response to the client.
    if (!psychiatrist) {
      return res.status(404).json({ message: "Psychiatrist not found!" });
    }
    // Check if the patient with the given email already exists in the database
    const existingPatient = await Patient.findOne({ where: { email } });
    if (existingPatient) {
      return res.status(400).json({ message: "Patient already exists!" });
    }
    // Valid password regex (Password should be 8 to 15 characters long and contain at least one lowercase letter, one uppercase letter, and one number)
    const passwordRegex =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,15}$/;
    const passwordIsValid = passwordRegex.test(password);
    console.log("Password Valid:", passwordIsValid);

    // Check if the password meets the criteria (8 to 15 characters, one lowercase, one uppercase, one number)
    if (!passwordIsValid) {
      return res
        .status(400)
        .json({ message: "Password does not meet criteria!" });
    }

    // Valid phone number regex (Phone number (should be at least 10 number + country code)
    // Example: +919876543210 (India)
    const phoneRegex = /^\+\d{10,15}$/;
    const phoneIsValid = phoneRegex.test(phone);
    console.log("Phone Valid:", phoneIsValid);

    // Check if the phone number is valid
    if (!phoneIsValid) {
      return res.status(400).json({ message: "Phone number is not valid!" });
    }

    // Hash the password using bcrypt
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new patient in the database with the provided details
    const newPatient = await Patient.create({
      photo,
      name,
      address,
      email,
      phone,
      password: hashedPassword,
      psychiatristId,
    });

    // Return a success response to the client with the details of the created patient
    res.status(201).json({
      message: "Patient registered successfully",
      patient: newPatient,
      photoUploaded: true,
    });
    // If an error occurs during the database operation, return a 500 Internal Server Error response to the client.
  } catch (error) {
    res.status(500).json({
      error: "An error occurred while registering the patient!",
      message: error.message,
    });
  }
};
