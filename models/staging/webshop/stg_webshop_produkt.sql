{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_produkt'
ldts: 'ldts'
rsrc: '!WEBSHOP'

hashed_columns:

  #  Hubs
  hk_produkt_h:
    - produktid

  hk_kategorie_h:
    - katid


  #  Link
  hk_produkt_kategorie_l:
    - produktid
    - katid


  #  Satellite
  hd_produkt_s:
    is_hashdiff: true
    columns:
      - bezeichnung
      - umfang
      - typ
      - preis
      - pflanzort
      - pflanzabstand

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}