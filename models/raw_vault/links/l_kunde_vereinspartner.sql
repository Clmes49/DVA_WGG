{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_kunde_vereinspartner_l'
foreign_hashkeys:
   - hk_kunde_h
   - hk_vereinspartner_h
source_models:
   - name: stg_webshop_kunde
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}