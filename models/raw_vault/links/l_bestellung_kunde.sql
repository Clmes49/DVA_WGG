{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_kunde_l'
foreign_hashkeys:
   - hk_kunde_h
   - hk_bestellung_h
source_models:
   - name: stg_webshop_bestellung
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}