--Total Discharges
SELECT 
	COUNT(*) AS Total_Discharges
FROM vw_AdmissionData
WHERE OUTCOME = 'DISCHARGE'

--Average Daily Discharge Rate
--It is total discharges divided by the total length of stay
SELECT CAST(
CAST((
 SELECT 
	COUNT(*) AS Total_Discharges
FROM vw_AdmissionData
WHERE OUTCOME = 'DISCHARGE') AS FLOAT)/
CAST((
SELECT
	SUM(DURATION_OF_STAY) AS Total_Length_of_Stay
FROM vw_AdmissionData) AS FLOAT)
AS DECIMAL (10,2))* 100 AS Avg_Daily_Discharge_Rate

--Average Length of Stay
--It is toal length of stay divided by total discharge
SELECT
ROUND(SUM(DURATION_OF_STAY)/SUM(CASE WHEN OUTCOME= 'DISCHARGE' THEN 1.0 ELSE 0.0 END), 0) AS Avg_Length_of_Stay
FROM
vw_AdmissionData