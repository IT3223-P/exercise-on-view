Achira Wijesuriya@DESKTOP-8FO0AKP c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 13
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE HospitalDB;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE HospitalDB;
Database changed
MariaDB [HospitalDB]> CREATE TABLE Doctor (
    ->     Doctor_id INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Specialisation VARCHAR(50),
    ->     Phone VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.016 sec)

MariaDB [HospitalDB]> CREATE TABLE Patient (
    ->     Patient_id INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Birth_date DATE,
    ->     Gender VARCHAR(10),
    ->     Address VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.012 sec)

MariaDB [HospitalDB]> CREATE TABLE Appointment (
    ->     Appointment_id INT PRIMARY KEY,
    ->     Patient_id INT,
    ->     Doctor_id INT,
    ->     Appointment_date DATE,
    ->     Status VARCHAR(20),
    ->     FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id),
    ->     FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id)
    -> );
Query OK, 0 rows affected (0.019 sec)

MariaDB [HospitalDB]> CREATE TABLE Treatment (
    ->     Treatment_id INT PRIMARY KEY,
    ->     Appointment_id INT,
    ->     Description VARCHAR(100),
    ->     Cost DECIMAL(10, 2),
    ->     FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id)
    -> );
Query OK, 0 rows affected (0.017 sec)

MariaDB [HospitalDB]> CREATE TABLE Prescription (
    ->     Prescription_id INT PRIMARY KEY,
    ->     Appointment_id INT,
    ->     Medicine VARCHAR(100),
    ->     Dosage VARCHAR(100),
    ->     FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id)
    -> );
Query OK, 0 rows affected (0.021 sec)

MariaDB [HospitalDB]> INSERT INTO Doctor VALUES
    -> (1, 'Dr. John Doe', 'Cardiology', '021-222-1234'),
    -> (2, 'Dr. Sarah Smith', 'Neurology', '021-222-2345'),
    -> (3, 'Dr. James Brown', 'Pediatrics', '021-222-3456'),
    -> (4, 'Dr. Lisa White', 'Orthopedics', '021-222-4567'),
    -> (5, 'Dr. Michael Black', 'Dermatology', '021-222-5678'),
    -> (6, 'Dr. Emily Green', 'General', '021-222-6789'),
    -> (7, 'Dr. Daniel Lee', 'Cardiology', '021-222-7890'),
    -> (8, 'Dr. Linda Clark', 'Neurology', '021-222-8901'),
    -> (9, 'Dr. Steven Turner', 'Pediatrics', '021-222-9012'),
    -> (10, 'Dr. Jessica Martinez', 'Orthopedics', '021-222-0123');
