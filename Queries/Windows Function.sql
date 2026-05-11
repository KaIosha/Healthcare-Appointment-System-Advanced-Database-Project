SELECT 
    U.FullName, 
    D.Specialization, 
    D.ConsultationFee,
    RANK() OVER (PARTITION BY D.Specialization ORDER BY D.ConsultationFee DESC) AS FeeRank
FROM Doctors D
JOIN Users U ON D.DoctorID = U.UserID;


SELECT 
    U.FullName AS PatientName,
    A.AppointmentDate,
    A.Status,
    ROW_NUMBER() OVER (PARTITION BY A.PatientID ORDER BY A.AppointmentDate ASC) AS VisitNumber
FROM Appointments A
JOIN Users U ON A.PatientID = U.UserID;

