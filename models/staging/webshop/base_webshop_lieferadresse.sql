{{ config(materialized='view') }}

select
    AllgLieferAdrID,
    KundeID,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from {{ source('webshop', 'lieferadresse') }}