{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_bestellung'
ldts: 'ldts'
rsrc: '!WEBSHOP'
hashed_columns:
  # Hubs
  hk_bestellung_h:
    - bestellungid

  hk_kunde_h:
    - kundeid

  hk_lieferadresse_h:
    - lieferadrid

  # Links
  hk_bestellung_kunde_l:
    - bestellungid
    - kundeid

  hk_bestellung_lieferadresse_l:
    - bestellungid
    - lieferadrid
 
  # Satellite
  hd_wsbestellung_s:
    is_hashdiff: true
    columns:
      - bestelldatum
      - wunschdatum
      - rabatt
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}