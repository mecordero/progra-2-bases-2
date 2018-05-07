CREATE OR REPLACE PROCEDURE insert_takes
(
    student 		REF student_type,
	subject  		REF subject_type,
	marks			REAL,
    result          out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into TAKES
  VALUES (takes_type(
            student,
            subject,
            marks));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_takes;