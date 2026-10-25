use master
go

Create Database PatientAppointmentDW;

use PatientAppointmentDW;
go

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Table Patient_TB_Source (Patient_ID INT IDENTITY(1,1) PRIMARY KEY,First_Name VARCHAR(50), Last_Name VARCHAR(50), Gender CHAR(1), Date_Of_Birth DATE);

Create Table Patient_TB (Patient_ID INT IDENTITY(1,1) PRIMARY KEY,First_Name VARCHAR(50), Last_Name VARCHAR(50), Gender CHAR(1), Date_Of_Birth DATE,Age INT,Age_Group NVarchar(50));

INSERT INTO Patient_TB_Source(First_Name, Last_Name, Gender, Date_Of_Birth) VALUES
('Ahmed','Al-Said','M','1985-02-10'),
('Fatima','Al-Harthy','F','1992-06-15'),
('Salim','Al-Balushi','M','1978-09-21'),
('Aisha','Al-Rawahi','F','1988-12-01'),
('Khalid','Al-Zadjali','M','1969-03-30'),
('Mona','Al-Hinai','F','1995-07-18'),
('Yusuf','Al-Farsi','M','1982-11-11'),
('Noor','Al-Lawati','F','2000-01-25'),
('Hassan','Al-Busaidi','M','1975-05-05'),
('Zahra','Al-Kindi','F','1998-08-09'),
('Omar','Al-Rashdi','M','1983-04-14'),
('Layla','Al-Maamari','F','1991-10-22'),
('Saif','Al-Yahyai','M','1970-02-02'),
('Amal','Al-Ghafri','F','1986-06-06'),
('Nasser','Al-Siyabi','M','1993-09-17'),
('Hamdan','Al-Abri','M','1987-03-12'),
('Reem','Al-Habsi','F','1996-11-08'),
('Majid','Al-Kaabi','M','1981-01-19'),
('Huda','Al-Shukaili','F','1994-05-27'),
('Tariq','Al-Badi','M','1979-08-03');

select * from Patient_TB_Source;
select * from Patient_TB;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Table Doctor_TB (Doctor_ID INT IDENTITY(10,1) PRIMARY KEY,First_Name VARCHAR(50), Last_Name VARCHAR(50), Specialization VARCHAR(100), Years_Experience INT);

INSERT INTO Doctor_TB (First_Name, Last_Name, Specialization, Years_Experience) VALUES
('Ali','Hassan','Cardiology',15),
('Fatima','Saeed','Pediatrics',10),
('Omar','Rahman','Dermatology',8),
('Layla','Khan','Orthopedics',12),
('Hamad','Al-Farsi','Neurology',18),
('Sara','Al-Harthy','General Medicine',7);

select * from Doctor_TB;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Table Appointment_TB (Appointment_ID INT IDENTITY(100,1) PRIMARY KEY,Reason_For_Visit VARCHAR(100), Status VARCHAR(20));

INSERT INTO Appointment_TB (Reason_For_Visit, Status) VALUES
('Checkup','Completed'),
('Consultation','Completed'),
('Emergency','Completed'),
('Follow-up','Scheduled'),
('Therapy','Cancelled'),
('Vaccination','Completed'),
('Dental','Completed'),
('Eye Exam','Completed'),
('Surgery','Scheduled'),
('Skin Treatment','Completed'),
('Physiotherapy','Completed'),
('Blood Test','Completed'),
('X-Ray','Completed'),
('MRI Scan','Scheduled'),
('Ultrasound','Completed'),
('General Check','Completed'),
('Flu Symptoms','Completed'),
('Injury','Completed'),
('Back Pain','Completed'),
('Allergy','Completed');

select * FROM Appointment_TB;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create Table Date_TB(Date_ID INT PRIMARY KEY,Full_Date DATE,Year INT,Month INT,Month_Name VARCHAR(15),Day INT,Day_Name VARCHAR(15));
DECLARE @StartDate DATE = '2023-01-01';
DECLARE @EndDate DATE = '2026-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Date_TB
    VALUES (
        CONVERT(INT, FORMAT(@StartDate, 'yyyyMMdd')),
        @StartDate,
        YEAR(@StartDate),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        DAY(@StartDate),
        DATENAME(WEEKDAY, @StartDate)
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;

SELECT * FROM Date_TB;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Fact_Patient_App (
    Fact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_ID INT,
    Date_ID INT,
    Appointment_Count INT,
    Consultation_Fee DECIMAL(10,2),
    Patient_Age INT,
    Doctor_Experience INT,

    FOREIGN KEY (Patient_ID) REFERENCES Patient_TB(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor_TB(Doctor_ID),
    FOREIGN KEY (Date_ID) REFERENCES Date_TB(Date_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointment_TB(Appointment_ID)
);
INSERT INTO Fact_Patient_App (
    Patient_ID,
    Doctor_ID,
    Appointment_ID,
    Date_ID,
    Appointment_Count,
    Consultation_Fee,
    Patient_Age,
    Doctor_Experience
)
SELECT TOP 200
    p.Patient_ID,

    d.Doctor_ID,
    a.Appointment_ID,
    dt.Date_ID,

    1 AS Appointment_Count,

    CASE 
        WHEN a.Reason_For_Visit IN ('Emergency','Surgery') THEN 500
        WHEN a.Reason_For_Visit IN ('MRI Scan','Ultrasound','X-Ray') THEN 300
        WHEN a.Reason_For_Visit IN ('Consultation','Checkup','General Check') THEN 100
        ELSE 50
    END AS Consultation_Fee,

    DATEDIFF(YEAR, p.Date_Of_Birth, dt.Full_Date),

    d.Years_Experience

FROM Patient_TB p

JOIN Doctor_TB d 
    ON d.Doctor_ID = ((p.Patient_ID - 1) % (SELECT COUNT(*) FROM Doctor_TB)) + 10

JOIN Appointment_TB a 
    ON a.Appointment_ID = ((p.Patient_ID - 1) % (SELECT COUNT(*) FROM Appointment_TB)) + 100

JOIN Date_TB dt 
    ON dt.Date_ID = (
        SELECT TOP 1 Date_ID
        FROM Date_TB
        ORDER BY NEWID()
    );
	
select * from Fact_Patient_App;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
