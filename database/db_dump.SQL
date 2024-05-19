-- Create Tables

-- Hospital Table to store hospital details like name and id of the hospital 
CREATE TABLE 'Hospitals'(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
)

-- Psychiatrists Table to store psychiatrist details like name and hospital_id
CREATE TABLE `Psychiatrists`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `hospital_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`hospital_id`) REFERENCES `Hospitals`(`id`)
)

-- Patients Table to store patient details like name, address, email, phone, password, photo, psychiatrist_id
CREATE TABLE `Patients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `photo` VARCHAR(255) NOT NULL,
  `psychiatristId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`psychiatristId`) REFERENCES `Psychiatrists` (`id`)
);

-- Insert data into Hospitals
INSERT INTO `Hospitals` (`id`, `name`) VALUES 
(1, 'Apollo Hospitals'),
(2, 'Jawaharlal Nehru Medical College and Hospital'),
(3, 'Indira Gandhi Institute of Medical Sciences (IGIMS)'),
(4, 'AIIMS - All India Institute Of Medical Science');


-- Insert data into Psychiatrists
INSERT INTO `Psychiatrists` (`id`, `name`, `hospitalId`) VALUES 
(1, 'Dr. John Doe', 1),
(2, 'Dr. Jane Smith', 1),
(3, 'Dr. Alex Johnson', 2),
(4, 'Dr. Emily Davis', 2),
(5, 'Dr. Michael Brown', 3),
(6, 'Dr. Jessica Wilson', 3),
(7, 'Dr. William Jones', 4),
(8, 'Dr. Olivia Garcia', 4);

-- Insert data into Patients
INSERT INTO `Patients` (`id`, `name`, `address`, `email`, `phone`, `password`, `photo`, `psychiatristId`) VALUES 
(1, 'John Patient', '123 Street', 'john.patient@example.com', '+1234567890', 'hashed_password', 'uploads/photo1.jpg', 1),
(2, 'Jane Patient', '456 Avenue', 'jane.patient@example.com', '+1234567891', 'hashed_password', 'uploads/photo2.jpg', 1),
(3, 'Alice Brown', '789 Road', 'alice.brown@example.com', '+1234567892', 'hashed_password', 'uploads/photo3.jpg', 2),
(4, 'Bob White', '101 Blvd', 'bob.white@example.com', '+1234567893', 'hashed_password', 'uploads/photo4.jpg', 2),
(5, 'Charlie Black', '102 Street', 'charlie.black@example.com', '+1234567894', 'hashed_password', 'uploads/photo5.jpg', 3),
(6, 'Daisy Green', '103 Avenue', 'daisy.green@example.com', '+1234567895', 'hashed_password', 'uploads/photo6.jpg', 3),
(7, 'Edward Red', '104 Road', 'edward.red@example.com', '+1234567896', 'hashed_password', 'uploads/photo7.jpg', 4),
(8, 'Fiona Blue', '105 Blvd', 'fiona.blue@example.com', '+1234567897', 'hashed_password', 'uploads/photo8.jpg', 4),
(9, 'George Yellow', '106 Street', 'george.yellow@example.com', '+1234567898', 'hashed_password', 'uploads/photo9.jpg', 1),
(10, 'Hannah Pink', '107 Avenue', 'hannah.pink@example.com', '+1234567899', 'hashed_password', 'uploads/photo10.jpg', 1),
(11, 'Ivy Orange', '108 Road', 'ivy.orange@example.com', '+1234567800', 'hashed_password', 'uploads/photo11.jpg', 2),
(12, 'Jack Purple', '109 Blvd', 'jack.purple@example.com', '+1234567801', 'hashed_password', 'uploads/photo12.jpg', 2),
(13, 'Katie Cyan', '110 Street', 'katie.cyan@example.com', '+1234567802', 'hashed_password', 'uploads/photo13.jpg', 3),
(14, 'Leo Magenta', '111 Avenue', 'leo.magenta@example.com', '+1234567803', 'hashed_password', 'uploads/photo14.jpg', 3),
(15, 'Mia Gray', '112 Road', 'mia.gray@example.com', '+1234567804', 'hashed_password', 'uploads/photo15.jpg', 4),
(16, 'Nina Lime', '113 Blvd', 'nina.lime@example.com', '+1234567805', 'hashed_password', 'uploads/photo16.jpg', 4),
(17, 'Oscar Maroon', '114 Street', 'oscar.maroon@example.com', '+1234567806', 'hashed_password', 'uploads/photo17.jpg', 1),
(18, 'Paula Gold', '115 Avenue', 'paula.gold@example.com', '+1234567807', 'hashed_password', 'uploads/photo18.jpg', 1),
(19, 'Quinn Silver', '116 Road', 'quinn.silver@example.com', '+1234567808', 'hashed_password', 'uploads/photo19.jpg', 2),
(20, 'Ruby Bronze', '117 Blvd', 'ruby.bronze@example.com', '+1234567809', 'hashed_password', 'uploads/photo20.jpg', 2),
(21, 'Steve Olive', '118 Street', 'steve.olive@example.com', '+1234567810', 'hashed_password', 'uploads/photo21.jpg', 3),
(22, 'Tina Navy', '119 Avenue', 'tina.navy@example.com', '+1234567811', 'hashed_password', 'uploads/photo22.jpg', 3),
(23, 'Uma Teal', '120 Road', 'uma.teal@example.com', '+1234567812', 'hashed_password', 'uploads/photo23.jpg', 4),
(24, 'Victor Peach', '121 Blvd', 'victor.peach@example.com', '+1234567813', 'hashed_password', 'uploads/photo24.jpg', 4),
(25, 'Wendy Plum', '122 Street', 'wendy.plum@example.com', '+1234567814', 'hashed_password', 'uploads/photo25.jpg', 1),
(26, 'Xander Indigo', '123 Avenue', 'xander.indigo@example.com', '+1234567815', 'hashed_password', 'uploads/photo26.jpg', 1),
(27, 'Yara Coral', '124 Road', 'yara.coral@example.com', '+1234567816', 'hashed_password', 'uploads/photo27.jpg', 2),
(28, 'Zack Azure', '125 Blvd', 'zack.azure@example.com', '+1234567817', 'hashed_password', 'uploads/photo28.jpg', 2),
(29, 'Amber Mint', '126 Street', 'amber.mint@example.com', '+1234567818', 'hashed_password', 'uploads/photo29.jpg', 3),
(30, 'Ben Mint', '127 Avenue', 'ben.mint@example.com', '+1234567819', 'hashed_password', 'uploads/photo30.jpg', 3),
(31, 'Cara Mint', '128 Road', 'cara.mint@example.com', '+1234567820', 'hashed_password', 'uploads/photo31.jpg', 4),
(32, 'Dan Mint', '129 Blvd', 'dan.mint@example.com', '+1234567821', 'hashed_password', 'uploads/photo32.jpg', 4),
(33, 'Ella Mint', '130 Street', 'ella.mint@example.com', '+1234567822', 'hashed_password', 'uploads/photo33.jpg', 1),
(34, 'Finn Mint', '131 Avenue', 'finn.mint@example.com', '+1234567823', 'hashed_password', 'uploads/photo34.jpg', 1),
(35, 'Grace Mint', '132 Road', 'grace.mint@example.com', '+1234567824', 'hashed_password', 'uploads/photo35.jpg', 2),
(36, 'Henry Mint', '133 Blvd', 'henry.mint@example.com', '+1234567825', 'hashed_password', 'uploads/photo36.jpg', 2),
(37, 'Isla Mint', '134 Street', 'isla.mint@example.com', '+1234567826', 'hashed_password', 'uploads/photo37.jpg', 3),
(38, 'Jack Mint', '135 Avenue', 'jack.mint@example.com', '+1234567827', 'hashed_password', 'uploads/photo38.jpg', 3),
(39, 'Kara Mint', '136 Road', 'kara.mint@example.com', '+1234567828', 'hashed_password', 'uploads/photo39.jpg', 4),
(40, 'Leo Mint', '137 Blvd', 'leo.mint@example.com', '+1234567829', 'hashed_password', 'uploads/photo40.jpg', 4),
(41, 'Mia Mint', '138 Street', 'mia.mint@example.com', '+1234567830', 'hashed_password', 'uploads/photo41.jpg', 1),
(42, 'Nina Mint', '139 Avenue', 'nina.mint@example.com', '+1234567831', 'hashed_password', 'uploads/photo42.jpg', 1),
(43, 'Omar Mint', '140 Road', 'omar.mint@example.com', '+1234567832', 'hashed_password', 'uploads/photo43.jpg', 2),
(44, 'Pia Mint', '141 Blvd', 'pia.mint@example.com', '+1234567833', 'hashed_password', 'uploads/photo44.jpg', 2),
(45, 'Quinn Mint', '142 Street', 'quinn.mint@example.com', '+1234567834', 'hashed_password', 'uploads/photo45.jpg', 3),
(46, 'Rita Mint', '143 Avenue', 'rita.mint@example.com', '+1234567835', 'hashed_password', 'uploads/photo46.jpg', 3),
(47, 'Sam Mint', '144 Road', 'sam.mint@example.com', '+1234567836', 'hashed_password', 'uploads/photo47.jpg', 4),
(48, 'Tina Mint', '145 Blvd', 'tina.mint@example.com', '+1234567837', 'hashed_password', 'uploads/photo48.jpg', 4),
(49, 'Uma Mint', '146 Street', 'uma.mint@example.com', '+1234567838', 'hashed_password', 'uploads/photo49.jpg', 1),
(50, 'Vic Mint', '147 Avenue', 'vic.mint@example.com', '+1234567839', 'hashed_password', 'uploads/photo50.jpg', 1);

