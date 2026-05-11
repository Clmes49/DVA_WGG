{{ config(materialized='view') }}

select
    CAST(BestellungID AS VARCHAR) AS bestellungid,
    KundeID,
    AllgLieferAdrID,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'bestellung') }}