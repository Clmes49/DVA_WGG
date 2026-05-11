{{ config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_produkt_h'
src_hashdiff: 'hd_produkt_s'
src_payload:
    - bezeichnung
    - umfang
    - typ
    - preis
    - pflanzort
    - pflanzabstand
source_model: 'stg_webshop_produkt'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}