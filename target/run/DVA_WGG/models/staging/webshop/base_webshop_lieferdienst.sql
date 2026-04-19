
  create view "postgres"."dv"."base_webshop_lieferdienst__dbt_tmp"
    
    
  as (
    

select
    LieferDienstID,
    Name,
    Telefon,
    Fax,
    Email,
    Hausnummer,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."lieferdienst"
  );