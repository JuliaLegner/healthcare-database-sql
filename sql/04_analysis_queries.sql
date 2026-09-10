-- Healthcare Database System
-- Analytical SQL queries for the portfolio.
-- Queries 7-9 are retained from the coursework text; Queries 1-6 are
-- clean portfolio equivalents based on the documented coursework use cases.

-- 1. Patient Appointment Details
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    a.AppointmentID,
    a.AppointmentDate,
    a.STATUS AS AppointmentStatus,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    d.Specialisation
FROM patient AS p
JOIN appointment AS a ON p.PatientID = a.PatientID
JOIN doctor AS d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate;

-- 2. Full Prescription Report
SELECT
    pr.PrescriptionID,
    p.PatientID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    pr.Medication,
    pr.Dosage,
    pr.Duration,
    pr.IssuedDate,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    dep.DepartmentName
FROM prescription AS pr
JOIN patient AS p ON pr.PatientID = p.PatientID
JOIN doctor AS d ON pr.DoctorID = d.DoctorID
JOIN department AS dep ON d.DepartmentID = dep.DepartmentID
ORDER BY pr.IssuedDate DESC;

-- 3. Patient Medical History
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    mr.RecordDate,
    mr.Diagnosis,
    mr.Treatment,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName
FROM patient AS p
JOIN medical_record AS mr ON p.PatientID = mr.PatientID
JOIN doctor AS d ON mr.DoctorID = d.DoctorID
ORDER BY p.PatientID, mr.RecordDate DESC;

-- 4. Doctor Workload by Department
SELECT
    dep.DepartmentName,
    d.DoctorID,
    d.FirstName,
    d.LastName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM doctor AS d
JOIN department AS dep ON d.DepartmentID = dep.DepartmentID
LEFT JOIN appointment AS a ON d.DoctorID = a.DoctorID
GROUP BY dep.DepartmentName, d.DoctorID, d.FirstName, d.LastName
ORDER BY dep.DepartmentName, TotalAppointments DESC;

-- 5. Appointment Status Summary per Department
SELECT
    dep.DepartmentName,
    a.STATUS AS AppointmentStatus,
    COUNT(*) AS AppointmentCount
FROM appointment AS a
JOIN doctor AS d ON a.DoctorID = d.DoctorID
JOIN department AS dep ON d.DepartmentID = dep.DepartmentID
GROUP BY dep.DepartmentName, a.STATUS
ORDER BY dep.DepartmentName, AppointmentCount DESC;

-- 6. Complete Patient Care Summary
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    a.AppointmentID,
    a.AppointmentDate,
    a.STATUS AS AppointmentStatus,
    mr.Diagnosis,
    mr.Treatment,
    pr.Medication,
    pr.Dosage,
    pr.Duration
FROM patient AS p
LEFT JOIN appointment AS a ON p.PatientID = a.PatientID
LEFT JOIN medical_record AS mr ON p.PatientID = mr.PatientID
LEFT JOIN prescription AS pr
    ON p.PatientID = pr.PatientID
    AND a.AppointmentID = pr.AppointmentID
ORDER BY p.PatientID, a.AppointmentDate DESC;

-- 7. Patient Visit-Frequency Classification (CASE)
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    p.NHSNumber,
    COUNT(a.AppointmentID) AS TotalVisits,
    CASE
        WHEN COUNT(a.AppointmentID) >= 10 THEN 'High Frequency'
        WHEN COUNT(a.AppointmentID) >= 5 THEN 'Moderate'
        ELSE 'Low'
    END AS PatientCategory
FROM patient AS p
LEFT JOIN appointment AS a
    ON p.PatientID = a.PatientID
GROUP BY
    p.PatientID,
    p.FirstName,
    p.LastName,
    p.NHSNumber
ORDER BY TotalVisits DESC;

-- 8. Patients with Multiple No-Shows (Subquery)
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    p.NHSNumber,
    p.Phone
FROM patient AS p
WHERE p.PatientID IN (
    SELECT a.PatientID
    FROM appointment AS a
    WHERE a.STATUS = 'No-show'
    GROUP BY a.PatientID
    HAVING COUNT(*) >= 2
)
ORDER BY p.LastName;

-- 9. Doctor Workload Ranking by Department (Window Function)
SELECT
    dep.DepartmentName,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    d.Specialisation,
    COUNT(a.AppointmentID) AS TotalAppointments,
    RANK() OVER (
        PARTITION BY dep.DepartmentName
        ORDER BY COUNT(a.AppointmentID) DESC
    ) AS WorkloadRank
FROM doctor AS d
JOIN department AS dep
    ON d.DepartmentID = dep.DepartmentID
LEFT JOIN appointment AS a
    ON d.DoctorID = a.DoctorID
GROUP BY
    d.DoctorID,
    dep.DepartmentName,
    d.FirstName,
    d.LastName,
    d.Specialisation
ORDER BY dep.DepartmentName, WorkloadRank;
