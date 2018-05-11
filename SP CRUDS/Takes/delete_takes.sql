create or replace PROCEDURE delete_takes
(
    p_student_id           in VARCHAR2
    result  					out real
)
AS 
BEGIN  
	result := (DEREF(student) FROM TAKES;
    		DEREF(student)(pers_id));
    DELETE FROM TAKES
    WHERE result = p_student_id;

END delete_takes;







