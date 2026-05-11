INSERT INTO Users (FullName, Phone, Gender, Email) VALUES 
-- Potential Doctors (10)
('Dr. Mohamed El-Shenawy', '01012345678', 'M', 'm.shenawy@health.com'),
('Dr. Amira El-Sayed', '01123456789', 'F', 'a.sayed@health.com'),
('Dr. Ibrahim Hassan', '01234567890', 'M', 'i.hassan@health.com'),
('Dr. Nour El-Din', '01545678901', 'M', 'n.din@health.com'),
('Dr. Laila Abdel-Aziz', '01056789012', 'F', 'l.aziz@health.com'),
('Dr. Tarek Hegazy', '01167890123', 'M', 't.hegazy@health.com'),
('Dr. Heba Magdy', '01278901234', 'F', 'h.magdy@health.com'),
('Dr. Youssef Mansour', '01589012345', 'M', 'y.mansour@health.com'),
('Dr. Dina Fouad', '01090123456', 'F', 'd.fouad@health.com'),
('Dr. Ahmed Zaki', '01101234567', 'M', 'a.zaki@health.com'),

-- Patients (35)
('Ahmed Ali', '01011111111', 'M', 'ahmed.ali@mail.com'),
('Mona Ahmed', '01122222222', 'F', 'mona.ahmed@mail.com'),
('Khaled Omar', '01233333333', 'M', 'khaled.omar@mail.com'),
('Sara Yassin', '01544444444', 'F', 'sara.yassin@mail.com'),
('Omar Kamal', '01055555555', 'M', 'omar.kamal@mail.com'),
('Fatma Ibrahim', '01166666666', 'F', 'fatma.ibrahim@mail.com'),
('Ziad Mansour', '01277777777', 'M', 'ziad.mansour@mail.com'),
('Hana Gawdat', '01588888888', 'F', 'hana.gawdat@mail.com'),
('Mostafa Bakr', '01099999999', 'M', 'mostafa.bakr@mail.com'),
('Mariam Nour', '01100000000', 'F', 'mariam.nour@mail.com'),
('Yasin Taha', '01211111112', 'M', 'yasin@mail.com'),
('Salma Ezz', '01522222223', 'F', 'salma@mail.com'),
('Bassem Youssef', '01033333334', 'M', 'bassem@mail.com'),
('Nada Moussa', '01144444445', 'F', 'nada@mail.com'),
('Karim Abdel-Ghani', '01255555556', 'M', 'karim@mail.com'),
('Rania Youssef', '01566666667', 'F', 'rania@mail.com'),
('Hossam Ghaly', '01077777778', 'M', 'hossam@mail.com'),
('Sherine Ahmed', '01188888889', 'F', 'sherine@mail.com'),
('Amr Gamal', '01299999990', 'M', 'amr@mail.com'),
('Dalia El-Behery', '01500000001', 'F', 'dalia@mail.com'),
('Wael Gomaa', '01011121314', 'M', 'wael@mail.com'),
('Mai Selim', '01115161718', 'F', 'mai@mail.com'),
('Essam El-Hadary', '01219202122', 'M', 'essam@mail.com'),
('Yara Naoum', '01523242526', 'F', 'yara@mail.com'),
('Tamer Hosny', '01027282930', 'M', 'tamer@mail.com'),
('Angham Mohamed', '01131323334', 'F', 'angham@mail.com'),
('Sherif Ekramy', '01235363738', 'M', 'sherif@mail.com'),
('Asmaa Galal', '01539404142', 'F', 'asmaa@mail.com'),
('Ahmed Amin', '01043444546', 'M', 'amin@mail.com'),
('Ayten Amer', '01147484950', 'F', 'ayten@mail.com'),
('Hisham Maged', '01251525354', 'M', 'hisham@mail.com'),
('Chico Mohamed', '01555565758', 'M', 'chico@mail.com'),
('Akram Hosny', '01059606162', 'M', 'akram@mail.com'),
('Ruby Ahmed', '01163646566', 'F', 'ruby@mail.com'),
('Amir Karara', '01267686970', 'M', 'amir@mail.com');
-----------------------------------------------------------
-- Doctors (10 records)
INSERT INTO Doctors (DoctorID, Specialization, ConsultationFee) VALUES 
(1, 'Cardiology', 600.00), (2, 'Pediatrics', 400.00), (3, 'Orthopedics', 500.00),
(4, 'Dermatology', 450.00), (5, 'Neurology', 700.00), (6, 'Internal Medicine', 350.00),
(7, 'Ophthalmology', 450.00), (8, 'Psychiatry', 550.00), (9, 'General Surgery', 800.00),
(10, 'Dentistry', 300.00);

