{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_vereinspartner_h'
src_hashdiff: 'hd_vereinspartner_s'
src_payload:
    - rabatt1
    - rabatt2
    - rabatt3   
source_model: 'stg_webshop_vereinspartner'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}