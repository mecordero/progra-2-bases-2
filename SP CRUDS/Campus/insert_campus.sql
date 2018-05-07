create or replace PROCEDURE insert_campus
(
    Campus_ID real,
    Campus_Location varchar2,
    Campus_Address varchar2,
    Campus_Phone real,
    Campus_Fax real,
    Campus_Head  REF staff_type,
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
        Campus_Head));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_campus;