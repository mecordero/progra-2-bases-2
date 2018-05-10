create or replace PROCEDURE delete_tutor
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM TUTOR
    WHERE pers_id = p_pers_id;

END delete_tutor;