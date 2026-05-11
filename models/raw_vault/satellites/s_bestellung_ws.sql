{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_bestellung_h'
src_hashdiff: 'hd_wsbestellung_s'
src_payload:
    - bestelldatum 
    - wunschdatum
    - rabatt
source_model: 'stg_webshop_bestellung'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}