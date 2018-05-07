create or replace TYPE BODY DEPARTMENT_TYPE AS

  constructor function department_type(
        dept_id varchar2,
        dept_name varchar2,
        dept_head ref admin_type)
        return self as result AS
  BEGIN
    self.dept_id := dept_id;
    self.dept_name := dept_name;
    self.dept_head := dept_head;
    self.dept_profs := nt_lecturerlist();
    RETURN;
  END department_type;

END;