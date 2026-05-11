--Session 1
BEGIN TRANSACTION;
UPDATE Users 
SET FullName = 'Concurrency Test' 
WHERE UserID = 11;

--  Session 2 is blocked

COMMIT;




