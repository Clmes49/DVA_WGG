
  create view "postgres"."dv"."base_webshop_bestellung__dbt_tmp"
    
    
  as (
    

select
    BestellungID,
    KundeID,
    AllgLieferAdrID,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    current_timestamp as ldts
from "postgres"."webshop"."bestellung"
  );