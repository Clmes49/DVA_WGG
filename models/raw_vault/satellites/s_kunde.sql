{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'
src_hashdiff: 'hd_kunde_s'
src_payload:
- vorname
- name
- geschlecht
- geburtsdatum
- telefon
- mobil
- email  
source_model: 'stg_webshop_kunde'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}