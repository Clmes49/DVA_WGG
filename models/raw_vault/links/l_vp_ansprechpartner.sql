{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_vp_ansprechpartner_l'
foreign_hashkeys:
    - hk_vereinspartner_h
    - hk_kunde_h
source_models:
    - name: stg_webshop_vereinspartner
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}