{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_position'
ldts: 'ldts'
rsrc: '!WEBSHOP'

hashed_columns:
  hk_bestellung_h:
    - bestellungid

  hk_produkt_h:
    - produktid

  hk_position_l:
    - bestellungid
    - posid
    - produktid

  hd_position_s:
    is_hashdiff: true
    columns:
      - spezlieferadrid
      - menge
      - preis
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}