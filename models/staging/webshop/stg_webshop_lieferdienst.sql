{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_lieferdienst'
ldts: 'ldts'
rsrc: '!WEBSHOP'

hashed_columns:
  hk_lieferdienst_h:
    - lieferdienstid

  hd_lieferdienst_s:
    is_hashdiff: true
    columns:
      - name
      - telefon
      - fax
      - email
      - hausnummer
      - plz
      - ort
      - land

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}