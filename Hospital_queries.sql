SELECT *
FROM Patients

--Retrieving and Filtering Data
--Questions and Answers:

--1. Retrieve all Patients from Lagos.
SELECT *
FROM Patients
WHERE City = 'LAGOS';

--2. Find all Patients with a length of stay greater than 5 days.
SELECT *
FROM Patients
WHERE length_of_stay > 5;

--3. Find patients whose age is between 30 and 50 years.
SELECT *
FROM PATIENTS
WHERE AGE BETWEEN 30 AND 50;

--4. Retrieve all female patients from Lagos who were admitted through Emergency Admission.
SELECT *
FROM PATIENTS
WHERE GENDER = 'FEMALE'AND CITY = 'LAGOS'AND ADMISSION_TYPE= 'EMERGENCY';

--5. Retrieve all patients who have Diabetes OR Hypertension.
SELECT *
FROM PATIENTS
WHERE CONDITION IN ('HYPERTENSION', 'DIABETES');

--Sorting, Distinct and Basic Aggregation
-- Questions and Answers:

--1. Find the 3 Patients with the longest hospital stays,
--displaying them from longest to sortest stay
SELECT TOP 3 *
FROM PATIENTS 
ORDER BY LENGTH_OF_STAY DESC;

--2. List all unique cities represented in the dataset.
SELECT DISTINCT CITY
FROM PATIENTS;

--3. Count the total number of patients.
SELECT COUNT (*) AS TOTAL_PATIENTS
FROM PATIENTS;

--4. Calculate the average patient age.
SELECT AVG (AGE) AS AVG_AGE
FROM PATIENTS

--5. Count the number of patients for each medical condition.
SELECT CONDITION, COUNT (*) AS TOTAL_PATIENTS 
FROM PATIENTS 
GROUP BY CONDITION 

--Working with Strings & Dates
--Questions & Answers:

--1. Display each patient's full name in uppercase.
SELECT PATIENT_NAME, UPPER(PATIENT_NAME) AS PATIENT_NAME_UPPER 
FROM PATIENTS;

--2. Display each patient's full name in lowercase.
SELECT PATIENT_NAME, LOWER(PATIENT_NAME) AS PATIENT_NAME_LOWER 
FROM PATIENTS;

--3. Create a new column that combines the Patient ID
--and Patient Name into one value.
SELECT 
	PATIENT_ID,
	PATIENT_NAME,
	CONCAT(PATIENT_ID,'-',PATIENT_NAME) AS PATIENT_DETAILS 
	FROM PATIENTS;

--4. Find all patients who were admitted after January 15, 2026.
SELECT *
FROM PATIENTS 
WHERE ADMISSION_DATE > '2026-01-15'

--5. Display the year and month in which each patient was admitted.
SELECT
	PATIENT_ID,
	PATIENT_NAME,
	ADMISSION_DATE,
	YEAR(ADMISSION_DATE) AS ADMISSION_YEAR,
	MONTH(ADMISSION_DATE) AS ADMISSION_MONTH
FROM PATIENTS

--Advance Aggregation and conditional Analysis
--Questions & Answers:

--1. Calculate the average length for each admission type.
SELECT ADMISSION_TYPE,
	AVG (LENGTH_OF_STAY) AS AVG_LENGTH_OF_STAY
FROM PATIENTS 
GROUP BY ADMISSION_TYPE

--2. Find the admission type with an average length of stay greater than 4 days.
SELECT ADMISSION_TYPE,
	AVG (LENGTH_OF_STAY) AS AVG_LENGTH_OF_STAY
FROM PATIENTS 
GROUP BY ADMISSION_TYPE
HAVING AVG (LENGTH_OF_STAY) >4;

--3. Classify Patients as Young (Under 40), Middle-aged (40-59) or Senior (60 and above).
SELECT 
	PATIENT_ID,
	PATIENT_NAME,
	AGE,
CASE
	WHEN AGE < 40 THEN 'YOUNG'
	WHEN AGE BETWEEN 40 AND 59 THEN 'MIDDLE-AGED'
	ELSE 'SENIOR'
END AS AGE_GROUP 
FROM PATIENTS;

--4. Count the number of patients in each age group.
SELECT 
CASE
	WHEN AGE < 40 THEN 'YOUNG'
	WHEN AGE BETWEEN 40 AND 59 THEN 'MIDDLE-AGED'
	ELSE 'SENIOR'
END AS AGE_GROUP,
	COUNT(*) AS PATIENT_COUNT
FROM PATIENTS
GROUP BY 
	CASE
	WHEN AGE < 40 THEN 'YOUNG'
	WHEN AGE BETWEEN 40 AND 59 THEN 'MIDDLE-AGED'
	ELSE 'SENIOR'
END;

--5. Classify patients as Short Stay (3 days or less) or long Stay (more than 3 days).
SELECT 
	PATIENT_ID,
	PATIENT_NAME,
	LENGTH_OF_STAY,
CASE
	WHEN LENGTH_OF_STAY <= 3 THEN 'SHORT STAY'
	ELSE 'LONG STAY'
END AS STAY_CATEGORY 
FROM PATIENTS;

--6. Find the medical conditions with more than 1 patient.
SELECT
	CONDITION,
	COUNT(*) AS CONDITION_COUNT 
FROM PATIENTS
GROUP BY CONDITION 
HAVING COUNT(*) >1;

--Primary & Foreign Keys and SQL JOINs.
--Question and answers:

--1. Import the Doctors table into SQL Server and Verify that it was loaded correctly.
SELECT *
FROM DOCTORS;

--2. Join the Patients and Doctors tables to display each patient's name
--and their doctor's specialization.
SELECT
	p.Patient_Name,
	d.Doctor_Name,
	d.Specialization
FROM PATIENTS AS P
JOIN DOCTORS AS D 
	ON P.DOCTOR_ID = D.DOCTOR_ID;

	--3. Find all patients treated by doctors specializing in Internal Medicine.
SELECT
	p.Patient_Name,
	d.Doctor_Name,
	d.Specialization
FROM PATIENTS AS P
JOIN DOCTORS AS D 
	ON P.DOCTOR_ID = D.DOCTOR_ID
WHERE d.Specialization = 'internal Medicine'

--4. Calculate the average length of stay for patients treated by each doctor.
SELECT
	d.Doctor_Name,
	AVG (LENGTH_OF_STAY) AS AVG_PATIENT_LENGTH_OF_STAY
FROM PATIENTS AS P
JOIN DOCTORS AS D 
	ON P.DOCTOR_ID = D.DOCTOR_ID
GROUP BY d.Doctor_Name

--5. Identify the doctor who has treated the highest number of patients.
SELECT TOP 1
	d.Doctor_Name,
	COUNT(*) AS Highest_Patient_Count
FROM PATIENTS AS P 
JOIN DOCTORS AS D
	ON P.DOCTOR_ID = D.DOCTOR_ID
	GROUP BY d.Doctor_Name
	ORDER BY COUNT(*) DESC;



