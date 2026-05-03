{{ config(materialized='view') }}

select
    bestellungid,
    posid,
    lieferadrid,
    lieferdienstid,
    lieferdatum,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'lieferung') }}