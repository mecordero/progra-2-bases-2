CREATE OR REPLACE PROCEDURE insert_takes
(
    student_id    varchar2,
  subject_id    REAl,
  marks     REAL,
    result          out real --1 bien 2 mal
)
AS 
BEGIN  
    result := 1;
  --inserta el objeto en la tabla
  insert into TAKES
  VALUES (takes_typ(
            (SELECT REF(s) FROM student s WHERE s.pers_id = student_id),
            (SELECT REF(sb) FROM subject sb WHERE sb.subj_id = subject_id),
            marks));
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        result := 2;
    
END insert_takes;