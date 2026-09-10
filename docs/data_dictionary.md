# Data Dictionary

This project uses seven core relational tables.

| Table | Purpose | Key fields |
|---|---|---|
| `patient` | Stores patient demographic/contact information | `PatientID`, `NHSNumber` |
| `doctor` | Stores doctor information and department assignment | `DoctorID`, `DepartmentID` |
| `department` | Stores healthcare department information | `DepartmentID` |
| `appointment` | Links patients and doctors through scheduled appointments | `AppointmentID`, `PatientID`, `DoctorID` |
| `medical_record` | Stores diagnoses and treatment records | `RecordID`, `PatientID`, `DoctorID` |
| `prescription` | Stores medication issued in relation to patients, doctors and appointments | `PrescriptionID`, `AppointmentID`, `PatientID`, `DoctorID` |
| `staff` | Stores non-doctor staff and their department assignment | `StaffID`, `DepartmentID` |

## Relationships

- A department can have many doctors.
- A department can have many staff members.
- A patient can have many appointments.
- A doctor can have many appointments.
- A patient can have many medical records.
- A doctor can author many medical records.
- Prescriptions link patients and doctors and can be associated with appointments.

## Portfolio note

The SQL in this repository is a cleaned portfolio presentation of an MSc database coursework project.
