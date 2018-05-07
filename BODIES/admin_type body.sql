CREATE OR REPLACE
TYPE BODY ADMIN_TYPE AS

  constructor function admin_type(
        admin_title varchar2)
        return self as result AS
  BEGIN
        self.admin_title := admin_title;
        self.comp_skills := nt_comp_skills();
        self.office_skills := nt_office_skills();
    RETURN;
  END admin_type;

END;
