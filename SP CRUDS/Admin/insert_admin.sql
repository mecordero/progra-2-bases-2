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
    bld_id            in VARCHAR2,
    off_no            in VARCHAR2,
    stafftype         in VARCHAR2,
    admin_title       in VARCHAR2,
    comp_skills       comp_skills_nt,
    office_skills     office_skills_nt,
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
        (SELECT REF(c) FROM campus c WHERE c.Campus_Location = Campus_Location),
        (SELECT REF(b) FROM building b WHERE b.bld_id  = bld_id ),
        (SELECT REF(o) FROM office o WHERE o.bld_id = bld_id and o.off_no=off_no),
        stafftype,
        admin_title,
        comp_skills,
        office_skills));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_admin;