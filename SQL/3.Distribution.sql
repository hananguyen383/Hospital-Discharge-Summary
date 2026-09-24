--Distribution of Discharges by Age Group
--<16 Paediatric
--16<65 Adult
-->=65 Senior Citizen
SELECT CASE
	WHEN AGE<16 THEN 'Paediatric'
	WHEN AGE<65 THEN 'Adult'
	WHEN AGE>=65 THEN 'Senior Citizen'
	ELSE 'Unknown'
	END AS Age_Group,
	COUNT(*) AS Age_Distribution
FROM vw_AdmissionData
WHERE OUTCOME= 'DISCHARGE'
GROUP BY CASE
	WHEN AGE<16 THEN 'Paediatric'
	WHEN AGE<65 THEN 'Adult'
	WHEN AGE>=65 THEN 'Senior Citizen'
	ELSE 'Unknown'
	END
ORDER BY Age_Distribution DESC

--Distribution of Discharges by Gender
SELECT
GENDER,
COUNT(GENDER) AS Gender_Distribution
FROM vw_AdmissionData
WHERE OUTCOME= 'DISCHARGE'
GROUP BY GENDER
ORDER BY 2 DESC

--Distribution of Discharges by Rural
SELECT
RURAL,
COUNT(RURAL) AS Rural_Distribution
FROM vw_AdmissionData
WHERE OUTCOME= 'DISCHARGE'
GROUP BY RURAL
ORDER BY 2 DESC

--Distribution of Discharges by Type of Admission
SELECT
TYPE_OF_ADMISSION_EMERGENCY_OPD,
COUNT(TYPE_OF_ADMISSION_EMERGENCY_OPD) AS Type_of_Admission_Distribution
FROM vw_AdmissionData
WHERE OUTCOME= 'DISCHARGE'
GROUP BY TYPE_OF_ADMISSION_EMERGENCY_OPD
ORDER BY 2 DESC

--Distribution of Discharges by The Day of The Week
SELECT
	FORMAT(D_O_D, 'dddd') AS Day_of_week,
	COUNT(*) AS Day_Distribution
FROM vw_AdmissionData
WHERE OUTCOME= 'DISCHARGE' AND D_O_D IS NOT NULL
GROUP BY FORMAT(D_O_D, 'dddd')
ORDER BY 2 DESC

