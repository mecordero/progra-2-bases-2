create or replace PROCEDURE read_building
(
    pBld_ID VARCHAR2,
    pname OUT BUILDING.bld_name%TYPE,
    plocation OUT BUILDING.bld_location%TYPE
)
AS 
BEGIN  

  SELECT bld_name, bld_location INTO pname,plocation
  FROM BUILDING
  WHERE Bld_ID = pBld_ID;

END read_building;