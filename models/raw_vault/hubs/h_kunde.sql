{{config(materialized='incremental')}}

{%- set yaml_metadata -%}

hashkey: 'hk_kunde_h'
business_keys: 
   - kundeid
source_models: 
   - name: stg_webshop_kunde

{%- endset -%}

{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}