{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: "base_roadshow_kunde"
ldts: "ldts"
rsrc: "!ROADSHOW"
hashed_columns:
  hk_kunde_h:
    - kundeid
  hd_kunde_s:
    is_hashdiff: true
    columns:
      - vereinspartnerid
      - vorname
      - name
      - geschlecht
      - geburtsdatum
      - telefon
      - mobil
      - email
      - kreditkarte
      - gueltigbis
      - kkfirma
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}