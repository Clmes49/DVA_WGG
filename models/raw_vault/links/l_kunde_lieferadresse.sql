{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_kunde_lieferadresse_l'
foreign_hashkeys:
   - hk_kunde_h
   - hk_lieferadresse_h
source_models:
   - name: stg_webshop_lieferadresse
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}