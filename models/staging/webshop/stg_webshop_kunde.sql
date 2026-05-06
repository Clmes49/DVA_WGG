{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_kunde'
ldts: 'ldts'
rsrc: '!WEBSHOP'
hashed_columns:
  # Hub für Kunde
  hk_kunde_h:
    - kundeid
  
  # Hub für Vereinspartner
  hk_vereinspartner_h:
    - vereinspartnerid
  
  # Link zwischen Kunde und Vereinspartner
  hk_kunde_vereinspartner_l:
    - kundeid
    - vereinspartnerid
  
  # Satellites
  hd_kunde_s:
    is_hashdiff: true
    columns:
      - vorname
      - name
      - geschlecht
      - geburtsdatum
      - telefon
      - mobil
      - email
  
  hd_kunde_zahlung_s:
    is_hashdiff: true
    columns:
      - kreditkarte
      - gueltigbis
      - kkfirma

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}