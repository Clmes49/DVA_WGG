
  create view "postgres"."dv"."base_webshop_lieferung__dbt_tmp"
    
    
  as (
    

select
    BestellungID,
    PosID,
    LieferAdrID,
    LieferDienstID,
    Lieferdatum,
    current_timestamp as ldts
from "postgres"."webshop"."lieferung"
  );