DROP TABLE admin CASCADE CONSTRAINTS;

DROP TABLE associatelecturer CASCADE CONSTRAINTS;

DROP TABLE faculty CASCADE CONSTRAINTS;

DROP TABLE seniorlecturer CASCADE CONSTRAINTS;

DROP TABLE student CASCADE CONSTRAINTS;

DROP TABLE technician CASCADE CONSTRAINTS;

DROP TABLE building CASCADE CONSTRAINTS;

DROP TABLE campus CASCADE CONSTRAINTS;

DROP TABLE class CASCADE CONSTRAINTS;

DROP TABLE degree CASCADE CONSTRAINTS;

DROP TABLE enrolls_in CASCADE CONSTRAINTS;

DROP TABLE tutor CASCADE CONSTRAINTS;

DROP TABLE subject CASCADE CONSTRAINTS;

DROP TABLE office CASCADE CONSTRAINTS;

DROP TABLE lab CASCADE CONSTRAINTS;

DROP TABLE takes CASCADE CONSTRAINTS;

DROP TABLE EQUIPMENT CASCADE CONSTRAINTS;--creo que esta no es necesaria

DROP TABLE dean_of_fac

DROP type dean_of_fac_type

DROP type admin_type force;

DROP type ASSOCIATELECTURER_TYPE force;

DROP type BUILDING_TYPE force;

DROP type CAMPUS_TYPE force;

DROP type CLASS_TYPE force;

DROP type COMP_SKILLS_TYPE force;

DROP type DEGREE_TYPE force;

DROP type DEPARTMENT_TYPE force;

DROP type ENROLLS_IN_TYPE force;

DROP type EQUIPMENT_TYPE force;

DROP type FACULTY_TYPE force;

DROP type LAB_TYPE force;

DROP type LECTURER_TYPE force;

DROP type LECTURERLIST_TYPE force;

DROP type NT_COMP_SKILLS force;

DROP type NT_DEPARTMENT force;

DROP type NT_EQUIPMENT force;

DROP type NT_LECTURERLIST force;

DROP type NT_OFFICE_SKILLS force;

DROP type NT_RESEARCH_CENTER force;

DROP type NT_SCHOOL force;

DROP type NT_TECH_SKILLS force;

DROP type NT_UNITLIST force;

DROP type OFFICE_SKILLS_TYPE force;

DROP type OFFICE_TYPE force;

DROP type PERSON_TYPE force;

DROP type RESEARCH_CENTER_TYPE force;

DROP type SCHOOL_TYPE force;

DROP type SENIORLECTURER_TYPE force;

DROP type STAFF_TYPE force;

DROP type STUDENT_TYPE force;

DROP type SUBJECT_TYPE force;

DROP type TAKES_TYPE force;

DROP type TECH_SKILLS_TYPE force;

DROP type TECHNICIAN_TYPE force;

DROP type TUTOR_TYPE force;

DROP type UNITLIST_TYPE force;


CREATE OR REPLACE TYPE person_type AS OBJECT (
    pers_id           REAL,
    pers_surname      VARCHAR2(25),
    pers_fname        VARCHAR2(25),
    pers_title        VARCHAR2(3),
    pers_address      VARCHAR2(100),
    pers_phone        REAL,
    pers_postcode     REAL,
    campus_location   VARCHAR2(50)
) NOT FINAL NOT INSTANTIABLE;
/


CREATE OR REPLACE TYPE faculty_type AS OBJECT (
    fac_id           REAL,
    fac_name         VARCHAR2(50),
    department       nt_department,
    school           nt_school,
    researchcenter   nt_research_center,
    constructor function faculty_type(
        fac_id           REAL,
        fac_name         VARCHAR2)
        return self as result
) NOT FINAL;
/

create or replace type dean_of_fac_type as object(
    Fac_ID           REF  faculty_type,
    fac_dean         REF admin_type
)
/

CREATE TABLE dean_of_fac OF dean_of_fac_type;
/

create or replace type Building_type as object(
    Bld_ID VARCHAR2(25),
    Bld_Name varchar2(50),
    Bld_Location varchar2(3),
    Bls_Level real,
    Campus_Location varchar(50),
    Fac_ID    REF  faculty_type
)
/

