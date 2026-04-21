{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "base_webshop_wohnort"
ldts: "ldts"
rsrc: "!WEBSHOP"

hashed_columns:
  # Gleicher Hub-Hash wie bei Kunde (für Zuordnung)
  hk_kunde_h:
    - "kunde_id"

  # Multi-Active Satellite: Wohnort
  hd_kunde_wohnort_s:
    is_hashdiff: true
    columns:
      - "strasse"
      - "hausnummer"
      - "adresszusatz"
      - "plz"
      - "ort"
      - "land"

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}