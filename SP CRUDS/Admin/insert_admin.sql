CREATE OR REPLACE PROCEDURE insert_admin 
(
    pers_id           in REAL,
    pers_surname      in VARCHAR2,
    pers_fname        in VARCHAR2,
    pers_title        in VARCHAR2,
    pers_address      in VARCHAR2,
    pers_phone        in REAL,
    pers_postcode     in REAL,
    campus_location   in VARCHAR2,
    bld_id            in REF building_type,
    off_no            in VARCHAR2,
    stafftype         in VARCHAR2,
    admin_title       in VARCHAR2,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into ADMIN
  VALUES (ADMIN_TYPE(
        pers_id,
        pers_surname,
        pers_fname,
        pers_title,
        pers_address,
        pers_phone,
        pers_postcode,
        campus_location,
        bld_id,
        off_no,
        stafftype,
        admin_title));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_admin;