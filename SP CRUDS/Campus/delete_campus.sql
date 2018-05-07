create or replace PROCEDURE delete_campus 
(
    p_campus_id           in REAL
)
AS 
BEGIN  

    DELETE FROM CAMPUS
    WHERE campus_id = p_campus_id;

END delete_campus;