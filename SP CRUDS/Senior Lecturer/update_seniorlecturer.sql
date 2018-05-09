CREATE OR REPLACE PROCEDURE update_seniorlecturer 
(
    pers_id           in REAL,
    pers_surname      in VARCHAR2,
    pers_fname        in VARCHAR2,
    pers_title        in VARCHAR2,
    pers_address      in VARCHAR2,
    pers_phone        in REAL,
    pers_postcode     in REAL,
    campus_location   in VARCHAR2,
    stafftype         in VARCHAR2,
    area              in VARCHAR2,
    lect_type         in VARCHAR2,
    no_phd            in REAL,
    no_master         in REAL,
    no_honours        in REAL,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  UPDATE SENIORLECTURER
  SET 
        sl.pers_id,
        sl.pers_surname,
        sl.pers_fname,
        sl.pers_title,
        pesl.rs_address,
        sl.pers_phone,
        sl.pers_postcode,
        sl.campus_location,
        sl.stafftype,
        sl.area,
        sl.lect_type,
        sl.no_phd,
        sl.no_master,
        sl.no_honours

  FROM SENIORLECTURER sl
  WHERE sl.pers_id = pers_id
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
COMMIT;
END update_seniorlecturer;