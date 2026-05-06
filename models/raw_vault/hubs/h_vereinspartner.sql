{{config(materialized='incremental')}}

{%- set yaml_metadata -%}

hashkey: 'hk_vereinspartner_h'
business_keys: 
   - vereinspartnerid
source_models: 
   - name: stg_webshop_vereinspartner
   - name: stg_webshop_kunde

{%- endset -%}

{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}