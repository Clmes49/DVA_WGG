{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_webshop_vereinspartner'
ldts: 'ldts'
rsrc: '!WEBSHOP'

hashed_columns:
  # Hubs
  hk_vereinspartner_h:
    - vereinspartnerid

  hk_kunde_h:
    - kundeid

  # Link
  hk_vereinspartner_ansprechpartner_l:
  - vereinspartnerid
  - kundeid

  # Satellite
  hd_vereinspartner_s:
    is_hashdiff: true
    columns:
      - rabatt1
      - rabatt2
      - rabatt3

{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}