CREATE OR REPLACE TYPE staff_type UNDER person_type (
    bld_id      REF building_type,
    off_no      VARCHAR2(10),
    stafftype   VARCHAR2(20)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE comp_skills_type AS OBJECT (
    name   VARCHAR2(25)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE nt_comp_skills IS
    TABLE OF comp_skills_type;
/

CREATE OR REPLACE TYPE office_skills_type AS OBJECT (
    name   VARCHAR2(25)
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_office_skills IS
    TABLE OF office_skills_type;
/

create or replace TYPE admin_type UNDER staff_type (
    admin_title     VARCHAR2(50),
    comp_skills     nt_comp_skills,
    office_skills   nt_office_skills,
    constructor function admin_type(
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
        return self as result
) FINAL;
/

CREATE OR REPLACE TYPE lecturer_type UNDER staff_type (
    area        VARCHAR2(50),
    lect_type   VARCHAR2(25)
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE associatelecturer_type UNDER lecturer_type (
    no_honours   REAL,
    year_join    REAL
) NOT FINAL;
/

CREATE OR REPLACE TYPE lecturerlist_type AS OBJECT (
    lecturer   REF lecturer_type
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_lecturerlist IS
    TABLE OF lecturerlist_type;
/

create or replace TYPE department_type AS OBJECT (
    dept_id      VARCHAR2(5),
    dept_name    VARCHAR2(50),
    dept_head    REF admin_type,
    dept_profs   nt_lecturerlist,
    constructor function department_type(
        dept_id varchar2,
        dept_name varchar2,
        dept_head ref admin_type)
        return self as result
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_department IS
    TABLE OF department_type;
/

CREATE OR REPLACE TYPE school_type AS OBJECT (
    school_id      VARCHAR2(5),
    school_name    VARCHAR2(50),
    school_head    REF admin_type,
    school_profs   nt_lecturerlist
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_school IS
    TABLE OF school_type;
/

CREATE OR REPLACE TYPE unitlist_type AS OBJECT (
    name   VARCHAR2(50)
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_unitlist IS
    TABLE OF unitlist_type;
/

CREATE OR REPLACE TYPE research_center_type AS OBJECT (
    rc_id     VARCHAR2(5),
    rc_name   VARCHAR2(50),
    rc_head   REF admin_type,
    rc_unit   nt_unitlist
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_research_center IS
    TABLE OF research_center_type;
/

CREATE OR REPLACE TYPE seniorlecturer_type UNDER lecturer_type (
    no_phd       REAL,
    no_master    REAL,
    no_honours   REAL
) NOT FINAL;
/

CREATE OR REPLACE TYPE student_type UNDER person_type (
    year   REAL
) FINAL;
/

CREATE OR REPLACE TYPE tech_skills_type AS OBJECT (
    name   VARCHAR2(25)
) NOT FINAL;
/

CREATE OR REPLACE TYPE nt_tech_skills IS
    TABLE OF tech_skills_type;
/

CREATE OR REPLACE TYPE technician_type UNDER staff_type (
    tech_title    VARCHAR2(50),
    tech_skills   nt_tech_skills,
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
        return self as result
) NOT FINAL;
/

CREATE TABLE admin OF admin_type (pers_id primary key)
    NESTED TABLE comp_skills 
--  WARNING: Using column name as default storage_table name for nested column Comp_Skills 
     STORE AS comp_skills_nt NESTED TABLE office_skills 
--  WARNING: Using column name as default storage_table name for nested column Office_Skills 
     STORE AS office_skills_nt;

CREATE TABLE associatelecturer OF associatelecturer_type (pers_id primary key);

CREATE TABLE faculty OF faculty_type (fac_id primary key)
    NESTED TABLE department 
--  WARNING: Using column name as default storage_table name for nested column Department 
     STORE AS department
     (NESTED TABLE dept_profs STORE AS dept_profs_nt)
     NESTED TABLE school 
--  WARNING: Using column name as default storage_table name for nested column School 
     STORE AS school
     (NESTED TABLE school_profs STORE AS school_profs_nt)
     NESTED TABLE researchcenter 
--  WARNING: Using column name as default storage_table name for nested column ResearchCenter 
     STORE AS researchcenter
     (NESTED TABLE rc_unit STORE AS rc_unit_nt);

CREATE TABLE seniorlecturer OF seniorlecturer_type (pers_id primary key);

CREATE TABLE student OF student_type(pers_id primary key);

CREATE TABLE technician OF technician_type
    NESTED TABLE tech_skills 
--  WARNING: Using column name as default storage_table name for nested column Tech_Skills 
     STORE AS tech_skills_nt;

create or replace type Degree_type as object (
    Deg_ID varchar2(5), 
    Deg_Name varchar2(50),
    Deg_Length real,
    Deg_Prereq varchar2(50),
    Fac_ID    REF  faculty_type
)
/

create or replace type Campus_type as object (
    Campus_ID real,
    Campus_Location varchar2(50),
    Campus_Address varchar2(100),
    Campus_Phone real,
    Campus_Fax real,
    Campus_Head  REF staff_type
)
/

CREATE TABLE degree OF degree_type(deg_id primary key);
CREATE TABLE campus OF campus_type(campus_id primary key);
CREATE TABLE building OF building_type(bld_id primary key);


CREATE OR REPLACE TYPE enrolls_in_type AS OBJECT (
	student 		REF student_type,
	degree  		REF degree_type

);
/
CREATE TABLE enrolls_in OF enrolls_in_type;
/

CREATE OR REPLACE TYPE takes_type AS OBJECT (
	student 		REF student_type,
	subject  		REF subject_type,
	marks			REAL

);
/

CREATE TABLE takes OF takes_type;
/


CREATE OR REPLACE TYPE subject_type AS OBJECT (
	subj_id			VARCHAR2(25),
	subj_name		VARCHAR2(50),
	subj_credit		REAL,
	subj_prereq		REF subject_type,
	pers_id			REF lecturer_type
);
/
CREATE TABLE subject OF subject_type(subj_id primary key);
/


-------------------------------
-------------------------------
CREATE CLUSTER off_class_lab_cluster
   				(bld_id REF building_type)
SIZE 512;
/
CREATE INDEX idx_off_class_lab_cluster ON CLUSTER off_class_lab_cluster;

/
CREATE OR REPLACE TYPE office_type AS OBJECT (
	bld_id 		REF building_type,
	off_no 		VARCHAR2(10),
	off_phone 	REAL
);
/

CREATE TABLE office OF office_type
	CLUSTER 	off_class_lab_cluster (bld_id);

/
CREATE OR REPLACE TYPE class_type AS OBJECT (
	bld_id	 		REF building_type,
	class_no 		VARCHAR2(10),
	class_capacity 	REAL
);
/

CREATE TABLE class OF class_type
	CLUSTER 	off_class_lab_cluster (bld_id);
/
CREATE OR REPLACE TYPE equipment_type AS OBJECT (
	equi_name		VARCHAR2(25)
);
/

CREATE TYPE nt_equipment
AS TABLE OF equipment_type;

/
CREATE OR REPLACE TYPE lab_type AS OBJECT (
	bld_id 			REF building_type,
	lab_no	 		VARCHAR2(10),
	lab_capacity 	REAL,
	lab_equip		nt_equipment
);
/

CREATE TABLE lab OF lab_type
	CLUSTER 	off_class_lab_cluster (bld_id)
    NESTED TABLE lab_equip STORE AS equipment;

/

create or replace TYPE tutor_type AS OBJECT(
    no_hours		REAL,
    rate    		FLOAT(15),
    student   		REF student_type,
    staff           REF staff_type
) NOT FINAL;
/

CREATE TABLE TUTOR OF TUTOR_TYPE;
/

--pk de las tablas anidadas
ALTER TABLE school
ADD CONSTRAINT school_pk PRIMARY KEY (school_id);
/
ALTER TABLE department
ADD CONSTRAINT department_pk PRIMARY KEY (dept_id);
/
ALTER TABLE researchcenter
ADD CONSTRAINT researchcenter_pk PRIMARY KEY(rc_id);
/
ALTER TABLE office
ADD CONSTRAINT office_pk PRIMARY KEY(bld_id, off_no);
/
ALTER TABLE class
ADD CONSTRAINT class_pk PRIMARY KEY(bld_id, class_no);
/
ALTER TABLE lab
ADD CONSTRAINT lab_pk PRIMARY KEY(bld_id, lab_no);
/