Query OK, 10 rows affected (0.003 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [HospitalDB]> INSERT INTO Patient VALUES
    -> (1, 'Alice Johnson', '1985-05-12', 'Female', '123 Elm St'),
    -> (2, 'Bob Miller', '1990-02-23', 'Male', '456 Oak St'),
    -> (3, 'Charlie Davis', '2001-07-30', 'Male', '789 Pine St'),
    -> (4, 'Diana Wilson', '1975-09-14', 'Female', '101 Maple St'),
    -> (5, 'Eve Moore', '1982-04-19', 'Female', '202 Birch St'),
    -> (6, 'Frank Harris', '1995-01-08', 'Male', '303 Cedar St'),
    -> (7, 'Grace Clark', '1989-12-25', 'Female', '404 Pine St'),
    -> (8, 'Henry Lewis', '2000-03-14', 'Male', '505 Maple St'),
    -> (9, 'Irene Robinson', '1983-06-22', 'Female', '606 Oak St'),
    -> (10, 'Jack Walker', '1998-11-01', 'Male', '707 Birch St');
Query OK, 10 rows affected (0.002 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [HospitalDB]> INSERT INTO Appointment VALUES
    -> (1, 1, 2, '2025-04-10', 'Scheduled'),
    -> (2, 2, 1, '2025-04-15', 'Scheduled'),
    -> (3, 3, 5, '2025-04-12', 'Scheduled'),
    -> (4, 4, 3, '2025-04-20', 'Scheduled'),
    -> (5, 5, 2, '2025-04-18', 'Scheduled'),
    -> (6, 6, 4, '2025-04-25', 'Scheduled'),
    -> (7, 7, 6, '2025-04-17', 'Scheduled'),
    -> (8, 8, 7, '2025-04-22', 'Scheduled'),
    -> (9, 9, 8, '2025-04-14', 'Scheduled'),
    -> (10, 10, 9, '2025-04-24', 'Scheduled');
Query OK, 10 rows affected (0.004 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [HospitalDB]> INSERT INTO Treatment VALUES
    -> (1, 1, 'X-ray', 150.00),
    -> (2, 2, 'MRI', 300.00),
    -> (3, 3, 'Blood Test', 100.00),
    -> (4, 4, 'Physical Therapy', 200.00),
    -> (5, 5, 'Medication', 50.00),
    -> (6, 6, 'Surgery', 800.00),
    -> (7, 7, 'MRI', 300.00),
    -> (8, 8, 'X-ray', 150.00),
    -> (9, 9, 'Blood Test', 100.00),
    -> (10, 10, 'Physical Therapy', 200.00);
Query OK, 10 rows affected (0.002 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [HospitalDB]> INSERT INTO Prescription VALUES
    -> (1, 1, 'Paracetamol', '1 tablet twice a day'),
    -> (2, 2, 'Ibuprofen', '2 tablets daily'),
    -> (3, 3, 'Amoxicillin', '1 capsule thrice a day'),
    -> (4, 4, 'Metformin', '1 tablet after meals'),
    -> (5, 5, 'Lisinopril', '1 tablet daily'),
    -> (6, 6, 'Amlodipine', '1 tablet daily'),
    -> (7, 7, 'Paracetamol', '1 tablet twice a day'),
    -> (8, 8, 'Ibuprofen', '2 tablets daily'),
    -> (9, 9, 'Amoxicillin', '1 capsule thrice a day'),
    -> (10, 10, 'Metformin', '1 tablet after meals');
Query OK, 10 rows affected (0.016 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [HospitalDB]> SELECT * FROM Doctor;
+-----------+----------------------+----------------+--------------+
| Doctor_id | Name                 | Specialisation | Phone        |
+-----------+----------------------+----------------+--------------+
|         1 | Dr. John Doe         | Cardiology     | 021-222-1234 |
|         2 | Dr. Sarah Smith      | Neurology      | 021-222-2345 |
|         3 | Dr. James Brown      | Pediatrics     | 021-222-3456 |
|         4 | Dr. Lisa White       | Orthopedics    | 021-222-4567 |
|         5 | Dr. Michael Black    | Dermatology    | 021-222-5678 |
|         6 | Dr. Emily Green      | General        | 021-222-6789 |
|         7 | Dr. Daniel Lee       | Cardiology     | 021-222-7890 |
|         8 | Dr. Linda Clark      | Neurology      | 021-222-8901 |
|         9 | Dr. Steven Turner    | Pediatrics     | 021-222-9012 |
|        10 | Dr. Jessica Martinez | Orthopedics    | 021-222-0123 |
+-----------+----------------------+----------------+--------------+
10 rows in set (0.000 sec)

MariaDB [HospitalDB]> SELECT * FROM Patient
    -> WHERE Gender = 'Female';
+------------+----------------+------------+--------+--------------+
| Patient_id | Name           | Birth_date | Gender | Address      |
+------------+----------------+------------+--------+--------------+
|          1 | Alice Johnson  | 1985-05-12 | Female | 123 Elm St   |
|          4 | Diana Wilson   | 1975-09-14 | Female | 101 Maple St |
|          5 | Eve Moore      | 1982-04-19 | Female | 202 Birch St |
|          7 | Grace Clark    | 1989-12-25 | Female | 404 Pine St  |
|          9 | Irene Robinson | 1983-06-22 | Female | 606 Oak St   |
+------------+----------------+------------+--------+--------------+
5 rows in set (0.000 sec)

MariaDB [HospitalDB]> SELECT * FROM Appointment
    -> WHERE Patient_id = 3;
+----------------+------------+-----------+------------------+-----------+
| Appointment_id | Patient_id | Doctor_id | Appointment_date | Status    |
+----------------+------------+-----------+------------------+-----------+
|              3 |          3 |         5 | 2025-04-12       | Scheduled |
+----------------+------------+-----------+------------------+-----------+
1 row in set (0.000 sec)

MariaDB [HospitalDB]> SELECT Description, Cost FROM Treatment;
+------------------+--------+
| Description      | Cost   |
+------------------+--------+
| X-ray            | 150.00 |
| MRI              | 300.00 |
| Blood Test       | 100.00 |
| Physical Therapy | 200.00 |
| Medication       |  50.00 |
| Surgery          | 800.00 |
| MRI              | 300.00 |
| X-ray            | 150.00 |
| Blood Test       | 100.00 |
| Physical Therapy | 200.00 |
+------------------+--------+
10 rows in set (0.000 sec)

MariaDB [HospitalDB]> SELECT SUM(t.Cost) AS Total_Cost
    -> FROM Treatment t
    -> JOIN Appointment a ON t.Appointment_id = a.Appointment_id
    -> WHERE a.Patient_id = 2;
+------------+
| Total_Cost |
+------------+
|     300.00 |
+------------+
1 row in set (0.001 sec)

MariaDB [HospitalDB]> SELECT * FROM Doctor
    -> WHERE Specialisation = 'Cardiology';
+-----------+----------------+----------------+--------------+
| Doctor_id | Name           | Specialisation | Phone        |
+-----------+----------------+----------------+--------------+
|         1 | Dr. John Doe   | Cardiology     | 021-222-1234 |
|         7 | Dr. Daniel Lee | Cardiology     | 021-222-7890 |
+-----------+----------------+----------------+--------------+
2 rows in set (0.001 sec)

MariaDB [HospitalDB]> SELECT * FROM Appointment
    -> WHERE Appointment_date > '2025-04-15';
+----------------+------------+-----------+------------------+-----------+
| Appointment_id | Patient_id | Doctor_id | Appointment_date | Status    |
+----------------+------------+-----------+------------------+-----------+
|              4 |          4 |         3 | 2025-04-20       | Scheduled |
|              5 |          5 |         2 | 2025-04-18       | Scheduled |
|              6 |          6 |         4 | 2025-04-25       | Scheduled |
|              7 |          7 |         6 | 2025-04-17       | Scheduled |
|              8 |          8 |         7 | 2025-04-22       | Scheduled |
|             10 |         10 |         9 | 2025-04-24       | Scheduled |
+----------------+------------+-----------+------------------+-----------+
6 rows in set (0.017 sec)

MariaDB [HospitalDB]> SELECT * FROM Appointment
    -> WHERE Patient_id = 1
    -> ORDER BY Appointment_date DESC
    -> LIMIT 1;
+----------------+------------+-----------+------------------+-----------+
| Appointment_id | Patient_id | Doctor_id | Appointment_date | Status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         2 | 2025-04-10       | Scheduled |
+----------------+------------+-----------+------------------+-----------+
1 row in set (0.013 sec)

MariaDB [HospitalDB]> SELECT DISTINCT p.*
    -> FROM Patient p
    -> JOIN Appointment a ON p.Patient_id = a.Patient_id
    -> JOIN Doctor d ON a.Doctor_id = d.Doctor_id
    -> WHERE d.Specialisation = 'Neurology' AND a.Status = 'Scheduled';
+------------+----------------+------------+--------+--------------+
| Patient_id | Name           | Birth_date | Gender | Address      |
+------------+----------------+------------+--------+--------------+
|          1 | Alice Johnson  | 1985-05-12 | Female | 123 Elm St   |
|          5 | Eve Moore      | 1982-04-19 | Female | 202 Birch St |
|          9 | Irene Robinson | 1983-06-22 | Female | 606 Oak St   |
+------------+----------------+------------+--------+--------------+
3 rows in set (0.012 sec)

MariaDB [HospitalDB]> SELECT * FROM Treatment
    -> WHERE Cost > 200;
+--------------+----------------+-------------+--------+
| Treatment_id | Appointment_id | Description | Cost   |
+--------------+----------------+-------------+--------+
|            2 |              2 | MRI         | 300.00 |
|            6 |              6 | Surgery     | 800.00 |
|            7 |              7 | MRI         | 300.00 |
+--------------+----------------+-------------+--------+
3 rows in set (0.010 sec)

MariaDB [HospitalDB]> SELECT d.Doctor_id, d.Name, COUNT(a.Appointment_id) AS Total_Appointments
    -> FROM Doctor d
    -> LEFT JOIN Appointment a ON d.Doctor_id = a.Doctor_id
    -> GROUP BY d.Doctor_id, d.Name;
+-----------+----------------------+--------------------+
| Doctor_id | Name                 | Total_Appointments |
+-----------+----------------------+--------------------+
|         1 | Dr. John Doe         |                  1 |
|         2 | Dr. Sarah Smith      |                  2 |
|         3 | Dr. James Brown      |                  1 |
|         4 | Dr. Lisa White       |                  1 |
|         5 | Dr. Michael Black    |                  1 |
|         6 | Dr. Emily Green      |                  1 |
|         7 | Dr. Daniel Lee       |                  1 |
|         8 | Dr. Linda Clark      |                  1 |
|         9 | Dr. Steven Turner    |                  1 |
|        10 | Dr. Jessica Martinez |                  0 |
+-----------+----------------------+--------------------+
10 rows in set (0.011 sec)

MariaDB [HospitalDB]> SELECT Medicine, COUNT(*) AS Times_Prescribed
    -> FROM Prescription
    -> GROUP BY Medicine
    -> ORDER BY Times_Prescribed DESC
    -> LIMIT 1;
+-----------+------------------+
| Medicine  | Times_Prescribed |
+-----------+------------------+
| Ibuprofen |                2 |
+-----------+------------------+
1 row in set (0.001 sec)

MariaDB [HospitalDB]> SELECT * FROM Patient
    -> WHERE Birth_date < '1990-01-01';
+------------+----------------+------------+--------+--------------+
| Patient_id | Name           | Birth_date | Gender | Address      |
+------------+----------------+------------+--------+--------------+
|          1 | Alice Johnson  | 1985-05-12 | Female | 123 Elm St   |
|          4 | Diana Wilson   | 1975-09-14 | Female | 101 Maple St |
|          5 | Eve Moore      | 1982-04-19 | Female | 202 Birch St |
|          7 | Grace Clark    | 1989-12-25 | Female | 404 Pine St  |
|          9 | Irene Robinson | 1983-06-22 | Female | 606 Oak St   |
+------------+----------------+------------+--------+--------------+
5 rows in set (0.001 sec)

MariaDB [HospitalDB]> SELECT * FROM Prescription
    -> WHERE Appointment_id = 6;
+-----------------+----------------+------------+----------------+
| Prescription_id | Appointment_id | Medicine   | Dosage         |
+-----------------+----------------+------------+----------------+
|               6 |              6 | Amlodipine | 1 tablet daily |
+-----------------+----------------+------------+----------------+
1 row in set (0.001 sec)

MariaDB [HospitalDB]> SELECT AVG(Cost) AS Avg_Treatment_Cost
    -> FROM Treatment;
+--------------------+
| Avg_Treatment_Cost |
+--------------------+
|         235.000000 |
+--------------------+
1 row in set (0.000 sec)

MariaDB [HospitalDB]> SELECT DISTINCT p.*
    -> FROM Patient p
    -> JOIN Appointment a ON p.Patient_id = a.Patient_id
    -> JOIN Prescription pr ON a.Appointment_id = pr.Appointment_id
    -> WHERE pr.Medicine = 'Ibuprofen';
+------------+-------------+------------+--------+--------------+
| Patient_id | Name        | Birth_date | Gender | Address      |
+------------+-------------+------------+--------+--------------+
|          2 | Bob Miller  | 1990-02-23 | Male   | 456 Oak St   |
|          8 | Henry Lewis | 2000-03-14 | Male   | 505 Maple St |
+------------+-------------+------------+--------+--------------+
2 rows in set (0.001 sec)

MariaDB [HospitalDB]> SELECT t.Treatment_id, t.Description, t.Cost, p.Name AS Patient_Name
    -> FROM Treatment t
    -> JOIN Appointment a ON t.Appointment_id = a.Appointment_id
    -> JOIN Patient p ON a.Patient_id = p.Patient_id;
+--------------+------------------+--------+----------------+
| Treatment_id | Description      | Cost   | Patient_Name   |
+--------------+------------------+--------+----------------+
|            1 | X-ray            | 150.00 | Alice Johnson  |
|            2 | MRI              | 300.00 | Bob Miller     |
|            3 | Blood Test       | 100.00 | Charlie Davis  |
|            4 | Physical Therapy | 200.00 | Diana Wilson   |
|            5 | Medication       |  50.00 | Eve Moore      |
|            6 | Surgery          | 800.00 | Frank Harris   |
|            7 | MRI              | 300.00 | Grace Clark    |
|            8 | X-ray            | 150.00 | Henry Lewis    |
|            9 | Blood Test       | 100.00 | Irene Robinson |
|           10 | Physical Therapy | 200.00 | Jack Walker    |
+--------------+------------------+--------+----------------+
10 rows in set (0.001 sec)

MariaDB [HospitalDB]> SELECT COUNT(*) AS Total_Treatments
    -> FROM Treatment;
+------------------+
| Total_Treatments |
+------------------+
|               10 |
+------------------+
1 row in set (0.000 sec)

MariaDB [HospitalDB]> SELECT DISTINCT d.Name
    -> FROM Doctor d
    -> JOIN Appointment a ON d.Doctor_id = a.Doctor_id
    -> WHERE a.Patient_id = 1;
+-----------------+
| Name            |
+-----------------+
| Dr. Sarah Smith |
+-----------------+
1 row in set (0.011 sec)

MariaDB [HospitalDB]> SELECT d.Doctor_id, d.Name, COUNT(a.Appointment_id) AS Total_Appointments
    -> FROM Doctor d
    -> LEFT JOIN Appointment a ON d.Doctor_id = a.Doctor_id
    -> GROUP BY d.Doctor_id, d.Name;
+-----------+----------------------+--------------------+
| Doctor_id | Name                 | Total_Appointments |
+-----------+----------------------+--------------------+
|         1 | Dr. John Doe         |                  1 |
|         2 | Dr. Sarah Smith      |                  2 |
|         3 | Dr. James Brown      |                  1 |
|         4 | Dr. Lisa White       |                  1 |
|         5 | Dr. Michael Black    |                  1 |
|         6 | Dr. Emily Green      |                  1 |
|         7 | Dr. Daniel Lee       |                  1 |
|         8 | Dr. Linda Clark      |                  1 |
|         9 | Dr. Steven Turner    |                  1 |
|        10 | Dr. Jessica Martinez |                  0 |
+-----------+----------------------+--------------------+
10 rows in set (0.001 sec)

MariaDB [HospitalDB]>