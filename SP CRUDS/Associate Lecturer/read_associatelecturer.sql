CREATE OR REPLACE PROCEDURE read_associatelecturer 
(
    p_pers_id         in REAL,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  SELECT *
  FROM associatelecturer
  WHERE pers_id = p_pers_id
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END read_associatelecturer;