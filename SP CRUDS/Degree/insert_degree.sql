create or replace PROCEDURE insert_degreee
(
    Deg_ID varchar2, 
    Deg_Name varchar2,
    Deg_Length real,
    Deg_Prereq varchar2,
    Fac_ID    REAL,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into DEGREE
  VALUES (DEGREE_TYP(
        Deg_ID, 
        Deg_Name,
        Deg_Length,
        Deg_Prereq,
        (SELECT REF(f) FROM FACULTY f WHERE f.fac_id  = Fac_ID)));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_degreee;