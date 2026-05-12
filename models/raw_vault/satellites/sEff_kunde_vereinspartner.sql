{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
tracked_hashkey: hk_kunde_vereinspartner_l
is_active_alias: 'active'
source_model: stg_webshop_kunde
{%- endset -%}

{{datavault4dbt.eff_sat_v0(yaml_metadata=yaml_metadata)}}