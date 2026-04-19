{{config(materialized='view')}}
{%- set yaml_metadata -%}
source_model: 'base_roadshow_produkt'
ldts: 'ldts'
rsrc: '!ROADSHOW'
hashed_columns:
   hk_produkt_h:
    - produktid
   hd_produkt_s:
     is_hashdiff: true
     columns:
       - katid
       - bezeichnung
       - umfang
       - typ
       - preis
       - pflanzort
       - pflanzabstand
{%- endset -%}

{{datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
)}}