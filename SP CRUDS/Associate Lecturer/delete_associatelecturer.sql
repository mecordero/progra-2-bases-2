create or replace PROCEDURE delete_associatelecturer 
(
    p_pers_id           in REAL
)
AS 
BEGIN  

    DELETE FROM ASSOCIATELECTURER
    WHERE pers_id = p_pers_id;

END delete_associatelecturer;