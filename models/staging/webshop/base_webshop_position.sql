{{ config(materialized='view') }}

select
    bestellungid,
    posid,
    produktid,
    spezlieferadrid,
    menge,
    preis,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'position') }}