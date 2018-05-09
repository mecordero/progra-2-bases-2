create or replace PROCEDURE insert_building
(
    pBld_ID VARCHAR2,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  SELECT *
  FROM BUILDING
  WHERE BUILDING.Bld_ID = pBld_ID
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;

END insert_building;