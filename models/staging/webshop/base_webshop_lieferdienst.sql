{{ config(materialized='view') }}

select
    lieferdienstid,
    name,
    telefon,
    fax,
    email,
    hausnummer,
    plz,
    ort,
    land,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'lieferdienst') }}