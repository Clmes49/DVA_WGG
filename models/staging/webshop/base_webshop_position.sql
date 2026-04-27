{{ config(materialized='view') }}

select
    BestellungID,
    PosID,
    ProduktID,
    SpezLieferAdrID,
    Menge,
    Preis,
    current_timestamp as ldts
from {{ source('webshop', 'position') }}