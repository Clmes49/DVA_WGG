{{ config(materialized='view') }}

select
    cast(bestellungid as varchar) as bestellungid,
    posid,
    produktid,
    spezlieferadrid,
    menge,
    preis,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'position') }}