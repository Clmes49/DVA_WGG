
  create view "postgres"."dv"."base_webshop_sohnort__dbt_tmp"
    
    
  as (
    

select
    KundeID,
    Von,
    Bis,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."lieferdienst"
  );