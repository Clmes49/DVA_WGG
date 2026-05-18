{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_lieferdienst_h'
src_hashdiff: 'hd_lieferdienst_s'
src_payload:
    - name
    - telefon
    - fax
    - email
    - hausnummer
    - plz
    - ort
    - land
source_model: 'stg_webshop_lieferdienst'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}