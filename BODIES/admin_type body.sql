create or replace TYPE BODY ADMIN_TYPE AS

  constructor function ADMIN_TYPE(
        pers_id           in REAL,
        pers_surname      in VARCHAR2,
        pers_fname        in VARCHAR2,
        pers_title        in VARCHAR2,
        pers_address      in VARCHAR2,
        pers_phone        in REAL,
        pers_postcode     in REAL,
        campus_location   in VARCHAR2,
        bld_id      in REF building_type,
        off_no      in VARCHAR2,
        stafftype   in VARCHAR2,
        admin_title     VARCHAR2)
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
    self.stafftype := stafftype;
    self.admin_title := admin_title;
    self.comp_skills := nt_comp_skills();
    self.office_skills := nt_office_skills();
    RETURN;
  END admin_type;

END;
