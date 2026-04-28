{{ config(materialized='view') }}

select
    katid,
    oberkatID,
    name,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts
from {{ source('webshop', 'kategorie') }}