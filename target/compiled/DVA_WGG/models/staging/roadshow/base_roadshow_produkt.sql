
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