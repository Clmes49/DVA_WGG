{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_lieferung'
ldts: 'ldts'
rsrc: '!WEBSHOP'

hashed_columns:
  # Hubs
  hk_bestellung_h:
    - bestellungid

  hk_lieferadresse_h:
    - lieferadrid

  hk_lieferdienst_h:
    - lieferdienstid

  # Link Position
  hk_position_l:
    - bestellungid
    - posid

  # Link Lieferung
  hk_lieferung_l:
    - bestellungid
    - posid
    - lieferadrid
    - lieferdienstid

  # Satellite
  hd_lieferung_s:
    is_hashdiff: true
    columns:
      - lieferdatum

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}