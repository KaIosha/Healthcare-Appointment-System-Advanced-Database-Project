--Total Revenue for Drs at one day
SELECT 
    U.FullName, 
    A.AppointmentDate, 
    SUM(D.ConsultationFee) AS TotalRevenue
FROM Doctors D
JOIN Users U ON D.DoctorID = U.UserID
JOIN Appointments A ON D.DoctorID = A.DoctorID
WHERE A.AppointmentDate = '2026-05-01'
GROUP BY U.FullName, A.AppointmentDate;


--Clinic Schedule in  2026-05-01
SELECT 
    A.AppointmentID, 
    U_P.FullName AS PatientName, 
    U_D.FullName AS DoctorName, 
    D.Specialization,
    A.AppointmentTime, 
    A.Status
FROM Appointments A
JOIN Users U_P ON A.PatientID = U_P.UserID
JOIN Doctors D ON A.DoctorID = D.DoctorID
JOIN Users U_D ON D.DoctorID = U_D.UserID
WHERE A.AppointmentDate = '2026-05-01';


--Khaled Omar History
SELECT 
    U.FullName AS Patient,
    P.MedicationName, 
    P.Dosage, 
    A.AppointmentDate,
    U_D.FullName AS PrescribingDoctor
FROM Prescriptions P
JOIN Appointments A ON P.AppointmentID = A.AppointmentID
JOIN Users U ON A.PatientID = U.UserID
JOIN Users U_D ON A.DoctorID = U_D.UserID
WHERE U.FullName = 'Khaled Omar';


--Doctor Revenue Summary
SELECT 
    U.FullName AS DoctorName, 
    COUNT(A.AppointmentID) AS AppointmentsCount,
    SUM(D.ConsultationFee) AS TotalRevenue
FROM Doctors D
JOIN Users U ON D.DoctorID = U.UserID
JOIN Appointments A ON D.DoctorID = A.DoctorID
WHERE A.Status = 'Completed'
GROUP BY U.FullName;
----------------------------------------------------------------------------------------------------------

--Transaction
BEGIN TRANSACTION;
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
    VALUES (15, 1, '2026-06-01', '10:00:00', 'Scheduled');
COMMIT TRANSACTION;
    PRINT 'Appointment booked successfully.';


