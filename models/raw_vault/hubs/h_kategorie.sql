{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_kategorie_h'
business_keys:
  - katid
source_models: 'stg_webshop_kategorie'
{%- endset -%}

{{ datavault4dbt.hub(
    yaml_metadata=yaml_metadata
) }}