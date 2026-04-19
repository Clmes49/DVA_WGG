{{ config(materialized='view') }}

select
    KatID,
    OberKatID,
    Name,
    current_timestamp as ldts
from {{ source('webshop', 'kategorie') }}