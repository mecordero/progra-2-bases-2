CREATE OR REPLACE PROCEDURE read_seniorlecturer 
(
    p_pers_id         in REAL,
    pname             OUT SENIORLECTURER.pers_fname%TYPE
)
AS 
BEGIN  

  SELECT pers_fname INTO pname
  FROM SENIORLECTURER
  WHERE pers_id = p_pers_id;
END read_seniorlecturer;


