create or replace PROCEDURE insert_faculty
(
    fac_id           REAL,
    fac_name         VARCHAR2,
    fac_dean         REF admin_type,
    result           out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into FACULTY
  VALUES (FACULTY_TYPE(
        fac_id,
        fac_name,
        fac_dean));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_faculty;