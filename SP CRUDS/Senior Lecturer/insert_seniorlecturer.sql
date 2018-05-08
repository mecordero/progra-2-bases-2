CREATE OR REPLACE PROCEDURE insert_seniorlecturer 
(
    pers_id           in REAL,
    pers_surname      in VARCHAR2,
    pers_fname        in VARCHAR2,
    pers_title        in VARCHAR2,
    pers_address      in VARCHAR2,
    pers_phone        in REAL,
    pers_postcode     in REAL,
    campus_location   in VARCHAR2,
    bld_id            in VARCHAR2,
    off_no            in VARCHAR2,
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
  insert into SENIORLECTURER
  VALUES (seniorlecturer_type(
        pers_id,
        pers_surname,
        pers_fname,
        pers_title,
        pers_address,
        pers_phone,
        pers_postcode,
        campus_location,
        (SELECT REF(b) FROM building b WHERE b.Bld_ID = bld_id),
        off_no,
        stafftype,
        area,
        lect_type,
        no_phd,
        no_master,
        no_honours));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_seniorlecturer;