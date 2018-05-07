CREATE OR REPLACE
TYPE BODY TECHNICIAN_TYPE AS

  constructor function technician_type(
        pers_id           REAL,
        pers_surname      VARCHAR2,
        pers_fname        VARCHAR2,
        pers_title        VARCHAR2,
        pers_address      VARCHAR2,
        pers_phone        REAL,
        pers_postcode     REAL,
        campus_location   VARCHAR2,
        bld_id            REF building_type,
        off_no            VARCHAR2,
        stafftype         VARCHAR2,
        tech_title        varchar2)
        return self as result AS
  BEGIN
    self.pers_id := pers_id;
    self.pers_surname := pers_surname;
    self.pers_fname := pers_fname;
    self.pers_title := pers_title;
    self.pers_address := pers_address;
    self.pers_phone := pers_phone;
    self.pers_postcode := pers_postcode;
    self.campus_location := campus_location;
    self.bld_id := bld_id;
    self.off_no := off_no;
    self.tech_skills := nt_tech_skills();
    RETURN;
  END technician_type;

END;