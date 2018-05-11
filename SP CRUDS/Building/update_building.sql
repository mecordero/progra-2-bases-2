create or replace PROCEDURE update_building
(
    pBld_ID VARCHAR2,
    pBld_Name varchar2,
    pBld_Location varchar2,
    pBls_Level real,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  UPDATE BUILDING
  SET  
  bld_name = pBld_Name,
  bld_location = pBld_Location,
  bld_level = pBls_Level 
  WHERE bld_id = pBld_ID;

  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
COMMIT;
END update_building;