
  create view "postgres"."dv"."base_roadshow_produkt__dbt_tmp"
    
    
  as (
    
select
   produktid,
   katid,
   bezeichnung,
   umfang,
   typ,
   preis,
   pflanzort,
   pflanzabstand,
   current_timestamp as ldts
from "postgres"."roadshow"."produkt"
  );