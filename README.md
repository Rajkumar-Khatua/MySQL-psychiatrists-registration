# Psychiatric Patient Management System

This repository contains the codebase for a Psychiatric Patient Management System. The system is designed to manage hospitals, psychiatrists, and patients, including their respective details and associations. It provides a REST API for interacting with the data.

## Table of Contents

- Introduction(#introduction)
- Setup and Installation (#setup-and-installation)
- Major Libraries/ Frameworks Used (#major-libraries-frameworks-used)
- API Endpoints (#api-endpoints)
- Database Schema/ Dump Database (#database-schema-dump-database)
- Postman Collection (#postman-collection)
- Additional Infirormation (#additional-information)

## Introduction

The Psychiatric Patient Management System is built using Node.js, Express, Sequelize ORM, and MySQL. The system allows for the creation, retrieval, updating, and deletion of records for hospitals, psychiatrists, and patients.

## Setup and Installation

To run the system, you need to have Node.js and MySQL installed on your machine. Follow the steps below to set up the system:

1. Clone the repository:

```bash
git clone https://github.com/Rajkumar-Khatua/MySQL-psychiatrists-registration.git
cd MySQL-psychiatrists-registration
```

2. Install the dependencies:

```bash
npm install
```

3. Set up the database:

Ensure you have MySQL installed and running. Create a database named `psychiatry_db`.

```sql
CREATE DATABASE psychiatry_db;
```

4. Configure the database connection:

Update the `config/db.js` file with your MySQL database credentials.

5. Run database migrations and seed data to populate the database with initial data (hospitals, psychiatrists, and patients) using the following command in the terminal (50+ records) of Patients, for testing purpose only. You can also add more records in the seed.js file.:

- Or The database schema and a dump with at least 50 records can be found in the `database` folder of this repository. The dump file is named `db_dump.sql`.

- Run below command in terminal to import the dump file (By run this command, you will get 50+ records of Patients, Hospitals, and Psychiatrists) Note: Before running this command, make sure you have created the database `psychiatry_db`:

```bash
node seed.js
```

6. Start the server:

```bash
npm start
```

The application will be available at `http://localhost:3000`.

## Major Libraries/ Frameworks Used

The following libraries and frameworks were used in building the system:

- Node.js - JavaScript runtime environment for running the server-side code.
- Express - Web application framework for Node.js, used for building the REST API.
- Sequelize - Promise-based Node.js ORM for interacting with the MySQL database.
- MySQL - Relational database management system used for storing the data.
- Body-parser - Middleware for parsing incoming request bodies.
- Nodemon - Utility that automatically restarts the server when changes are made to the code.
- bcrypt - Library for hashing passwords.
- Multer - Middleware for handling file uploads.

## API Endpoints

The system provides the following API endpoints:

### 1. New Patient Registration

- Endpoint:` POST /patients`
- Description: Register a new patient
- GoTo Postman -> Select Body -> Select form-data -> Add Key and Value -> Select File for Photo -> With others details as mention below

- Request Body:

```bash
{
     "name": (Text) "John Doe",
     "address": (Text) "123 Main Street, City",
     "email": (Text) "john.doe@example.com",
     "phone": (Text) "+1234567890",
     "password": (Text) "Password1",
     "photo": (File) "uploads/photo.jpg",
     "psychiatristId": (Text) 1
     }

```

Validation:

```bash
- Name: Required, String
- Address: Required, String
- Email: Required, String, Unique
- Phone: Required, String (Must be 10 digits with country code)
- Password: Required, String (Minimum 8 characters, at least one uppercase letter, one lowercase letter, one number)
- Photo: Required, File (JPG, PNG)
```

- Response Structure:

```bash
{
    "message": "Patient registered successfully",
    "patient": {
        "id": 51,
        "photo": "uploads/1716094711148-21286501.jpg",
        "name": "Raj khatua",
        "address": "37 Sector, Gurgaon",
        "email": "raj@gmail.com",
        "phone": "+918159882654",
        "password": "$2a$10$BAToB8Mh1gsOZCWAzi75y.zK7sU3aEaBgqFTptIBz.uKCkYV2NKCa",
        "psychiatristId": "1",
        "updatedAt": "2024-05-19T04:58:31.256Z",
        "createdAt": "2024-05-19T04:58:31.256Z"
    },
    "photoUploaded": true
}
```

2. Fetch Psychiatrists and Patients for a Hospital

   - Endpoint: GET `/hospital-details`
   - Description: Get all psychiatrists and patients associated with a hospital
   - GoTo Postman -> Select Body -> Select raw -> Select JSON -> Add Key and Value as mention below
   - Request Body:

```bash
        {
        "hospitalId": 1
        }
```

- Response Structure:

```bash
  {
    "hospitalName": "Apollo Hospitals",
    "totalPsychiatristCount": 2,
    "totalPatientsCount": 26,
    "psychiatrists": [
        {
            "id": 1,
            "name": "Dr. Priya Sharma",
            "patientsCount": 14
        },
        {
            "id": 2,
            "name": "Dr. Rohit Kapoor",
            "patientsCount": 12
        }
    ]
}
```

## Database Schema/ Dump Database

The database schema and a dump with at least 50 records can be found in the `database` folder of this repository. The dump file is named `db_dump.sql`.

## Postman Collection

A Postman collection with sample requests for the API endpoints is available in the `postman` folder of this repository. You can import this collection into Postman to test the API endpoints.

- [<img src="https://run.pstmn.io/button.svg" alt="Run In Postman" style="width: 128px; height: 32px;">](https://god.gw.postman.com/run-collection/20758646-f80115bf-de76-4cf7-bef3-dd3ea2e7ccbd?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D20758646-f80115bf-de76-4cf7-bef3-dd3ea2e7ccbd%26entityType%3Dcollection%26workspaceId%3Dd1cf8a52-ae05-4b1b-93c7-b1dad2f66d0c)

## Additional Information

- The system uses Sequelize ORM for interacting with the MySQL database. The models for hospitals, psychiatrists, and patients are defined in the `models` folder.

- The system uses Express to define the routes for the API endpoints. The routes are defined in the `routes` folder.

- The system uses bcrypt for hashing passwords before storing them in the database.

- The system uses Multer for handling file uploads. The uploaded files are stored in the `uploads` folder.

- The system uses the `config/db.js` file to configure the database connection.

- The system uses the `seed.js` file to populate the database with initial data (hospitals, psychiatrists, and patients).

- The system uses the `index.js` file as the entry point for the application.
