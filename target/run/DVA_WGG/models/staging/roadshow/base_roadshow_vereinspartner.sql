
  create view "postgres"."dv"."base_roadshow_vereinspartner__dbt_tmp"
    
    
  as (
    

select 
   vereinspartnerid,
   kundeidverein,
   rabatt1,
   rabatt2,
   rabatt3,
   current_timestamp as ldts
from "postgres"."roadshow"."vereinspartner"
  );