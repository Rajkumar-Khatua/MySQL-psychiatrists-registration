const Hospital = require("../models/hospital");
const Psychiatrist = require("../models/psychiatrist");
const Patient = require("../models/patient");

// Get all hospitals with their psychiatrists and patients count details from the database  and return them as a JSON response to the client
exports.getHospitalDetails = async (req, res) => {
  // Get Hospital ID from the request body
  const { hospitalId } = req.body;

  // Find the hospital with the given ID from the database and include the Psychiatrists and Patients associated with it in the response.
  try {
    const hospital = await Hospital.findOne({
      where: { id: hospitalId },
      include: {
        model: Psychiatrist,
        include: {
          model: Patient,
        },
      },
    });

    // If the hospital with the given ID is not found, return a 404 Not Found response to the client.
    if (!hospital) {
      return res.status(404).json({ message: "Hospital not found!" });
    }

    // Map the details of each psychiatrist associated with the hospital, including the number of patients they have, and return the response to the client.
    const psychiatristDetails = hospital.Psychiatrists.map((psychiatrist) => ({
      id: psychiatrist.id,
      name: psychiatrist.name,
      patientsCount: psychiatrist.Patients.length,
    }));

    // Return the hospital name, total psychiatrist count, total patients count, and details of each psychiatrist associated with the hospital as a JSON response to the client.
    res.json({
      hospitalName: hospital.name,
      totalPsychiatristCount: hospital.Psychiatrists.length,
      totalPatientsCount: hospital.Psychiatrists.reduce(
        (total, psychiatrist) => total + psychiatrist.Patients.length,
        0
      ),
      psychiatrists: psychiatristDetails,
    });
    // If an error occurs during the database operation, return a 500 Internal Server Error response to the client.
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Create a new hospital in the database based on the name provided in the request body and return the created hospital as a JSON response to the client
exports.createHospital = async (req, res) => {
  const { name } = req.body;

  try {
    const hospital = await Hospital.create({ name });
    res.status(201).json(hospital);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
