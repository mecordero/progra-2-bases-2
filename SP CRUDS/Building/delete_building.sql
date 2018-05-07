create or replace PROCEDURE delete_building
(
    p_bld_id           in VARCHAR2
)
AS 
BEGIN  

    DELETE FROM BUILDING
    WHERE bld_id = p_bld_id;

END delete_building;