{{config(materialized='incremental')}}

{%- set yaml_metadata -%}

hashkey: 'hk_kunde_h'
business_keys: 
   - kundeid
source_models: 
   - name: stg_webshop_kunde
   - name: stg_webshop_bestellung
   - name: stg_roadshow_rsbestellung
   - name: stg_webshop_lieferadresse 
   - name: stg_webshop_vereinspartner
   - name: stg_webshop_wohnort

{%- endset -%}

{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}