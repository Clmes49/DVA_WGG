{{config(materialized='incremental')}}

{%- set yaml_metadata -%}
hashkey: 'hk_lieferadresse_h'
business_keys:
   - lieferadrid
source_models:
   - name: stg_webshop_bestellung
   - name: stg_webshop_lieferung
   - name: stg_webshop_lieferadresse
{%- endset -%}

{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}