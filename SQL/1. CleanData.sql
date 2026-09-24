--Clean Dupplicate Rows
USE HospitalAdimission
GO;

CREATE VIEW vw_AdmissionData AS

WITH CleanData AS(
SELECT *,
	ROW_NUMBER() OVER(PARTITION BY MRD_No, D_O_A, D_O_D ORDER BY MRD_No) Dup_No
FROM [HDHI Admission data])

SELECT*
FROM CleanData
WHERE Dup_No = 1 AND MRD_No IS NOT NULL
---------
