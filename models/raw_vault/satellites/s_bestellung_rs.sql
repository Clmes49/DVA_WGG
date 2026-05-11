{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_bestellung_h'
src_hashdiff: 'hd_rsbestellung_s'
src_payload:
    - kaufdatum
    - kreditkarte
    - gueltigbis
    - kkfirma
source_model: 'stg_roadshow_rsbestellung'
{%- endset -%}

{{datavault4dbt.sat_v0(yaml_metadata=yaml_metadata)}}