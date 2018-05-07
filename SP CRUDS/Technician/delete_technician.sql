create or replace PROCEDURE delete_technician
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM TECHNICIAN
    WHERE pers_id = p_pers_id;

END delete_technician;