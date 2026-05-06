{{ config(materialized='view') }}

select
    cast(bestellungid as varchar) as bestellungid,
    posid,
    lieferadrid,
    lieferdienstid,
    lieferdatum,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'lieferung') }}