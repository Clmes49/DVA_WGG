{{config(materialized='view')}}
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
from {{source('roadshow', 'produkt')}}