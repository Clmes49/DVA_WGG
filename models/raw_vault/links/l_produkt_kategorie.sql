{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
link_hashkey: 'hk_produkt_kategorie_l'
foreign_hashkeys:
   - 'hk_produkt_h'
   - 'hk_kategorie_h'
source_models: 
   - name: stg_webshop_produkt
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}