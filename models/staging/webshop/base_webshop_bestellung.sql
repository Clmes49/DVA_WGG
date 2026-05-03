{{ config(materialized='view') }}

select
    BestellungID,
    KundeID,
    AllgLieferAdrID,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'bestellung') }}