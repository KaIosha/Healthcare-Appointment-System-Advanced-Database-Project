-- RECOVERY EXPLANATION
-- SQL Server uses the Transaction Log for automatic recovery.
-- In case of a system failure (crash, power loss):
--   1. On restart, SQL Server reads the transaction log.
--   2. Any transaction that was committed is REDONE .
--   3. Any transaction that was NOT committed rolled back.



BEGIN TRANSACTION;
UPDATE Doctors 
SET ConsultationFee = 650.00 
WHERE DoctorID = 1;
COMMIT;


SELECT ConsultationFee FROM Doctors WHERE DoctorID = 1;

--------------------------------
--ROLLBACK
BEGIN TRANSACTION;

DELETE FROM Prescriptions;

SELECT COUNT(*) AS RecordCount FROM Prescriptions;

ROLLBACK;
--To check The Table comeback
SELECT COUNT(*) AS RecordCount FROM Prescriptions;