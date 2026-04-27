{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "base_webshop_lieferadresse"
ldts: "ldts"
rsrc: "!WEBSHOP"
hashed_columns:
  # Hub für lieferadresse
  hk_lieferadresse_h:
    - "LieferAdrID"

  # Link zwischen lieferadresse und kunde
  lk_kunde_vereinspartner:
    - "LieferAdrID"
    - "KundeID"
  
  # Satellites
  hd_kunde_s:
    is_hashdiff: true
    columns:
      - "Strasse"
      - "Hausummer"
      - "Adresszusatz"
      - "Plz"
      - "Ort"
      - "Land"

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}