-- Patients (35 records)
DECLARE @p INT = 11;
WHILE @p <= 45
BEGIN
    INSERT INTO Patients (PateintID) VALUES (@p);
    SET @p = @p + 1;
END
-------------------------------------------------------------------------------
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES 
(11, 1, '2026-05-01', '09:00:00', 'Completed'), (12, 1, '2026-05-01', '10:00:00', 'Completed'),
(13, 2, '2026-05-01', '11:00:00', 'Completed'), (14, 2, '2026-05-01', '12:00:00', 'Cancelled'),
(15, 3, '2026-05-02', '09:30:00', 'Completed'), (16, 3, '2026-05-02', '10:30:00', 'Completed'),
(17, 4, '2026-05-02', '11:30:00', 'Completed'), (18, 5, '2026-05-03', '09:00:00', 'Scheduled'),
(19, 5, '2026-05-03', '10:00:00', 'Scheduled'), (20, 6, '2026-05-03', '11:00:00', 'Scheduled'),
(21, 7, '2026-05-04', '09:00:00', 'Scheduled'), (22, 8, '2026-05-04', '10:00:00', 'Scheduled'),
(23, 9, '2026-05-04', '11:00:00', 'Scheduled'), (24, 10, '2026-05-05', '09:00:00', 'Scheduled'),
(25, 1, '2026-05-05', '10:00:00', 'Scheduled'), (26, 2, '2026-05-05', '11:00:00', 'Scheduled'),
(27, 3, '2026-05-06', '09:00:00', 'Scheduled'), (28, 4, '2026-05-06', '10:00:00', 'Scheduled'),
(29, 5, '2026-05-06', '11:00:00', 'Scheduled'), (30, 6, '2026-05-07', '09:00:00', 'Scheduled'),
(31, 7, '2026-05-07', '10:00:00', 'Scheduled'), (32, 8, '2026-05-07', '11:00:00', 'Scheduled'),
(33, 9, '2026-05-08', '09:00:00', 'Scheduled'), (34, 10, '2026-05-08', '10:00:00', 'Scheduled'),
(35, 1, '2026-05-08', '11:00:00', 'Scheduled'), (36, 2, '2026-05-09', '09:00:00', 'Scheduled'),
(37, 3, '2026-05-09', '10:00:00', 'Scheduled'), (38, 4, '2026-05-09', '11:00:00', 'Scheduled'),
(39, 5, '2026-05-10', '09:00:00', 'Scheduled'), (40, 6, '2026-05-10', '10:00:00', 'Scheduled');
-------------------------------------------------------------------------------
INSERT INTO Prescriptions (AppointmentID, MedicationName, Instructions, Dosage, Duration) VALUES 
(1, 'Aspirin', 'Take after breakfast', '100mg', '10 Days'),
(1, 'Atorvastatin', 'Before sleep', '20mg', '30 Days'),
(2, 'Concor', 'Daily morning', '5mg', '30 Days'),
(3, 'Panadol Extra', 'When pain occurs', '500mg', '5 Days'),
(5, 'Augmentin', 'Every 12 hours', '1g', '7 Days'),
(6, 'Voltaren Gel', 'Apply on back', 'N/A', '14 Days'),
(7, 'Fusidic Acid', 'Apply on skin', 'N/A', '7 Days'),
(15, 'Telfast', 'Once daily', '180mg', '10 Days'),
(16, 'Nexium', 'On empty stomach', '40mg', '28 Days'),
(17, 'Cataflam', 'After meals', '50mg', '5 Days'),
(18, 'Brufen', 'Every 8 hours', '400mg', '5 Days'),
(19, 'Zyrtec', 'Before sleep', '10mg', '7 Days'),
(21, 'Tobrex Drops', '2 drops each eye', 'N/A', '5 Days'),
(22, 'Cipralex', 'Daily morning', '10mg', '6 Months'),
(23, 'Flagyl', 'Three times daily', '500mg', '7 Days'),
(25, 'Plavix', 'Once daily', '75mg', '30 Days'),
(26, 'Motilium', 'Before meals', '10mg', '10 Days'),
(27, 'Alpha-Chymotrypsin', 'Two tablets daily', 'N/A', '7 Days'),
(29, 'Depakine', 'Nightly', '500mg', 'Ongoing'),
(30, 'Gaviscon', 'After heavy meals', '10ml', '7 Days');