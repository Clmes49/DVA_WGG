{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_bestellung_lieferadresse_l'
foreign_hashkeys:
    - hk_bestellung_h
    - hk_lieferadresse_h
source_models:
    - name: stg_webshop_bestellung
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}