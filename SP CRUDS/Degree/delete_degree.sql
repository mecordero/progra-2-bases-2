create or replace PROCEDURE delete_degree
(
    p_deg_id           in varchar2
)
AS 
BEGIN  

    DELETE FROM DEGREE
    WHERE deg_id = p_deg_id;

END delete_degree;