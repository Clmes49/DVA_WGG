{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_vereinspartner_l'
foreign_hashkeys:
   - hk_bestellung_h
   - hk_vereinspartner_h
source_models:
   - name: stg_roadshow_rsbestellung
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}