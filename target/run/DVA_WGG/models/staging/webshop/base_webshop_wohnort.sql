
  create view "postgres"."dv"."base_webshop_wohnort__dbt_tmp"
    
    
  as (
    

select
    kundeid,
    Von,
    Bis,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."wohnort"
  );