{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_position_l'
src_hashdiff: 'hd_position_s'
src_payload:
    - posid
    - spezlieferadrid
    - menge
    - preis
source_model: 'stg_webshop_position'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}