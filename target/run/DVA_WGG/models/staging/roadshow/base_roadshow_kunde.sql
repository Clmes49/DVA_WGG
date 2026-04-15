
  create view "postgres"."dv"."base_roadshow_kunde__dbt_tmp"
    
    
  as (
    

select
    kundeid,
    vereinspartnerid,
    vorname,
    name,
    geschlecht,
    geburtsdatum,
    telefon,
    mobil,
    email,
    kreditkarte,
    gueltigbis,
    kkfirma,
    current_timestamp as ldts
from "postgres"."roadshow"."kunde"
  );