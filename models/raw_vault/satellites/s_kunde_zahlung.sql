{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'
src_hashdiff: 'hd_kunde_zahlung_s'
src_payload:
    - kreditkarte
    - gueltigbis
    - kkfirma
source_model: 'stg_webshop_kunde'
{%- endset -%}    

{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}