{{config(materialized='view')}}

{%- set yaml_metadata -%}

source_model: 'base_roadshow_vereinspartner'
ldts: 'ldts'
rsrc: '!ROADSHOW'
hashed_columns:
   hk_vereinspartner_h:
     - vereinspartnerid

   hd_vereinspartner_s:
     is_hashdiff: true
     columns:
     - kundeidverein
     - rabatt1
     - rabatt2
     - rabatt3
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
)}}