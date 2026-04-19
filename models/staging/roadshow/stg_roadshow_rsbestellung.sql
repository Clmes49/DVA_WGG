{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_roadshow_rsbestellung'
ldts: 'ldts'
rsrc: '!ROADSHOW'
hashed_columns:
  hk_bestellung_h:
    - bestellungid

  hk_produkt_h:
    - produktid

  hk_kunde_h:
    - kundeid

  hk_vereinspartner_h:
    - vereinspartnerid

  hk_rsbestellung_l:
    - bestellungid
    - produktid
    - kundeid
    - vereinspartnerid

  hd_rsbestellung_s:
    is_hashdiff: true
    columns:
      - kaufdatum
      - kreditkarte
      - gueltigbis
      - kkfirma
      - menge
      - preis
      - rabatt
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}