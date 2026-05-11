{{config(materialized='incremental')}}

# noch nicht fertig

{%- set yaml_metadata -%}
link_hashkey: 'hk_lieferung_l'
foreign_hashkeys:
   - 'hk_bestellung_h'
   - 'hk_lieferadresse_h'
   - 'hk_lieferdienst_h'
source_models: 
   - name: stg_webshop_produkt
{%- endset -%}

{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}