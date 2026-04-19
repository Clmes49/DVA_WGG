{{config(materialized='view')}}
select
   bestellungid,
   kundeid,
   vereinspartnerid,
   kaufdatum,
   kreditkarte,
   gueltigbis,
   kkfirma,
   produktid,
   menge,
   preis,
   rabatt,
   current_timestamp as ldts
from {{source('roadshow', 'rs_bestellung')}}