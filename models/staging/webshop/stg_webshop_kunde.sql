-- Stage Model: stg_webshop_kunde
-- Schicht:   Staging, Stufe 2 von 2
-- Quelle:    base_webshop_kunde
-- Zweck:     Generierung aller Hash-Keys und Hash-Diffs für Hubs, Links und Satellites via datavault4dbt
 
{{ config(materialized='view') }} -- Materialisierung als View

{%- set yaml_metadata -%}
source_model: "base_webshop_kunde" # Referenz auf das Base Model
ldts: "ldts" # Load Date Timestamp Spalte
rsrc: "!WEBSHOP" # Recorde Source: "!" = Hardcodiert 
hashed_columns:
  # Hub für Kunde
  hk_kunde_h:  # Hub Hash Key basiert auf dem Business Key "kundeid"
    - "kundeid"
  
  # Hub für Vereinspartner
  hk_vereinspartner_h: # Hub Hash Key basiert auf "vereinspartnerid"
    - "vereinspartnerid"
  
  # Link zwischen Kunde und Vereinspartner
  hk_kunde_vereinspartner_l: # Link Hash Key aus der Kombination von "kundeid" und "vereinspartnerid"
    - "kundeid"
    - "vereinspartnerid"
  
  # Satellites
  hd_kunde_s: # Hash Diff für Kunde-Stammdaten Satellite
    is_hashdiff: true # generiert einen MD5-Hash über alle Spalten zur Erkennung von Änderungen
    columns:
      - "vorname"
      - "name"
      - "geschlecht"
      - "geburtsdatum"
      - "telefon"
      - "mobil"
      - "email"
  
  hd_kunde_zahlung_s: # Hash Diff für Kunde-Zahlungsdaten Satellite
    is_hashdiff: true # generiert einen MD5-Hash über alle Spalten zur Erkennung von Änderungen
    columns:
      - "kreditkarte"
      - "gueltigbis"
      - "kkfirma"

{%- endset -%}
-- Aufruf des datavault4dbt Stage-Makros
-- include_source_columns=true: Alle Originalspalten werden übernommen
-- yaml_metadata=yaml_metadata: Übergibt die Hash Definitionen von oben
{{ datavault4dbt.stage(
    include_source_columns=true, 
    yaml_metadata=yaml_metadata 
    
) }}