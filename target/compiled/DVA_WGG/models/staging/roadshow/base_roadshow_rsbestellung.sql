
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
from "postgres"."roadshow"."rs_bestellung"