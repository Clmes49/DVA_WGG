
  create view "postgres"."dv"."base_webshop_lieferadresse__dbt_tmp"
    
    
  as (
    

select
    LieferAdrID,
    KundeID,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."lieferadresse"
  );