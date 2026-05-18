{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'base_roadshow_rsbestellung'
ldts: 'ldts'
rsrc: '!ROADSHOW'
hashed_columns:
  # Hubs
  hk_bestellung_h:
    - bestellungid

  hk_produkt_h:
    - produktid

  hk_kunde_h:
    - kundeid

  hk_vereinspartner_h:
    - vereinspartnerid

  # Links
  hk_bestellung_kunde_l:
    - bestellungid
    - kundeid

  hk_bestellung_vereinspartner_l:
    - bestellungid
    - vereinspartnerid
  
  hk_rs_position_l:
    - bestellungid
    - produktid

  hk_kunde_vereinspartner_l:    
    - vereinspartnerid
    - kundeid

  hd_rsbestellung_s:
    is_hashdiff: true
    columns:
      - kaufdatum
      - kreditkarte
      - gueltigbis
      - kkfirma

  hd_rsposition_s:
    is_hashdiff: true
    columns:
      - menge
      - preis
      - rabatt
{%- endset -%}

{{ datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
) }}