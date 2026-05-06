{{config(materialized='incremental')}}

{%- set yaml_metadata -%}

hashkey: 'hk_kunde_h'
business_keys: 
   - bestellungid
source_models: 
   - name: stg_webshop_kunde
   - name: stg_webshop_vereinspartner

{%- endset -%}

{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}