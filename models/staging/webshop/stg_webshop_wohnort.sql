{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "base_webshop_wohnort"
ldts: "ldts"
rsrc: "!WEBSHOP"

hashed_columns:
  # Hub Kunde
  hk_kunde_h:
    - kundeid

  # Multi-Active Satellite Hashdiff
  hd_kunde_wohnort_s:
    is_hashdiff: true
    columns:
      - von
      - bis
      - strasse
      - hausnummer
      - adresszusatz
      - plz
      - ort
      - land

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}