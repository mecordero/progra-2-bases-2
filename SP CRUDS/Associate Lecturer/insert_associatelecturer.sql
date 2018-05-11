CREATE OR REPLACE PROCEDURE insert_associatelecturer 
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
    no_honours        in REAL,
    year_join         in REAL,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into ASSOCIATELECTURER
  VALUES (associatelecturer_type(
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
        area,
        lect_type,
        no_honours,
        year_join));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_associatelecturer;