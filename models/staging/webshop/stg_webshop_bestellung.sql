{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_bestellung'
ldts: 'ldts'
rsrc: '!WEBSHOP'
hashed_columns:
  hk_bestellung_h:
    - bestellungid

  hk_kunde_h:
    - kundeid

  hk_AllgLieferAdr_h:
    - AllgLieferAdrID

  hk_wsbestellung_l:
    - bestellungid
    - AllgLieferAdrID
    - kundeid

  hd_wsbestellung_s:
    is_hashdiff: true
    columns:
      - Bestelldatum
      - Wunschdatum
      - Rabatt
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}