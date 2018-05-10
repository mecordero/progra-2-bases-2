create or replace PROCEDURE delete_subject
(
    p_subj_id           in VARCHAR2
)
AS 
BEGIN  

    DELETE FROM SUBJECT
    WHERE subj_id = p_subj_id;

END delete_subject;