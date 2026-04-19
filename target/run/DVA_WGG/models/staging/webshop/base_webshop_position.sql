
  create view "postgres"."dv"."base_webshop_position__dbt_tmp"
    
    
  as (
    

select
    BestellungID,
    PosID,
    ProduktID,
    SpezLieferAdrID,
    Menge,
    Preis,
    current_timestamp as ldts
from "postgres"."webshop"."position"
  );