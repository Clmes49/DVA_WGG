{{ config(materialized='view') }}

select
    VereinspartnerID,
    KundeIDVerein,
    Rabatt1,
    Rabatt2,
    Rabatt3,
    current_timestamp as ldts
from {{ source('webshop', 'vereinspartner') }}