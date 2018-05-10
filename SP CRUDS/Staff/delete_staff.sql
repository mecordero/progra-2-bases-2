create or replace PROCEDURE delete_staff
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM STAFF
    WHERE pers_id = p_pers_id;

END delete_staff;