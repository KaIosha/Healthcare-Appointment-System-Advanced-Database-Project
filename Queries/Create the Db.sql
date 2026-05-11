CREATE DATABASE HealthcareSystem;
GO
USE HealthcareSystem;
GO


-- 2. Create User Table (Supertype)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(11) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Email NVARCHAR(100) UNIQUE NOT NULL,
);

-- 3. Create Patient Table (Subtype)
CREATE TABLE Patients (
    PateintID INT PRIMARY KEY,
    FOREIGN KEY (PateintID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 4. Create Doctor Table (Subtype)
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Specialization NVARCHAR(100) NOT NULL,
    ConsultationFee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- 5. Create Appointment Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status NVARCHAR(20) ,
    FOREIGN KEY (PatientID) REFERENCES Patients(PateintID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    -- Prevents booking more doctors at the same time
    CONSTRAINT UQ_Doctor_Schedule UNIQUE (DoctorID, AppointmentDate, AppointmentTime)
);

-- 6. Create Prescription Table
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    AppointmentID INT NOT NULL,
    MedicationName NVARCHAR(100) NOT NULL,
    Instructions NVARCHAR(MAX),
    Dosage NVARCHAR(50),
    Duration NVARCHAR(50),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);