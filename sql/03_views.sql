-- Healthcare Database System
-- Portfolio-ready database views.

DROP VIEW IF EXISTS vw_doctordepartment;
CREATE VIEW vw_doctordepartment AS
SELECT
    d.DoctorID,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    d.Specialisation,
    dep.DepartmentName,
    dep.Location,
    dep.Phone AS DeptPhone
FROM doctor AS d
JOIN department AS dep
    ON d.DepartmentID = dep.DepartmentID;

DROP VIEW IF EXISTS vw_patientappointments;
CREATE VIEW vw_patientappointments AS
SELECT
    p.PatientID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    p.NHSNumber,
    a.AppointmentID,
    a.AppointmentDate,
    a.STATUS AS Status,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    dep.DepartmentName
FROM patient AS p
JOIN appointment AS a
    ON p.PatientID = a.PatientID
JOIN doctor AS d
    ON a.DoctorID = d.DoctorID
JOIN department AS dep
    ON d.DepartmentID = dep.DepartmentID;

DROP VIEW IF EXISTS vw_prescriptiondetails;
CREATE VIEW vw_prescriptiondetails AS
SELECT
    pr.PrescriptionID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    p.NHSNumber,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    pr.Medication,
    pr.Dosage,
    pr.Duration,
    pr.IssuedDate
FROM prescription AS pr
JOIN patient AS p
    ON pr.PatientID = p.PatientID
JOIN doctor AS d
    ON pr.DoctorID = d.DoctorID;
