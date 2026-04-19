{{ config(materialized='view') }}

select
    BestellungID,
    KundeID,
    AllgLieferAdrID,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    current_timestamp as ldts
from {{ source('webshop', 'bestellung') }}