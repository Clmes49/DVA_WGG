
  create view "postgres"."dv"."base_webshop_kategorie__dbt_tmp"
    
    
  as (
    

select
    KatID,
    OberKatID,
    Name,
    current_timestamp as ldts
from "postgres"."webshop"."kategorie"
  );