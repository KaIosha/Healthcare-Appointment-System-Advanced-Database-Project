--Session 1
BEGIN TRANSACTION;
UPDATE Users 
SET FullName = 'Concurrency Test' 
WHERE UserID = 11;

COMMIT;

--- **What will happen?**
--- **Session 2** will not show any results. It will just say "Executing query..." indefinitely.
-- This is because Session 1 has a **Write Lock** on that row, and Session 2 is waiting for the transaction to either `COMMIT` or `ROLLBACK`.

