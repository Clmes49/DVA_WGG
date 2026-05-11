{{ config(materialized='view') }}

select
    vereinspartnerid,
    kundeidverein as kundeid,
    rabatt1,
    rabatt2,
    rabatt3,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'vereinspartner') }}