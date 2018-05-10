create or replace PROCEDURE delete_enrolls
(
    p_student_id           in VARCHAR2
)
AS 
BEGIN  

    DELETE FROM ENROLLS
    WHERE student_id = p_student_id;

END delete_enrolls;