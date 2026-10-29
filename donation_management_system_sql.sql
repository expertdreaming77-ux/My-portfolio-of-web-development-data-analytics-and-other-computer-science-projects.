-- ===========================
-- 0️⃣ Use Database
-- ===========================
CREATE DATABASE IF NOT EXISTS Project;
USE Project;

-- ===========================
-- 1️⃣ Drop old tables if exist
-- ===========================
DROP TABLE IF EXISTS Medicine;
DROP TABLE IF EXISTS Food;
DROP TABLE IF EXISTS Education;
DROP TABLE IF EXISTS Money;
DROP TABLE IF EXISTS Blood;
DROP TABLE IF EXISTS Person;

-- ===========================
-- 2️⃣ Create Person Table (Master)
-- ===========================
CREATE TABLE Person (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50),
    Address VARCHAR(100)
);

-- ===========================
-- 3️⃣ Create Relational Tables
-- ===========================

-- Blood Table
CREATE TABLE Blood (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    BloodGroup VARCHAR(5),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

-- Money / Donation Table
CREATE TABLE Money (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    Occupation VARCHAR(50),
    Amount INT,
    BankName VARCHAR(20),
    Date DATE,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

-- Education Table
CREATE TABLE Education (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    Class VARCHAR(50),
    CourseName VARCHAR(50),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

-- Food Table
CREATE TABLE Food (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    Price INT,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

-- Medicine Table
CREATE TABLE Medicine (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    DiseaseName VARCHAR(50),
    MedicineName VARCHAR(50),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

-- ===========================
-- 4️⃣ Insert Persons (Unique)
-- ===========================
INSERT INTO Person (Name, Phone, Email, Address) VALUES
('Ali','03004567','ali@gmail.com','UAE'),
('John Smith','038977','john@gmail.com','USA'),
('Maria Garcia','03222213','maria@gmail.com','Spain'), 
('Rahul Kumar','03222245','rahul@gmail.com','India'),
('Sara Lee','03245677788','sara@gmail.com','UK'),
('Chen Wei','03456789','chen@gmail.com','China'),
('Noah','0321345','noah@gmail.com','Gujranwala'),
('Liam','034444444','liam@gmail.com','Karachi'),
('Ethan','03225555','ethan@gmail.com','Lahore'), 
('Omar','0326789','omar@gmail.com','India'),
('Alena','032457777','alena@gmail.com','Model town'),
('Lena','034500009','lena@gmail.com','Satelite town'),
('Ali Hassan','03444444','ali_hassan@gmail.com','Islamabad'),
('Emma Wilson','03555555','emma@gmail.com','Australia'),
('Noah Miller','0322222','noah_miller@gmail.com','USA'), 
('Sophia Taylor','032111111','sophia@gmail.com','UK'),
('Liam Anderson','036678889','liam_a@gmail.com','Sweden'), 
('Olivia Martin','039876543','olivia@gmail.com','France');

-- ===========================
-- 5️⃣ Insert Blood Data
-- ===========================
INSERT INTO Blood (PersonID, BloodGroup)
SELECT PersonID, 'A-' FROM Person WHERE Name='Ali'
UNION ALL
SELECT PersonID, 'A+' FROM Person WHERE Name='John Smith'
UNION ALL
SELECT PersonID, 'A-' FROM Person WHERE Name='Maria Garcia'
UNION ALL
SELECT PersonID, 'O-' FROM Person WHERE Name='Rahul Kumar'
UNION ALL
SELECT PersonID, 'B+' FROM Person WHERE Name='Sara Lee'
UNION ALL
SELECT PersonID, 'B-' FROM Person WHERE Name='Chen Wei';

-- ===========================
-- 6️⃣ Insert Money Data
-- ===========================
INSERT INTO Money (PersonID, Occupation, Amount, BankName, Date)
SELECT PersonID, 'Teacher','12000','Meezan','2025-01-01' FROM Person WHERE Name='Noah'
UNION ALL
SELECT PersonID, 'Driver','14000','National','2017-07-17' FROM Person WHERE Name='Liam'
UNION ALL
SELECT PersonID, 'Guard','13000','ABL','2018-08-12' FROM Person WHERE Name='Ethan'
UNION ALL
SELECT PersonID, 'House Helper','24000','UBL','2009-09-11' FROM Person WHERE Name='Omar'
UNION ALL
SELECT PersonID, 'Nanny','56000','MCB','2004-09-05' FROM Person WHERE Name='Alena'
UNION ALL
SELECT PersonID, 'Tailor','78000','HBL','2003-02-04' FROM Person WHERE Name='Lena';

-- ===========================
-- 7️⃣ Insert Education Data
-- ===========================
INSERT INTO Education (PersonID, Class, CourseName)
SELECT PersonID, '10','Science' FROM Person WHERE Name='Ali Hassan'
UNION ALL
SELECT PersonID, '9','Urdu' FROM Person WHERE Name='Emma Wilson'
UNION ALL
SELECT PersonID, '7','Maths' FROM Person WHERE Name='Noah Miller'
UNION ALL
SELECT PersonID, '6','English' FROM Person WHERE Name='Sophia Taylor'
UNION ALL
SELECT PersonID, '5','QuranPak' FROM Person WHERE Name='Liam Anderson'
UNION ALL
SELECT PersonID, '11','Stat' FROM Person WHERE Name='Olivia Martin';

-- ===========================
-- 8️⃣ Insert Food Data
-- ===========================
INSERT INTO Food (PersonID, Price)
SELECT PersonID, 1200 FROM Person WHERE Name='Ali'
UNION ALL
SELECT PersonID, 1300 FROM Person WHERE Name='John Smith'
UNION ALL
SELECT PersonID, 1500 FROM Person WHERE Name='Maria Garcia'
UNION ALL
SELECT PersonID, 7800 FROM Person WHERE Name='Rahul Kumar'
UNION ALL
SELECT PersonID, 2300 FROM Person WHERE Name='Sara Lee'
UNION ALL
SELECT PersonID, 4500 FROM Person WHERE Name='Chen Wei';

-- ===========================
-- 9️⃣ Insert Medicine Data
-- ===========================
INSERT INTO Medicine (PersonID, DiseaseName, MedicineName)
SELECT PersonID, 'Fever','Panadol' FROM Person WHERE Name='Ali Hassan'
UNION ALL
SELECT PersonID, 'Flu','Rigix' FROM Person WHERE Name='Emma Wilson'
UNION ALL
SELECT PersonID, 'Headache','Brufin' FROM Person WHERE Name='Noah Miller'
UNION ALL
SELECT PersonID, 'StomachPain','Gaviscon' FROM Person WHERE Name='Sophia Taylor'
UNION ALL
SELECT PersonID, 'Diarrhea','ORS' FROM Person WHERE Name='Liam Anderson'
UNION ALL
SELECT PersonID, 'Cough','Benylin' FROM Person WHERE Name='Olivia Martin';