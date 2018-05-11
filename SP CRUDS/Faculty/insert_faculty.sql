create or replace PROCEDURE insert_faculty
(
    fac_id           REAL,
    fac_name         VARCHAR2,
    fac_dean         VARCHAR2,
    department       department_nt,
    school           school_nt,
    research_center  research_center_nt

)
AS 
BEGIN  

  insert into FACULTY
  VALUES (FACULTY_TYP(
        fac_id,
        fac_name,
        (SELECT REF(a) FROM admin a WHERE a.pers_id  = fac_name),
        department,
        school,
        research_center));

END insert_faculty;