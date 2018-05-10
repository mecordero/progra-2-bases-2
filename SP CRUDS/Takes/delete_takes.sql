create or replace PROCEDURE delete_takes
(
    p_student_id           in VARCHAR2
)
AS 
BEGIN  

    DELETE FROM TAKES
    WHERE student_id = p_student_id;

END delete_takes;