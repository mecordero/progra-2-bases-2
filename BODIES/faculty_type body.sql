CREATE OR REPLACE
TYPE BODY FACULTY_TYPE AS

  constructor function faculty_type(
        fac_id           REAL,
        fac_name         VARCHAR2,
        fac_dean         REF admin_type)
        return self as result AS
  BEGIN
    self.fac_id := fac_id;
    self.fac_name := fac_name;
    self.fac_dean := fac_dean;
    self.department := nt_department();
    self.school := nt_school();
    self.researchcenter := nt_research_center();
    RETURN;
  END faculty_type;

END;