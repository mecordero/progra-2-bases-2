create or replace PROCEDURE insert_building
(
    Bld_ID VARCHAR2,
    Bld_Name varchar2,
    Bld_Location varchar2,
    Bls_Level real,
    Campus_Location varchar,
    Fac_ID    REF  faculty_type,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into BUILDING
  VALUES (BUILDING_TYPE(
        Bld_ID,
        Bld_Name,
        Bld_Location,
        Bls_Level,
        Campus_Location,
        Fac_ID));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_building;