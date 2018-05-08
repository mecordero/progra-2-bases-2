create or replace PROCEDURE insert_campus
(
    Campus_ID real,
    Campus_Location varchar2,
    Campus_Address varchar2,
    Campus_Phone real,
    Campus_Fax real,
    staff_id    real,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into CAMPUS
  VALUES (CAMPUS_TYPE(
        Campus_ID,
        Campus_Location,
        Campus_Address,
        Campus_Phone,
        Campus_Fax,
        (SELECT REF(s) FROM staff s WHERE s.pers_id = staff_id)));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_campus;