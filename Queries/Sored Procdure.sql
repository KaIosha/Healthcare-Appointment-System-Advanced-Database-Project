CREATE PROCEDURE sp_BookAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppDate DATE,
    @AppTime TIME
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Check if the Doctor is  busy at that time 
    IF EXISTS (SELECT 1 FROM Appointments 
               WHERE DoctorID = @DoctorID 
               AND AppointmentDate = @AppDate 
               AND AppointmentTime = @AppTime)
    BEGIN
        PRINT 'Error: This doctor already has an appointment at this time.';
        RETURN;
    END

    -- 2. If not busy
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
    VALUES (@PatientID, @DoctorID, @AppDate, @AppTime, 'Scheduled');

    PRINT 'Appointment successfully booked for Patient ID: ' + CAST(@PatientID AS VARCHAR);
END;



---------- EXEC the Proceder
EXEC sp_BookAppointment 
    @PatientID = 12, 
    @DoctorID = 3, 
    @AppDate = '2026-06-10', 
    @AppTime = '14:00:00';

---Check The Table
SELECT * FROM Appointments WHERE PatientID = 12 AND AppointmentDate = '2026-06-10';
