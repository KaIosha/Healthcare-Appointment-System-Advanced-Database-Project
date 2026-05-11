
CREATE TABLE Dim_Patients (
    PatientKey INT PRIMARY KEY IDENTITY(1,1),
    OriginalUserID INT, --  link with main Users table
    PatientName NVARCHAR(100),
    Gender NVARCHAR(10)
);


CREATE TABLE Dim_Doctors (
    DoctorKey INT PRIMARY KEY IDENTITY(1,1),
    OriginalDoctorID INT, --  link with main Doctors table
    DoctorName NVARCHAR(100),
    Specialty NVARCHAR(50)
);

CREATE TABLE Dim_Date (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    DayOfWeek NVARCHAR(10),
    Month INT,
    MonthName NVARCHAR(10),
    Quarter INT,
    Year INT
);

CREATE TABLE Fact_Appointments (
    FactKey INT PRIMARY KEY IDENTITY(1,1),
    PatientKey INT,
    DoctorKey INT,
    AppointmentDate DATE,
	DateKey INT,
    FeeAmount DECIMAL(10,2), --  measure 
    FOREIGN KEY (PatientKey) REFERENCES Dim_Patients(PatientKey),
    FOREIGN KEY (DoctorKey) REFERENCES Dim_Doctors(DoctorKey),
	FOREIGN KEY (DateKey)    REFERENCES Dim_Date(DateKey)
);



---------------------------ETL--------------------------------------------------

-- Load Patients 
INSERT INTO Dim_Patients (OriginalUserID, PatientName, Gender)
SELECT U.UserID, U.FullName, U.Gender 
FROM Users U
JOIN Patients P ON U.UserID = P.PateintID;

-- Load Doctors 
INSERT INTO Dim_Doctors (OriginalDoctorID, DoctorName, Specialty)
SELECT D.DoctorID, U.FullName, D.Specialization 
FROM Doctors D 
JOIN Users U ON D.DoctorID = U.UserID;


-- Load Date dimension from real appointment dates
INSERT INTO Dim_Date (DateKey, FullDate, DayOfWeek, Month, MonthName, Quarter, Year)
SELECT DISTINCT
    CAST(FORMAT(AppointmentDate, 'yyyyMMdd') AS INT),
    AppointmentDate,
    DATENAME(WEEKDAY, AppointmentDate),
    MONTH(AppointmentDate),
    DATENAME(MONTH, AppointmentDate),
    DATEPART(QUARTER, AppointmentDate),
    YEAR(AppointmentDate)
FROM Appointments;

--  Fill the Fact Table
INSERT INTO Fact_Appointments (PatientKey, DoctorKey, DateKey, AppointmentDate, FeeAmount)
SELECT 
    DP.PatientKey,
    DD.DoctorKey,
    CAST(FORMAT(A.AppointmentDate, 'yyyyMMdd') AS INT),
    A.AppointmentDate,
    D.ConsultationFee
FROM Appointments A
JOIN Dim_Patients DP ON A.PatientID = DP.OriginalUserID
JOIN Dim_Doctors  DD ON A.DoctorID  = DD.OriginalDoctorID
JOIN Doctors D       ON A.DoctorID  = D.DoctorID;


SELECT * FROM Fact_Appointments;
SELECT * FROM Dim_Doctors;
SELECT *FROM Dim_Patients;
SELECT * FROM Dim_Date;



-------------------------------------------------------------
--Analytical Queries


--1-Revenue by Specialty
SELECT D.Specialty, SUM(F.FeeAmount) AS TotalRevenue
FROM Fact_Appointments F
JOIN Dim_Doctors D ON F.DoctorKey = D.DoctorKey
GROUP BY D.Specialty
ORDER BY TotalRevenue DESC;


--2- Appointement by Gender
SELECT P.Gender, COUNT(F.FactKey) AS [Number of Visits]
FROM Fact_Appointments F
JOIN Dim_Patients P ON F.PatientKey = P.PatientKey
GROUP BY P.Gender;


--3-Most Busy Doctors
SELECT D.DoctorName, COUNT(F.FactKey) AS [Total Appointments]
FROM Fact_Appointments F
JOIN Dim_Doctors D ON F.DoctorKey = D.DoctorKey
GROUP BY D.DoctorName
ORDER BY [Total Appointments] DESC;




