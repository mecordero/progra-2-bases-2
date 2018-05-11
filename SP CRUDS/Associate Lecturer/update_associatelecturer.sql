CREATE OR REPLACE PROCEDURE update_associatelecturer 
(
    pers_id           in REAL,
    pers_surname      in VARCHAR2,
    pers_fname        in VARCHAR2,
    pers_title        in VARCHAR2,
    pers_address      in VARCHAR2,
    pers_phone        in REAL,
    pers_postcode     in REAL,
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
  UPDATE ASSOCIATELECTURER
  SET 
        pers_id = pers_id,
        pers_surname = pers_surname,
        pers_fname = pers_fname,
        pers_title = pers_title,
        pers_address = pers_address,
        pers_phone = pers_phone,
        pers_postcode = pers_postcode,
        staff_type = stafftype,
        area = area,
        lect_type = lect_type,
        no_honours = no_honours

  WHERE pers_id = pers_id;
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
COMMIT;
END update_associatelecturer;