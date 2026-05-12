{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "base_webshop_lieferadresse"
ldts: "ldts"
rsrc: "!WEBSHOP"
hashed_columns:
  # Hub für Kunde und Lieferadresse
  hk_kunde_h:
    - "kundeid"
  hk_lieferadresse_h:
    - lieferadrid

  # Link zwischen lieferadresse und kunde
  hk_kunde_lieferadresse_l:
    - "KundeID"
    - lieferadrid
    
  
  # Satellites
  hd_lieferadresse_s:
    is_hashdiff: true
    columns:
      - "Strasse"
      - "Hausnummer"
      - "Adresszusatz"
      - "Plz"
      - "Ort"
      - "Land"

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}