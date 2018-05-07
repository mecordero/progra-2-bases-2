CREATE OR REPLACE PROCEDURE insert_subject 
(
    subj_id			VARCHAR2,
	subj_name		VARCHAR2,
	subj_credit		REAL,
	subj_prereq		REF subject_type,
	pers_id			REF lecturer_type,
    result            out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into SUBJECT
  VALUES (subject_type(
        subj_id,
        subj_name,
        subj_credit,
        subj_prereq,
        pers_id));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_subject;