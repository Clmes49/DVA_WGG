{{ config(materialized='view') }}

select
    kundeid,
    Von,
    Bis,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from {{ source('webshop', 'wohnort') }}