# Healthcare Appointment System — Advanced Database Project

A relational database system for managing doctors, patients, appointments, and prescriptions. Built as part of an Advanced Database course project.

---

## Tech Stack

- **SQL Server** — core database and all queries
- **MongoDB** — NoSQL section
- **SSMS** — SQL Server Management Studio

---

## Database Design

The system uses a supertype/subtype design:

- `Users` is the supertype holding shared info (name, phone, gender, email)
- `Doctors` and `Patients` are subtypes that inherit from `Users`
- All tables are normalized up to **3NF**

**Main tables:** Users, Doctors, Patients, Appointments, Prescriptions


---
## Features Implemented

| # | Feature | Details |
|---|---------|---------|
| 1 | Database Design | EERD, 3NF normalization, SQL Server implementation |
| 2 | Basic Queries | 4 queries covering schedules, history, and revenue |
| 3 | Transactions | INSERT wrapped in BEGIN/COMMIT transaction |
| 4 | Concurrency | Two-session blocking simulation with screenshots |
| 5 | Recovery | ROLLBACK demo + transaction log recovery explanation |
| 6 | Stored Procedure | `sp_BookAppointment` — books an appointment with conflict check |
| 7 | Window Functions | `RANK` by consultation fee, `ROW_NUMBER` by patient visit history |
| 8 | Query Optimization | Non-clustered index on `FullName`, SELECT tuning |
| 9 | Data Warehouse | Star schema, ETL from OLTP, 4 analytical queries |
| 10 | NoSQL (MongoDB) | Insert, Find, Update on a converted collection (Patient) |

---

## Data Warehouse

**Star Schema tables:**
- `Fact_Appointments` — measures: FeeAmount, AppointmentDate (50+ records)
- `Dim_Patients` — patient name and gender
- `Dim_Doctors` — doctor name and specialty
- `Dim_Date` — date breakdown (day, month, quarter, year)

**Analytical queries cover:** revenue by specialty, appointments by gender, busiest doctors, and monthly revenue.


