{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
source_model: 'stg_webshop_wohnort'
parent_hashkey: 'hk_kunde_h'
src_hashdiff: 'hd_kunde_wohnort_s'
src_ma_key: 'von'
src_payload:
    - bis
    - strasse
    - hausnummer
    - adresszusatz
    - plz
    - ort
    - land
{%- endset -%}

{{datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata)}}