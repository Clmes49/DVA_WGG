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
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'kunde') }}