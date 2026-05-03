{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_produkt_h'
business_keys:
  - produktid
source_models: 'stg_webshop_produkt'
{%- endset -%}

{{ datavault4dbt.hub(
    yaml_metadata=yaml_metadata
) }}