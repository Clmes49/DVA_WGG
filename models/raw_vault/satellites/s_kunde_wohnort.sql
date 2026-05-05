{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'
multi_active_key: 'von'
src_hashdiff: 'hd_kunde_wohnort_s'
src_payload:
    - von
    - bis
    - strasse
    - hausnummer
    - adresszusatz
    - plz
    - ort
    - land   
source_model: 'stg_webshop_wohnort'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}