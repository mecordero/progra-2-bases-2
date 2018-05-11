create or replace PROCEDURE delete_campus 
(
    p_campus_location           in VARCHAR2,
    p_campus_adress				in VARCHAR2
)
AS 
BEGIN  

    DELETE FROM CAMPUS
    WHERE campus_location = p_campus_location and campus_address = p_campus_adress;

END delete_campus;