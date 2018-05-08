create or replace PROCEDURE insert_enrolls_in
(
    student_id 		VARCHAR2,
	  degree_id  		  VARCHAR2,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into ENROLLS_IN
  VALUES (ENROLLS_IN_TYPE(
        (SELECT REF(s) FROM student s WHERE s.pers_id = student_id),
        (SELECT REF(d) FROM degree d WHERE d.Deg_ID = degree_id)));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_enrolls_in;