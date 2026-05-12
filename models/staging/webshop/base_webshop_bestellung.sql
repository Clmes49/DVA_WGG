{{ config(materialized='view') }}

select
    CAST(BestellungID AS VARCHAR) AS bestellungid,
    KundeID,
    AllgLieferAdrID as lieferadrid,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'bestellung') }}t