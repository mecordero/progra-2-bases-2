CREATE OR REPLACE PROCEDURE insert_subject 
(
    subj_id			VARCHAR2,
	subj_name		VARCHAR2,
	subj_credit		REAL,
	subj_prereq		REF subject_typ,
	pers_id			REF lecturer_typ,
  subj_description VARCHAR2
)
AS 
BEGIN  

  insert into SUBJECT
  VALUES (subject_typ(
        subj_id,
        subj_name,
        subj_credit,
        (SELECT REF(s) FROM subject s WHERE s.subj_id = subj_prereq),
        (SELECT REF(l) FROM lecturer l WHERE l.pers_id = pers_id),
        subj_description));

END insert_subject;



