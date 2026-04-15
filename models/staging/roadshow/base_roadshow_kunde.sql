{{ config(materialized='view') }}

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
from {{ source('roadshow', 'kunde') }}