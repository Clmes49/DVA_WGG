{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_position_l'
foreign_hashkeys:
   - hk_produkt_h
   - hk_bestellung_h
source_models:
   - name: stg_webshop_position
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}