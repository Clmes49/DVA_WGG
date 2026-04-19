
  create view "postgres"."dv"."base_webshop_produkt__dbt_tmp"
    
    
  as (
    

select
    ProduktID,
    KatID,
    Bezeichnung,
    Umfang,
    Typ,
    Preis,
    Pflanzort,
    Pflanzabstand,
    current_timestamp as ldts
from "postgres"."webshop"."produkt"
  );