CREATE OR REPLACE PROCEDURE insert_student
(
    pers_id           in REAL,
    pers_surname      in VARCHAR2,
    pers_fname        in VARCHAR2,
    pers_title        in VARCHAR2,
    pers_address      in VARCHAR2,
    pers_phone        in REAL,
    pers_postcode     in REAL,
    campus_location   in VARCHAR2,
    year              in REAL,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into STUDENT
  VALUES (student_typ(
        pers_id,
        pers_surname,
        pers_fname,
        pers_title,
        pers_address,
        pers_phone,
        pers_postcode,
         (SELECT REF(c) FROM campus c WHERE c.Campus_Location = Campus_Location),
        year));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_student;