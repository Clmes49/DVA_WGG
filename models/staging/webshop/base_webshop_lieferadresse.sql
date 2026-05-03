{{ config(materialized='view') }}

select
    LieferAdrID,
    KundeID,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'lieferadresse') }}