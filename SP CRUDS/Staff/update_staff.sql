CREATE OR REPLACE PROCEDURE update_staff
(
    p_pers_id           in REAL,
    p_pers_surname      in VARCHAR2,
    p_pers_fname        in VARCHAR2,
    p_pers_title        in VARCHAR2,
    p_pers_address      in VARCHAR2,
    p_pers_phone        in REAL,
    p_pers_postcode     in REAL,
    p_campus_location   in VARCHAR2,
    p_bld_id            in VARCHAR2,
    p_off_no            in VARCHAR2,
    p_stafftype          in VARCHAR2,
    p_result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
UPDATE STAFF
  SET 
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
        stafftype
FROM STAFF
WHERE pers_id = p_pers_id
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END update_staff;