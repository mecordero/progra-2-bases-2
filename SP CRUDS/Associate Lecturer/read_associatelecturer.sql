CREATE OR REPLACE PROCEDURE read_associatelecturer 
(
    p_pers_id         in REAL,
    pname             OUT ASSOCIATELECTURER.pers_fname%TYPE
)
AS 
BEGIN  

  SELECT pers_fname INTO pname
  FROM associatelecturer
  WHERE pers_id = p_pers_id;

    
END read_associatelecturer;