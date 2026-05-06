{{ config(materialized='view') }}

select
    kundeid,
    von,
    bis,
    strasse,
    hausnummer,
    adresszusatz,
    plz,
    ort,
    land,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'wohnort') }}