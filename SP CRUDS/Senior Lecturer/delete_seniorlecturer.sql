create or replace PROCEDURE delete_seniorlecturer
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM SENIORLECTURER
    WHERE pers_id = p_pers_id;

END delete_seniorlecturer;