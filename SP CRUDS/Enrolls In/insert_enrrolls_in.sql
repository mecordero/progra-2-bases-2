create or replace PROCEDURE insert_enrolls_in
(
    student 		REF student_type,
	degree  		REF degree_type,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into ENROLLS_IN
  VALUES (ENROLLS_IN_TYPE(
        student,
        degree));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_enrolls_in;