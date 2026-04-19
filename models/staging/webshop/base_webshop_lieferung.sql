{{ config(materialized='view') }}

select
    BestellungID,
    PosID,
    LieferAdrID,
    LieferDienstID,
    Lieferdatum,
    current_timestamp as ldts
from {{ source('webshop', 'lieferung') }}