{{config(materialized='view')}}

select 
   vereinspartnerid,
   kundeidverein,
   rabatt1,
   rabatt2,
   rabatt3,
   current_timestamp as ldts
from {{source('roadshow', 'vereinspartner')}}