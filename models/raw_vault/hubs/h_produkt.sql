{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_produkt_h'
business_keys:
  - produktid
source_models: 
  - name: stg_webshop_produkt
  - name: stg_roadshow_rsbestellung
{%- endset -%}

{{ datavault4dbt.hub(
    yaml_metadata=yaml_metadata
) }}