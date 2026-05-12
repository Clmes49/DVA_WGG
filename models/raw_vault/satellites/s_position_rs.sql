{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_rs_position_l'
src_hashdiff: 'hd_rsposition_s'
src_payload:
   - menge
   - preis
   - rabatt
source_model: 'stg_roadshow_rsbestellung'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}