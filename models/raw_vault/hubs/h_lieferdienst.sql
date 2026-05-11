{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_lieferdienst_h'
business_keys:
  - lieferdienstid
source_models: 
  - name: stg_webshop_lieferdienst
  - name: stg_webshop_lieferung
{%- endset -%}

{{ datavault4dbt.hub(
    yaml_metadata=yaml_metadata
) }}