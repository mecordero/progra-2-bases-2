create or replace PROCEDURE delete_student
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM STUDENT
    WHERE pers_id = p_pers_id;

END delete_student;