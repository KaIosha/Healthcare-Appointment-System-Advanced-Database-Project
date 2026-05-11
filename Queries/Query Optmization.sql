--Clustered index -> by default the PK is index

-- NON clusterd index
-- index to find patients by name 
CREATE NONCLUSTERED INDEX IX_Users_FullName 
ON Users (FullName);

SELECT FullName , Phone FROM Users
WHERE FullName ='Mona Ahmed';
-------------------------------------------------------
--2\Query Tuning

---Without
SELECT * FROM Doctors d
JOIN Users U on d.DoctorID = U.UserID;

--With
SELECT U.FullName,d.Specialization
FROM Doctors d
JOIN Users U on d.DoctorID = U.UserID;