create or replace PROCEDURE delete_faculty
(
    p_fac_id           in REAL
)
AS 
BEGIN  

    DELETE FROM FACULTY
    WHERE fac_id = p_fac_id;

END delete_faculty;