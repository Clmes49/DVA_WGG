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
   cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{source('roadshow', 'rs_bestellung')}}