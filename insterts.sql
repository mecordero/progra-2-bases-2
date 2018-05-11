INSERT INTO ADMIN VALUES (1, 'Grant', 'Felix', 'Mr', 'Lomas', 12345678,3083, NULL, NULL, NULL, 'ADMIN', 'Manager', NULL, office_skills_nt(office_skills_typ('phone'))); 
INSERT INTO ADMIN VALUES (2, 'Lucio', 'Marco', 'Mr', 'Lomas', 12345678,3083, NULL, NULL, NULL, 'ADMIN', 'Manager', NULL, office_skills_nt(office_skills_typ('comp'))); 

--Select * from ADMIN;

INSERT INTO FACULTY VALUES (2, 'Biolo', (Select REF(a) from admin a where a.pers_id = 1), 
department_nt(department_typ(1, 'Bio', (Select REF(a) from admin a where a.pers_id = 1), dept_prof_nt(associatelecturer_typ(3,'Troya','Lorena','Ms', 'lomas', 87654321, 8011, NULL, NULL,NULL,'ASSOCL','monos','tipo',2,2010)))),
school_nt(school_typ(1,'human',(Select REF(a) from admin a where a.pers_id = 2), school_prof_nt(associatelecturer_typ(4,'Tulio','Jorge','Mr', 'tirra', 87654321, 8011, NULL, NULL,NULL,'ASSOCL','aves','tipo2',4, 2011)))),
research_center_nt(research_center_typ(1,'primarycare', (Select REF(a) from admin a where a.pers_id = 2), rc_unit_nt(rc_units_typ('unidad')))));

SELECT d.* from faculty f, TABLE(f.department) d;

BEGIN
FACULTY_TYP.DISPLAYENCARGADOS();
END;

