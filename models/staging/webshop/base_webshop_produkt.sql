{{ config(materialized='view') }}

select
    produktid,
    katid,
    bezeichnung,
    umfang,
    typ,
    preis,
    pflanzort,
    pflanzabstand,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'produkt') }}