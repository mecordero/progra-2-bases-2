CREATE OR REPLACE PROCEDURE insert_tutor 
(
    no_hours		REAL,
    rate    		FLOAT,
    student   		REF student_type,
    staff           REF staff_type,
    result          out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into TUTOR
  VALUES (TUTOR_TYPE(
        no_hours,
        rate,
        student,
        staff));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_tutor;