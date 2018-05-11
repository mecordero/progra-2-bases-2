CREATE OR REPLACE PROCEDURE insert_tutor 
(
    no_hours		REAL,
    rate    		FLOAT,
    staff         VARCHAR2,
    student       VARCHAR2,
    result          out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into TUTOR
  VALUES (TUTOR_TYP(
        no_hours,
        rate,
        (SELECT REF(a) FROM admin a WHERE a.pers_id  = staff),
        (SELECT REF(s) FROM student s WHERE s.pers_id = student)
         ));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_tutor;

-----HAY QUE ARREGLARLE BIEN EL STAFF QUE RECIBE, 
-----HACER UN SELECT PARA QUE OBTENGA EL DE TODOS