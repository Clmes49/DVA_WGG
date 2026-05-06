{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_kategorie_hierarchie_l'
foreign_hashkeys:
    - hk_kategorie_h
    - hk_oberkategorie_h
source_models:
    - name: stg_webshop_kategorie
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}